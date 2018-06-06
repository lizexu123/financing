package com.financing.controller;

import com.financing.entity.*;
import com.financing.service.OrderService;
import com.financing.service.ProjectBackService;
import com.financing.service.ProjectService;
import com.financing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */

@Controller
public class OrderController {

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProjectService projectService;

    @Autowired
    private ProjectBackService projectBackService;

    @Autowired
    private UserService userService;

    /**
     * 添加订单
     * @param request
     * @return
     */
    @RequestMapping(value = "/doAddOrder",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddOrder(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        int addressId = Integer.parseInt(request.getParameter("address"));
        Address address = new Address();
        address.setId(addressId);
        String projectId = request.getParameter("project");
        Project project = new Project();
        project.setId(projectId);
        int backId = Integer.parseInt(request.getParameter("project_back"));
        ProjectBack back = new ProjectBack();
        back.setId(backId);
        BigDecimal amount = BigDecimal.valueOf(Double.parseDouble(request.getParameter("amount")));

        Order order = new Order();
        order.setAddress(address);
        order.setCreateTime(new Date());
        order.setProject(project);
        order.setProjectBack(back);
        order.setAmount(amount);
        order.setStatus((byte) 0);
        order.setUser(user);

        orderService.addOrder(order);
        projectBackService.updateActual(back,1);//回报实际参与人数加一
        projectService.updateSupport(project,amount,1);//项目支持数加一,更新实际融资数
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data","");
        return result;
    }


    /**
     * 用户查看订单列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doGetOrder",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doGetOrder(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Order> orders = orderService.getOrderListByUser(user);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",orders);
        return result;
    }


    /**
     * 用户取消订单
     * @param session
     * @param oid
     * @return
     */
    @RequestMapping(value = "/doCancelOrder-{oid}")
    @ResponseBody
    public Map<String,Object> doCancelOrder(HttpSession session, @PathVariable("oid") String oid){
        User user = (User) session.getAttribute("user");
        Order order = orderService.getOrderDetail(oid);
        ProjectBack back =  order.getProjectBack();
        Project project = order.getProject();
        order.setStatus((byte) -1);
        orderService.refundOrder(order);//用户取消订单，退款
        userService.refundBalance(user,order.getAmount());
        projectBackService.updateActual(back,-1);
        projectService.updateSupport(project,order.getAmount(),-1);
        user = userService.getUser(user.getMobile());
        session.setAttribute("user",user);
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data","");
        return result;
    }


    /**
     * 订单详情
     * @param map
     * @param oid
     * @return
     */
    @RequestMapping(value = "/doOrderDetail-{oid}")
    public String doOrderDetail(ModelMap map, @PathVariable("oid") String oid){
        Order order = orderService.getOrderDetail(oid);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",order);
        map.addAllAttributes(result);

        return "person_orderDetail";
    }

}
