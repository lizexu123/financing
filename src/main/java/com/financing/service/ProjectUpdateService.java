package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;

import java.util.List;

/**
 * Created by Penny on 2018/5/26.
 */
public interface ProjectUpdateService {
    void addUpdate(ProjectUpdate update);
    List<ProjectUpdate> getUpdateList(Project project);
}
