package com.financing.service.impl;

import com.financing.dao.CategoryDao;
import com.financing.entity.Category;
import com.financing.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/16.
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> getCategoryList() {
        try {
            return categoryDao.queryAll();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
