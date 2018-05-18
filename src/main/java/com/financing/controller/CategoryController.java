package com.financing.controller;

import com.financing.entity.Category;
import com.financing.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Penny
 */
@Controller
public class CategoryController {

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    @Autowired
    private CategoryService categoryService;

    /**
     * 显示全部分类列表
     * @return
     */
    @RequestMapping(value = "/doShowCategory",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doShowCategory(){
        Map<String,Object> result = new HashMap<>();
        List<Category> categories = categoryService.getCategoryList();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",categories);
        return result;
    }
}
