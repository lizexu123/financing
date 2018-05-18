package com.financing.service;

import com.financing.entity.Project;

import java.util.List;

/**
 * Created by Penny on 2018/5/17.
 */
public interface ProjectService {
    Project getProject(String id);
    Boolean addProject(Project project);
    Project updateProject(Project project);
    List<Project> getProjectList();
    List<Project> getNewProjectList();
    List<Project> getHotProjectList();
}
