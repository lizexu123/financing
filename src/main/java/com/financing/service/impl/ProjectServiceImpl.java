package com.financing.service.impl;

import com.financing.dao.ProjectDao;
import com.financing.entity.Project;
import com.financing.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        return null;
    }

    @Override
    public Boolean addProject(Project project) {
        try {
            projectDao.insert(project);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Project updateProject(Project project) {
        return null;
    }

    @Override
    public List<Project> getProjectList() {
        return null;
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
}
