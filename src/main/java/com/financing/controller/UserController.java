package com.financing.controller;

import com.financing.entity.User;
import com.financing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


/**
 * @author Penny
 */
@Controller
public class UserController {

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    @Autowired
    private UserService userService;


    /**
     * 用户登录操作
     * @param request
     * @param response
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doLogin(HttpServletRequest request, HttpServletResponse response){
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        Map<String,Object> result = new HashMap<String, Object>();
        User user =userService.getUser(mobile);
        if (user==null){
            result.put("flag",FAIL_CODE);
            result.put("msg","user unexist");
            result.put("data","");
            return result;
        }else {
            if (!user.getPassword().equals(password)){
                result.put("flag",FAIL_CODE);
                result.put("msg","password error");
                result.put("data","");
                return result;
            }else{
                request.getSession().setAttribute("user",user);
                result.put("flag",SUCCESS_CODE);
                result.put("msg","login success");
                result.put("data",user);
                return result;
            }
        }
    }

    /**
     * 用户注册操作
     * @param request
     * @param response
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doRegister",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doRegister(HttpServletRequest request,HttpServletResponse response){
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        User user = new User();
        user.setMobile(mobile);
        user.setPassword(password);
        user.setStatus((byte) 0);
        Map<String,Object> result = new HashMap<String, Object>();
        if (userService.getUser(mobile)!=null){
            result.put("flag",FAIL_CODE);
            result.put("msg","mobile exist");
            result.put("data","");
            return result;
        }else {
            if(!userService.addUser(user)){
                result.put("flag",FAIL_CODE);
                result.put("msg","unknown error");
                result.put("data","");
                return result;
            }else{
                result.put("flag",SUCCESS_CODE);
                result.put("msg","register success! go login");
                result.put("data","");
                return result;
            }
        }
    }

    /**
     * 退出登录操作
     * @param session
     * @return
     * @author Penny
     */
    @RequestMapping("/doLogout")
    public String doLogout(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }

    /**
     * 修改个人信息操作
     * @param avatarUpload
     * @param request
     * @param session
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doModifyUserInfo",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doModifyUserInfo(@RequestParam MultipartFile avatarUpload,HttpServletRequest request,HttpSession session){

        Map<String,Object> result = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("user");

        String avatar = uploadAvatar(avatarUpload,user.getId(),session);


        user.setAvatar(avatar);
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setGender(request.getParameter("gender"));
        user.setZone(request.getParameter("zone"));
        user.setIntro(request.getParameter("intro"));

        if(userService.getUserByUsername(user.getUsername())!=null){
            result.put("flag",FAIL_CODE);
            result.put("msg","this username existed");
            result.put("data","");
            return result;
        }else{
            user = userService.updateUser(user);
            session.setAttribute("user",user);
            result.put("flag",SUCCESS_CODE);
            result.put("msg","modify success");
            result.put("data",user);
            return result;
        }
    }

    /**
     * 用户上传头像 通过修改个人信息调用
     * @param avatarUpload
     * @param id
     * @param session
     * @return
     * @author Penny
     */
    public String uploadAvatar(MultipartFile avatarUpload, String id, HttpSession session){
        try {
            String avatar = "";
            if (avatarUpload!=null&&!avatarUpload.isEmpty()){
                String fileRealPath = session.getServletContext().getRealPath("/res/image_upload");
                String fileName = "avatar_"+id+".jpg";
                File fileFolder = new File(fileRealPath);
                if (!fileFolder.exists()){
                    fileFolder.mkdirs();
                }
                System.out.println(fileRealPath+"/"+fileName);
                File file = new File(fileFolder,fileName);
                avatarUpload.transferTo(file);
                avatar = "/image_upload/"+fileName;
            }
            return avatar;
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }


    /**
     * 实名认证
     * @param realName
     * @param ic
     * @param session
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doCertificate",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doCertificate(String realName,String ic,HttpSession session){
        Map<String,Object> result = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        user.setRealName(realName);
        user.setIc(ic);
        user.setStatus((byte) 1);
        user = userService.updateUser(user);
        result.put("flag",SUCCESS_CODE);
        result.put("msg","certificate success");
        result.put("data",user);

        return result;

    }

}
