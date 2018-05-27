package com.financing.controller;

import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;
import com.financing.service.ProjectUpdateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/26.
 */
@Controller
public class ProjectUpdateController {

    @Autowired
    private ProjectUpdateService projectUpdateService;

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;


    /**
     * 发布项目更新
     * @param request
     * @return
     */
    @RequestMapping(value = "/doAddUpdate",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddUpdate(HttpServletRequest request){
        String projectId = request.getParameter("project");
        String content = request.getParameter("update_content");
        Project project = new Project();
        project.setId(projectId);
        ProjectUpdate projectUpdate = new ProjectUpdate();
        projectUpdate.setProject(project);
        projectUpdate.setUpdateContent(content);
        projectUpdate.setUpdateTime(new Date());

        projectUpdateService.addUpdate(projectUpdate);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","add update success");
        result.put("data","");
        return result;
    }


    /**
     * 根据项目id获取项目更新列表
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doGetUpdate-{pid}")
    @ResponseBody
    public Map<String,Object> doGetUpdate(@PathVariable("pid") String pid){
        Project project = new Project();
        project.setId(pid);
        List<ProjectUpdate> updates = projectUpdateService.getUpdateList(project);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","add update success");
        result.put("data",updates);
        return result;
    }
}
