package com.financing.service.impl;

import com.financing.dao.ProjectUpdateDao;
import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;
import com.financing.service.ProjectUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dell on 2018/5/26.
 */
@Service
public class ProjectUpdateServiceImpl implements ProjectUpdateService {

    @Autowired
    private ProjectUpdateDao projectUpdateDao;

    @Override
    public void addUpdate(ProjectUpdate update) {
        projectUpdateDao.insert(update);
    }

    @Override
    public List<ProjectUpdate> getUpdateList(Project project) {
        return projectUpdateDao.queryAll(project);
    }
}
