package com.financing.dao;

import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */
public interface OrderDao {

    void insert(Order order);
    List<Order> queryByStatus(Byte status);
    void updateByStatus(Order order);
    List<Order> queryAll();
    List<Order> queryByProject(Project project);
    List<Order> queryByUser(User user);
    Order queryById(String id);
    long queryTotal();//查询订单总数
    List<Order> queryByProjectStatus(Byte status);
    List<Object> queryOrderStatistic();

}
