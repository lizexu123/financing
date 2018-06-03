package com.financing.dao;

import com.financing.entity.Category;

import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/16.
 */
public interface CategoryDao {
    List<Category> queryAll() throws Exception;
    List<Map<String,Object>> queryStatistic();
    void insert(Category category);
}
