package com.financing.service.impl;

import com.financing.dao.UserDao;
import com.financing.entity.User;
import com.financing.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/14.
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public User getUser(String mobile) {
        try {
            User user =userDao.queryByMobile(mobile);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
    public User getUserByUsername(String username){
        try {
            return userDao.queryByName(username);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public Boolean addUser(User user) {
        try {
            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User updateUser(User user) {
        try {
            userDao.update(user);
            return  userDao.queryById(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }

    }

    @Override
    public Boolean deleteUser(String id) {
        try {
            userDao.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getUserList() {
        try {
            return userDao.queryAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
