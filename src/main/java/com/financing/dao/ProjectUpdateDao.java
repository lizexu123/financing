package com.financing.dao;

import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;

import java.util.List;

/**
 * Created by Penny on 2018/5/26.
 */
public interface ProjectUpdateDao {
    void insert(ProjectUpdate projectUpdate);
    List<ProjectUpdate> queryAll(Project project);
}
