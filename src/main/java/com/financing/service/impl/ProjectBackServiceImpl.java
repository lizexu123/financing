package com.financing.service.impl;

import com.financing.dao.ProjectBackDao;
import com.financing.entity.Project;
import com.financing.entity.ProjectBack;
import com.financing.service.ProjectBackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/19.
 */

@Service
public class ProjectBackServiceImpl implements ProjectBackService {

    @Autowired
    private ProjectBackDao projectBackDao;

    @Override
    public void addBack(ProjectBack projectBack) {
        projectBackDao.insert(projectBack);
    }

    @Override
    public List<ProjectBack> getBackList(Project project) {
        return projectBackDao.queryAll(project);
    }

    @Override
    public void updateBack(ProjectBack projectBack) {
        projectBackDao.update(projectBack);
    }

    @Override
    public ProjectBack getBack(int id) {
        return projectBackDao.queryById(id);
    }

    @Override
    public void updateActual(ProjectBack projectBack,int action) {
        //action = 1 实际参与回报人数+1
        //action = -1 实际参与回报人数-1
        projectBackDao.updateActual(projectBack,action);
    }
}
