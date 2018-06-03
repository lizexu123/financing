package com.financing.service.impl;

import com.financing.dao.OrderDao;
import com.financing.entity.Order;
import com.financing.entity.User;
import com.financing.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order) {
        orderDao.insert(order);
    }

    @Override
    public List<Order> getOrderListByUser(User user) {
        return orderDao.queryByUser(user);
    }

    @Override
    public void cancelOrder(String id) {
        orderDao.updateByStatus(id);
    }

    @Override
    public Order getOrderDetail(String id) {
        return orderDao.queryById(id);
    }

    @Override
    public long getOrderTotal() {
        return orderDao.queryTotal();
    }

    @Override
    public List<Order> getOrderList() {
        return orderDao.queryAll();
    }
}
