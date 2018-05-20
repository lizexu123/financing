package com.financing.dao;

import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/16.
 */
public interface ProjectDao {
    void insert(Project project) throws Exception;
    void update(Project project) throws Exception;
    Project queryById(String id) throws Exception;
    List<Project> queryAll()throws Exception;
    List<Project> queryNewProject()throws Exception;
    List<Project> queryHotProject()throws Exception;
    void delete(String id) throws Exception;
    int queryProjectCount();//项目总数
    int queryProjectFinished();//已完成目标项目总数
    int querySupportCount();//参与支持总数
    List<Project> queryNewProjectTop();
    List<Project> queryHotProjectTop();
    List<Project> queryProjectTopByCID(Category category);
    List<Project> queryProjectByCID(Category category);
    List<Project> queryProjectByKey(String keyword);//根据关键字查询项目
    List<Project> queryByUser(User user);
}
