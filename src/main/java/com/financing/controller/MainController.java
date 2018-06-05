package com.financing.controller;

import org.springframework.stereotype.Controller;
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
     *
     * @return 重定向到首页
     */
    @RequestMapping(value = "/")
    public String welcome() {
        return "redirect:index";
    }

    /**
     * 首页
     *
     * @return
     */
    @RequestMapping(value = "/index")
    public String index() {
        return "index";
    }

    /**
     * 注册登录页
     *
     * @return
     */
    @RequestMapping(value = "/login")
    public String login() {
        return "login";
    }

    @RequestMapping(value = "/register")
    public String register() {
        return "register";
    }

    /**
     * 最新发布
     *
     * @return
     */
    @RequestMapping(value = "/browse/new")
    public String newProject() {
        return "forward:/doShowNewProject";
    }

    /**
     * 最多支持
     *
     * @return
     */
    @RequestMapping(value = "/browse/hot")
    public String hotProject() {
        return "forward:/doShowHotProject";
    }

    /**
     * 全部项目
     *
     * @return
     */
    @RequestMapping(value = "/browse/all")
    public String allProject() {
        return "forward:/doProjectAll";
    }

    /**
     * 分类项目展示
     *
     * @param cid
     * @return
     */
    @RequestMapping(value = "/browse/sort-{cid}", method = RequestMethod.GET)
    public String ProjectByCID(@PathVariable("cid") String cid) {
        return "forward:/doProjectByCID-" + cid;
    }

    /**
     * 根据关键字查询项目
     *
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/browse/search-{keyword}")
    public String ProjectByKey(@PathVariable("keyword") String keyword) {
        return "forward:/doProjectByKey-" + keyword;
    }

    /**
     * 个人中心页
     *
     * @return
     */
    @RequestMapping(value = "/personCenter")
    public String personCenter() {
        return "person_center";
    }

    /**
     * 个人资料页
     */
    @RequestMapping(value = "/personInfo")
    public String personData() {
        return "person_info";
    }


    /**
     * 个人中心-个人资料页
     *
     * @return
     */

    @RequestMapping(value = "/personCenter/personInfo")
    public String personInfo() {
        return "person_info";
    }


    /**
     * 发布项目页
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/projectCreate")
    public String projectCreate() {
        return "project_create";
    }

    /**
     * 用户项目管理页
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personProject")
    public String personProject() {
        return "person_project";
    }

    /**
     * 用户项目管理页：项目信息
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personProject/info-{pid}")
    public String personProjectInfo(@PathVariable("pid") String pid) {
        return "forward:/doProjectInfo-" + pid;
    }

    /**
     * 用户收货地址页
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personAddress")
    public String personAddress() {
        return "person_address";
    }

    /**
     * 用户订单
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personOrder")
    public String personOrder() {
        return "person_order";
    }

    /**
     * 用户订单详情
     *
     * @param oid
     * @return
     */
    @RequestMapping(value = "/personCenter/personOrder/detail-{oid}")
    public String personOrderDetail(@PathVariable("oid") String oid) {
        return "forward:/doGetOrderDetail-" + oid;
    }

    /**
     * 用户收藏
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personInterest")
    public String personInterest() {
        return "person_interest";
    }

    /**
     * 用户评论
     *
     * @return
     */
    @RequestMapping(value = "/personCenter/personComment")
    public String personComment() {
        return "person_comment";
    }

    /**
     * 项目详情页
     *
     * @param pid
     * @return
     */
    @RequestMapping(value = "/ProjectDetail")
    public String projectDetail(@PathVariable("pid") String pid) {
        return "project_Detail";
    }
}
