package com.financing.service.impl;

import com.financing.dao.ProjectDao;
import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by Penny on 2018/5/17.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectDao projectDao;

    @Override
    public Project getProject(String id) {
        try {
            return projectDao.queryById(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public String addProject(Project project) {
        try {
            return projectDao.insert(project);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Boolean updateProject(Project project) {
        try {
            projectDao.update(project);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Project> getProjectList() {
        try {
            return projectDao.queryAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<Project> getNewProjectList() {
        try {
            return projectDao.queryNewProject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<Project> getHotProjectList() {
        try {
            return projectDao.queryHotProject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public int getProjectCount() {
        return projectDao.queryProjectCount();
    }

    @Override
    public int getProjectFinished() {
        return projectDao.queryProjectFinished();
    }

    @Override
    public int getSupportCount() {
        return projectDao.querySupportCount();
    }

    @Override
    public List<Project> getNewProjectTop() {
        return projectDao.queryNewProjectTop();
    }

    @Override
    public List<Project> getHotProjectTop() {
        return projectDao.queryHotProjectTop();
    }

    @Override
    public List<Project> getProjectTopByCID(int cid) {
        Category category = new Category();
        category.setId(cid);
        return projectDao.queryProjectTopByCID(category);
    }

    @Override
    public List<Project> getProjectByCID(int cid) {
        Category category = new Category();
        category.setId(cid);
        return projectDao.queryProjectByCID(category);
    }

    @Override
    public List<Project> getProjectByKey(String keyword) {
        return projectDao.queryProjectByKey(keyword);
    }

    @Override
    public List<Project> getProjectByUser(User user) {
        return projectDao.queryByUser(user);
    }

    @Override
    public void updateSupport(Project project, BigDecimal amount) {
        projectDao.updateSupport(project,amount);
    }


}
