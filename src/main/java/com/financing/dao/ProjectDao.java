package com.financing.dao;

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
}
