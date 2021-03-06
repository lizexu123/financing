package com.financing.controller;

import com.financing.entity.Project;
import com.financing.entity.ProjectBack;
import com.financing.service.ProjectBackService;
import com.financing.service.ProjectService;
import com.financing.utils.DateUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Penny
 */
@Controller
public class ProjectBackController {

    @Autowired
    ProjectBackService projectBackService;

    @Autowired
    ProjectService projectService;


    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;


    /**
     * 添加回报
     * @param request
     * @return
     */
    @RequestMapping(value = "/doAddBack",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddBack(HttpServletRequest request){
        String projectId  = request.getParameter("project");
        BigDecimal amount = BigDecimal.valueOf(Double.valueOf(request.getParameter("amount")));
        String content = request.getParameter("content");
        int post = 0;
        try {
            post = Integer.parseInt(request.getParameter("post"));
        } catch (NumberFormatException e) {
            post = 0;
        }
        int allow = Integer.parseInt(request.getParameter("allow"));
        Date backDate = DateUtil.StringToDate(request.getParameter("back_date"));
        System.out.println("projectId = " + projectId);
        Project project = projectService.getProject(projectId);

        ProjectBack back = new ProjectBack();
        back.setCompensation(0);
        back.setProject(project);
        back.setAllow(allow);
        back.setAmount(amount);
        back.setBackDate(backDate);
        back.setContent(content);
        back.setPost(post);
        System.out.println("project = " + project);
        projectBackService.addBack(back);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","add success");

        return result;
    }


    /**
     * 获取对应项目的回报设置列表
     * @param projectId
     * @return
     */
    @RequestMapping(value = "/doGetBacks-{projectId}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doGetBacks(@PathVariable("projectId") String projectId){
        Project project = new Project();
        project.setId(projectId);
        List<ProjectBack> backs = projectBackService.getBackList(project);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","add success");
        result.put("data",backs);

        return result;

    }
}
