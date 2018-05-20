package com.financing.service;

import com.financing.entity.Project;
import com.financing.entity.ProjectBack;

import java.util.List;

/**
 * Created by Penny on 2018/5/19.
 */
public interface ProjectBackService {
    void addBack(ProjectBack projectBack);
    List<ProjectBack> getBackList(Project project);
    void updateBack(ProjectBack projectBack);
}
