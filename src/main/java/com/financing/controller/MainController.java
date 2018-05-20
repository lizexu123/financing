package com.financing.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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

    /**
     * 最新发布
     * @return
     */
    @RequestMapping(value = "/browse/new")
    public String newProject(){
        return "forward:/doShowNewProject";
    }

    /**
     * 最多支持
     * @return
     */
    @RequestMapping(value = "/browse/hot")
    public String hotProject(){
        return "forward:/doShowHotProject";
    }

    /**
     * 全部项目
     * @return
     */
    @RequestMapping(value = "/browse/all")
    public String allProject(){
        return "forward:/doProjectAll";
    }

    /**
     * 分类项目展示
     * @param cid
     * @return
     */
    @RequestMapping(value = "/browse/sort-{cid}",method = RequestMethod.GET)
    public String ProjectByCID(@PathVariable("cid") String cid){
        return "forward:/doProjectByCID-"+"{"+cid+"}";
    }

    /**
     * 根据关键字查询项目
     * @param keyword
     * @return
     */
    @RequestMapping(value ="/browse/search-{keyword}")
    public String ProjectByKey(@PathVariable("keyword") String keyword){
        return "forward:/doProjectByKey-{keyword}";
    }

    /**
     * 个人中心页
     * @return
     */
    @RequestMapping(value = "/personCenter")
    public String personCenter(){
        return "person_center";
    }

    /**
     * 发布项目页
     * @return
     */
    @RequestMapping(value = "/projectCreate")
    public String projectCreate(){
        return "project_create";
    }

}
