package com.financing.dao;

import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/13.
 */
public interface UserDao {
    void insert(User user) throws Exception;
    void update(User user) throws Exception;
    void delete(String id)throws Exception;
    User queryById(String id) throws Exception;
    List<User> queryAll() throws Exception;
    User queryByMobile(String mobile)throws Exception;
    User queryByName(String username)throws Exception;
    long queryTotal();//查询用户总数
}
