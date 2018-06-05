package com.financing.service;

import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */
public interface OrderService {
    void addOrder(Order order);
    List<Order> getOrderListByUser(User user);
    List<Order> getOrderListByProject(Project project);
//    void cancelOrder(Order order);//用户取消订单
    Order getOrderDetail(String id);
    long getOrderTotal();
    List<Order> getOrderList();
    List<Order> getOrderListByPStatus(Byte status);
    void refundOrder(Order order);//退款
    List<Map<String,Object>> getOrderStatistic();
}
