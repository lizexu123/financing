package com.financing.dao;

import com.financing.entity.Order;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
public interface OrderDao {

    void insert(Order order);
    List<Order> queryByStatus(Byte status);
    void updateByStatus(String id);
    List<Order> queryAll();
    List<Order> queryByUser(User user);
    Order queryById(String id);
}
