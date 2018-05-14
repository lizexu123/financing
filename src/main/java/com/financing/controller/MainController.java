package com.financing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Penny
 * 页面分发控制
 */
@Controller
public class MainController {

    /**
     * 欢迎页面
     * @return 重定向到首页
     */
    @RequestMapping(value = "/")
    public String welcome(){
        return "redirect:index";
    }

    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "index";
    }

    /**
     * 注册登录页
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(){
        return "login";
    }



}
