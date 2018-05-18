package com.financing.controller;

import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.ProjectService;
import com.financing.utils.DateUtil;
import com.financing.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Penny
 */
@Controller
public class ProjectController {


    @Autowired
    private ProjectService projectService;

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    /**
     * 用户发布项目
     * @return
     * @author Penny
     */
    @RequestMapping(value = "doCreateProject",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doCreateProject(@RequestParam MultipartFile coverUpload,HttpServletRequest request,HttpSession session){
        Map<String,Object> result = new HashMap<String, Object>();
        User user = (User) session.getAttribute("user");
        Project project = new Project();

        String title = request.getParameter("title");
        int categoryId = Integer.parseInt(request.getParameter("category"));
        String cover = FileUploadUtil.uploadFile(coverUpload,session);
        if (cover.equals("file format error")){
            result.put("flag",FAIL_CODE);
            result.put("msg",cover);
            result.put("data","");
            return result;
        }
        BigDecimal goalAmount = BigDecimal.valueOf(Double.valueOf(request.getParameter("goal_amount"))) ;
        Date endTime = DateUtil.StringToDate(request.getParameter("end_time"));
        String team = request.getParameter("team");
        String purpose = request.getParameter("purpose");
        String detail = request.getParameter("detail");
        String contactName = request.getParameter("contact_name");
        String hotline = request.getParameter("hotline");
        String contactPhone = request.getParameter("contact_phone");

        Category category = new Category();
        category.setId(categoryId);

        project.setTitle(title);
        project.setUser(user);
        project.setCategory(category);
        project.setCover(cover);
        project.setGoalAmount(goalAmount);
        project.setPublishTime(new Date());
        project.setEndTime(endTime);
        project.setTeam(team);
        project.setPurpose(purpose);
        project.setDetail(detail);
        project.setContactName(contactName);
        project.setHotline(hotline);
        project.setContactPhone(contactPhone);
        project.setStatus((byte) 0);

        if (projectService.addProject(project)){
            result.put("flag",SUCCESS_CODE);
            result.put("msg","create success");
            result.put("data","");
            return result;
        }else {
            result.put("flag",FAIL_CODE);
            result.put("msg","unknown error");
            result.put("data","");
            return result;
        }
    }

    /**
     * 项目展示：最新发布
     * @return
     * @author Penny
     */
    @RequestMapping(value = "doShowNewProject",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doShowNewProject(){
        Map<String,Object> result = new HashMap<String, Object>();

        List<Project> projects = projectService.getNewProjectList();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        return result;
    }

    /**
     * 项目展示：最多支持
     * @return
     * @author Penny
     */
    @RequestMapping(value = "doShowHotProject",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doShowHotProject(){
        Map<String,Object> result = new HashMap<String, Object>();
        List<Project> projects = projectService.getHotProjectList();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        return result;
    }
}
