package com.financing.controller;

import com.financing.entity.User;
import com.financing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * @author Penny
 */
@Controller
public class UserController {

    @Autowired
    private UserService userService;


    /**
     * 用户登录
     * @param request
     * @param response
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    public ModelAndView doLogin(HttpServletRequest request, HttpServletResponse response){
        String account = request.getParameter("account");
        String password = request.getParameter("password");

        ModelAndView mv = new ModelAndView();
        User user =userService.getUser(account);
        if (user==null){
            mv.setViewName("login");
            mv.addObject("flag","fail");
            mv.addObject("msg","user unexist");
            return mv;
        }else {
            if (!user.getPassword().equals(password)){
                mv.setViewName("login");
                mv.addObject("flag","fail");
                mv.addObject("msg","password error");
                return mv;
            }else{
                request.getSession().setAttribute("user",user);
                mv.setViewName("redirect:/index");
                mv.addObject("flag","success");
                mv.addObject("uid",user.getId());
                return mv;
            }
        }
    }

    /**
     * 用户注册
     * @param request
     * @param response
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doRegister",method = RequestMethod.POST)
    public ModelAndView doRegister(HttpServletRequest request,HttpServletResponse response){
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        User user = new User();
        user.setMobile(mobile);
        user.setPassword(password);
        ModelAndView mv = new ModelAndView();
        if (userService.getUser(mobile)!=null){
            mv.setViewName("login");
            mv.addObject("flag","fail");
            mv.addObject("msg","mobile exist");
            return mv;
        }else {
            if(!userService.addUser(user)){
                mv.setViewName("login");
                mv.addObject("flag","fail");
                mv.addObject("msg","unknown error");
                return mv;
            }else{
                mv.setViewName("redirect:/index");
                mv.addObject("flag","success");
                mv.addObject("msg","go login");
                return mv;
            }
        }
    }

    /**
     * 退出登录
     * @param session
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/index";
    }

//    @RequestMapping
//    public ModelAndView editUserInfo(HttpServletRequest request,HttpServletResponse response){
//
//    }
}
