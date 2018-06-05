package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/17.
 */
public interface ProjectService {
    Project getProject(String id);
    String addProject(Project project);
    String currencyExchange(String from,String to);
    Boolean updateProject(Project project);
    List<Project> getProjectList();
    List<Project> getNewProjectList();
    List<Project> getHotProjectList();
    long getProjectCount();//项目总数
    long getProjectFinished();//已完成目标项目总数
    long getSupportCount();//参与支持总数
    List<Project> getNewProjectTop();
    List<Project> getHotProjectTop();
    List<Project> getProjectTopByCID(int cid);
    List<Project> getProjectByCID(int cid);
    List<Project> getProjectByKey(String keyword);//根据关键字查询项目
    List<Project> getProjectByUser(User user);//查询用户发布的项目列表
    void updateSupport(Project project, BigDecimal amount,int action);//更新项目支持数及实际融资数
    List<Project> getFinancingStatisticTop();//获取项目融资统计前15条
    List<Map<String,Object>> getProjectStatistic();
}
