package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/17.
 */
public interface ProjectService {
    Project getProject(String id);
    String addProject(Project project);
    Boolean updateProject(Project project);
    List<Project> getProjectList();
    List<Project> getNewProjectList();
    List<Project> getHotProjectList();
    int getProjectCount();//项目总数
    int getProjectFinished();//已完成目标项目总数
    int getSupportCount();//参与支持总数
    List<Project> getNewProjectTop();
    List<Project> getHotProjectTop();
    List<Project> getProjectTopByCID(int cid);
    List<Project> getProjectByCID(int cid);
    List<Project> getProjectByKey(String keyword);//根据关键字查询项目
    List<Project> getProjectByUser(User user);//查询用户发布的项目列表
}
