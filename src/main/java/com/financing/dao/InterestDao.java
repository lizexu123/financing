package com.financing.dao;

import com.financing.entity.Interest;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
public interface InterestDao {

    void insert(Interest interest);//添加收藏
    List<Interest> queryByUser(User user);//查询用户收藏的项目列表
    void delete(int id);//取消收藏
}
