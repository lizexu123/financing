package com.financing.service;

import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/13.
 */

public interface UserService {
    User getUser(String mobile);
    User getUserByUsername(String username);
    Boolean addUser(User user);
    User updateUser(User user);
    Boolean deleteUser(String id);
    List<User> getUserList();

}
