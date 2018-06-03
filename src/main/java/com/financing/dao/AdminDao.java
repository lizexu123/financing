package com.financing.dao;

import com.financing.entity.Admin;

/**
 * Created by Penny on 2018/5/31.
 */
public interface AdminDao {
    Admin queryByName(String username);
}
