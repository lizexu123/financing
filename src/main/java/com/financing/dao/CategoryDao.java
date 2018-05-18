package com.financing.dao;

import com.financing.entity.Category;

import java.util.List;

/**
 * Created by Penny on 2018/5/16.
 */
public interface CategoryDao {
    List<Category> queryAll() throws Exception;
}
