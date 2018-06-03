package com.financing.controller;

import com.financing.entity.User;
import com.financing.service.UserService;
import com.financing.utils.FileUploadUtil;
import com.financing.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
     * test
     * @return
     */
    @RequestMapping(value = "/doTest")
    @ResponseBody
    public Map<String,Object> test(){
        Map<String,Object> result = new HashMap<String, Object>();
        User user = new User();
        user.setUsername("Penny");
        user.setPassword("123456");
        user.setEmail("1183346011@qq.com");
        result.put("flag",SUCCESS_CODE);
        result.put("msg","test");
        result.put("data",user);

        return result;
    }


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
        System.out.println("password = " + password);
        System.out.println("mobile = " + mobile);
        password = Md5Util.getMD5String(password);//md5加密
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
        password = Md5Util.getMD5String(password);//md5值加密
        User user = new User();
        user.setMobile(mobile);
        user.setPassword(password);
//        user.setStatus((byte) 0);
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
                user = userService.getUser(mobile);
                request.getSession().setAttribute("user",user);
                result.put("flag",SUCCESS_CODE);
                result.put("msg","register success!");
                result.put("data",user);
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
    @RequestMapping(value = "/doModifyUserInfo")
    @ResponseBody
    public Map<String,Object> doModifyUserInfo(@RequestParam MultipartFile avatarUpload,HttpServletRequest request,HttpSession session){

        Map<String,Object> result = new HashMap<String, Object>();
        User user = (User) request.getSession().getAttribute("user");
        String avatar = FileUploadUtil.uploadFile(avatarUpload,session);
        if(avatar!=""){
            //上传新头像
            user.setAvatar(avatar);
        }
        user.setUsername(request.getParameter("username"));
        user.setEmail(request.getParameter("email"));
        user.setGender(request.getParameter("gender"));
        user.setZone(request.getParameter("zone"));
        user.setIntro(request.getParameter("intro"));

//        System.out.println("user = " + user.getUsername());
//        System.out.println("user1 = " + userService.getUserByUsername(user.getUsername()));

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
            result.put("data", null);
            System.out.println("ok");
            return result;
        }
    }


    /**
     * 身份证信息验证
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
        System.out.println("user = " + user);
        System.out.println("realName = " + realName);
        if(userService.verifyIdCard(ic)){//验证成功
            user.setRealName(realName);
            user.setIc(ic);
            user.setStatus((byte) 1);
            System.out.println("ic = " + ic);
            user = userService.updateUser(user);
            session.setAttribute("user",user);//更新用户会话

            result.put("flag",SUCCESS_CODE);
            result.put("msg","certificate success");
            return result;
        }else{
            result.put("flag",FAIL_CODE);
            result.put("msg","certificate fail");
            return result;
        }
    }

}
