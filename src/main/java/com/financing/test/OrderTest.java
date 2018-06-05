package com.financing.test;

import com.financing.dao.UserDao;
import com.financing.entity.User;
import com.financing.service.OrderService;
import com.financing.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 * Created by Penny on 2018/5/13.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/applicationContext.xml"})
public class OrderTest {
    @Autowired
    private OrderService orderService;
    /**
     * 测试添加用户
     */
    @Test
    public void testOrderStatistic(){

        System.out.println(orderService.getOrderStatistic());
    }



}
