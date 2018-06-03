package com.financing.controller;

import com.financing.entity.*;
import com.financing.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 后台管理
 * @author Penny
 */
@Controller
public class backManageController {

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;


    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private CategoryService categoryService;

    /**
     * 后台管理主页，判断管理员是否已登录
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin")
    public String admin(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_index";
        }
    }

    /**
     * 管理员登录
     * @param request
     * @return
     */
    @RequestMapping(value = "/doAdminLogin",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> adminLogin(HttpServletRequest request) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = adminService.getAdmin(username);
        Map<String, Object> result = new HashMap<String, Object>();
        if (admin == null) {
            result.put("flag", FAIL_CODE);
            result.put("msg", "admin unexist");
            return result;
        } else {
            if (!admin.getPassword().equals(password)) {
                result.put("flag", FAIL_CODE);
                result.put("msg", "password error");
                return result;
            } else {
                request.getSession().setAttribute("admin", admin);
                result.put("flag", SUCCESS_CODE);
                result.put("msg", "login success");
                return result;
            }
        }
    }

    /**
     * 管理员退出登录
     * @param session
     * @return
     */
    @RequestMapping(value = "/doAdminLogout")
    public String adminLogout(HttpSession session){
        session.invalidate();
        return "redirect:/admin";
    }

    /**
     * 用户管理页
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/userProfile")
    public String bmUserProfile(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_userProfile";
        }
    }

    /**
     * 用户黑名单页
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/userBlack")
    public String bmUserBlack(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_userBlack";
        }
    }

    /**
     * 项目种类页
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/category")
    public String bmCategory(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_category";
        }
    }

    /**
     * 项目管理页
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/projectProfile")
    public String bmProjectProfile(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_projectProfile";
        }
    }

    /**
     * 订单管理页
     * @param session
     * @return
     */
    @RequestMapping(value = "/admin/order")
    public String bmOrder(HttpSession session){
        Admin admin = (Admin) session.getAttribute("admin");
        if (admin==null){
            return "bm_login";
        }else{
            return "bm_order";
        }
    }


    /**
     * 用户总数
     * 项目总数
     * 订单总数
     * @return
     */
    @RequestMapping(value = "/doTotal")
    @ResponseBody
    public Map<String,Object> doTotal(){
        Map<String, Object> result = new HashMap<String, Object>();
        long projectTotal = projectService.getProjectCount();
        long userTotal = userService.getUserTotal();
        long orderTotal = orderService.getOrderTotal();
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("project",projectTotal);
        data.put("user",userTotal);
        data.put("order",orderTotal);
        result.put("flag",SUCCESS_CODE);
        result.put("data",data);

        return result;

    }

    /**
     * 管理员添加用户
     * @param request
     * @return
     */
    @RequestMapping(value = "/doAddUser",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddUser(HttpServletRequest request){
        Map<String, Object> result = new HashMap<String, Object>();
        String mobile = request.getParameter("mobile");
        String password = request.getParameter("password");
        User user = new User();
        user.setMobile(mobile);
        user.setPassword(password);
        if (userService.getUser(mobile)!=null){
            result.put("flag",FAIL_CODE);
            result.put("msg","this mobile is registered");
            return result;
        }else {
            userService.addUser(user);
            result.put("flag",SUCCESS_CODE);
            result.put("msg","success");
            return result;
        }
    }

    /**
     * 管理员获取用户列表
     * @return
     */
    @RequestMapping(value = "/doGetUserList")
    @ResponseBody
    public Map<String,Object> doGetUserList(){
        Map<String, Object> result = new HashMap<String, Object>();
        List<User> users = userService.getUserList();
        result.put("flag",SUCCESS_CODE);
        result.put("data",users);
        return result;
    }

    /**
     * 管理员将用户移至黑名单
     * @param id
     * @return
     */
    @RequestMapping(value = "/doUserBlack-{id}")
    @ResponseBody
    public Map<String,Object> doUserBlack(@PathVariable("id") String id){
        Map<String, Object> result = new HashMap<String, Object>();
        if (userService.deleteUser(id)){
            result.put("flag",SUCCESS_CODE);
            result.put("msg","success");
            return result;
        }else{
            result.put("flag",FAIL_CODE);
            result.put("msg","fail");
            return result;
        }
    }

    /**
     * 管理员将用户移出黑名单
     * @param id
     * @return
     */
    @RequestMapping(value = "/doUserOutBlack-{id}")
    @ResponseBody
    public Map<String,Object> doUserOutBlack(@PathVariable("id") String id){
        Map<String, Object> result = new HashMap<String, Object>();
        if (userService.moveOutBlack(id)){
            result.put("flag",SUCCESS_CODE);
            result.put("msg","move out success");
            return result;
        }else{
            result.put("flag",FAIL_CODE);
            result.put("msg","move out fail");
            return result;
        }
    }

    /**
     * 管理员获取项目种类统计
     * @return
     */
    @RequestMapping(value = "/doCategoryStatistic")
    @ResponseBody
    public Map<String,Object> doCategoryStatistic(){
        Map<String, Object> result = new HashMap<String, Object>();
        List<Map<String,Object>> data =  categoryService.getStatistic();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",data);
        return result;

    }

    /**
     * 添加项目种类
     * @param name
     * @return
     */
    @RequestMapping(value = "/doAddCategory")
    @ResponseBody
    public Map<String,Object> doAddCategory(@RequestParam String name){
        Category category = new Category();
        category.setName(name);
        categoryService.addCategory(category);

        Map<String, Object> result = new HashMap<String, Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        return result;
    }

    /**
     * 管理员获取所有项目列表
     * @return
     */
    @RequestMapping(value = "/doGetProjectList")
    @ResponseBody
    public Map<String,Object> doGetProjectList(){
        Map<String, Object> result = new HashMap<String, Object>();
        List<Project> projects = projectService.getProjectList();
        result.put("flag",SUCCESS_CODE);
        result.put("data",projects);
        return result;
    }

    /**
     * 管理员获取订单列表
     * @return
     */
    @RequestMapping(value = "/doGetOrderList")
    @ResponseBody
    public Map<String,Object> doGetOrderList(){
        Map<String, Object> result = new HashMap<String, Object>();
        List<Order> orders = orderService.getOrderList();
        result.put("flag",SUCCESS_CODE);
        result.put("data",orders);
        return result;
    }
}
