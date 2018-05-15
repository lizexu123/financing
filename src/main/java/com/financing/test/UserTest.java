package com.financing.test;

import com.financing.dao.UserDao;
import com.financing.entity.User;
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
public class UserTest {
    @Autowired
    private UserDao userDao;

    @Autowired
    private UserService userService;
    /**
     * 测试添加用户
     */
    @Test
    public void testAddUser(){

        User user = new User();
        user.setMobile("17864296511");
        user.setPassword("123456");

        try {
            userDao.insert(user);
            System.out.println(user.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 测试注册时用户账号是否已存在
     */
    @Test
    public void testIsExistUser(){
        User user = new User();
        String mobile = "17864296511";
        user.setMobile(mobile);
//        user.setPassword("123456");

        user =userService.getUser(mobile);
        System.out.println(user.toString());
    }


}
