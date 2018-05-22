package com.financing.service;

import com.financing.entity.Order;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
public interface OrderService {
    void addOrder(Order order);
    List<Order> getOrderListByUser(User user);
    void cancelOrder(String id);
    Order getOrderDetail(String id);
}
