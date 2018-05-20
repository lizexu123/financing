package com.financing.dao;

import com.financing.entity.Project;
import com.financing.entity.ProjectBack;

import java.util.List;

/**
 * Created by Penny on 2018/5/19.
 */
public interface ProjectBackDao {
    void insert(ProjectBack projectBack);
    List<ProjectBack> queryAll(Project project);
    void update(ProjectBack projectBack);
}
