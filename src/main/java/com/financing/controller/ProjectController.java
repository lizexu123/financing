package com.financing.controller;

import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.ProjectBack;
import com.financing.entity.User;
import com.financing.service.ProjectService;
import com.financing.utils.DateUtil;
import com.financing.utils.FileUploadUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.util.*;

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
    @RequestMapping(value = "/doCreateProject",method = RequestMethod.POST)
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

        //添加无私回报
        ProjectBack projectBack = new ProjectBack();
        projectBack.setCompensation(1);

        List<ProjectBack> backs = new ArrayList<>();
        backs.add(projectBack);
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
        project.setBacks(backs);
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
    @RequestMapping(value = "/doShowNewProject",method = RequestMethod.GET)
    public String doShowNewProject(ModelMap map){
        Map<String,Object> result = new HashMap<String, Object>();

        List<Project> projects = projectService.getNewProjectList();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","NEW");
        result.put("data",projects);
        map.addAllAttributes(result);
        return "project_show";
    }

    /**
     * 项目展示：最多支持
     * @return
     * @author Penny
     */
    @RequestMapping(value = "/doShowHotProject",method = RequestMethod.GET)
    public String doShowHotProject(ModelMap map){
        Map<String,Object> result = new HashMap<String, Object>();
        List<Project> projects = projectService.getHotProjectList();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","HOT");
        result.put("data",projects);
        map.addAllAttributes(result);
        return "project_show";
    }

    /**
     * 项目总数
     * @return
     */
    @RequestMapping(value = "/doProjectCount",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doProjectCount(){
        int count = projectService.getProjectCount();

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",count);

        return result;
    }


    /**
     * 已完成项目数
     * @return
     */
    @RequestMapping(value = "/doProjectFinished",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doProjectFinished(){
        int count = projectService.getProjectFinished();

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",count);

        return result;
    }

    /**
     * 参与支持总数
     * @return
     */
    @RequestMapping(value = "/doSupportCount",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doSupportCount(){
        int count = projectService.getSupportCount();

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",count);

        return result;
    }

    /**
     * 最新发布前五条
     * @return
     */
    @RequestMapping(value = "/doNewProjectTop",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doNewProjectTop(){
        List<Project> projects = projectService.getNewProjectTop();
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        return result;
    }


    /**
     * 最新发布前五条
     * @return
     */
    @RequestMapping(value = "/doHotProjectTop",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doHotProjectTop(){
        List<Project> projects = projectService.getHotProjectTop();
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        return result;
    }


    /**
     * 根据类型展示前五条项目
     * @param cid
     * @return
     */
    @RequestMapping(value = "/doProjectTopByCID-{cid}",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doProjectTopByCID(@PathVariable("cid") String cid){
        List<Project> projects = projectService.getProjectTopByCID(Integer.valueOf(cid));
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        return result;
    }

    /**
     * 项目展示：分类查询
     * @param cid
     * @param map
     * @return
     */
    @RequestMapping(value = "/doProjectByCID-{cid}",method = RequestMethod.GET)
    public String doProjectByCID(@PathVariable("cid") String cid,ModelMap map){
        List<Project> projects = projectService.getProjectByCID(Integer.valueOf(cid));
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        map.addAllAttributes(result);
        return "project_show";
    }


    /**
     * 项目展示：全部项目
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/doProjectAll",method = RequestMethod.GET)
    public String doProjectAll(ModelMap map){
        List<Project> projects = projectService.getProjectList();
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        map.addAllAttributes(result);
        return "project_show";
    }

    /**
     * 根据关键字查询项目
     * @param map
     * @param keyword
     * @return
     */
    @RequestMapping(value = "/doProjectByKey-{keyword}")
    public String doProjectByKey(ModelMap map, @PathVariable("keyword") String keyword){
        List<Project> projects = projectService.getProjectByKey(keyword);
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",projects);
        map.addAllAttributes(result);
        return "project_show";
    }


    /**
     * 获取用户发布的项目列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doProjectByUser")
    @ResponseBody
    public Map<String,Object> doProjectByUser(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Project> projects = projectService.getProjectByUser(user);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","user's projects");
        result.put("data",projects);
        return result;
    }

    /**
     * 查看项目详情
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doProjectDetail-{pid}")
    @ResponseBody
    public Map<String,Object> doProjectDetail(HttpSession session, @PathVariable("pid") String pid){
        User user = (User) session.getAttribute("user");
        Project project = projectService.getProject(pid);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","project detail");
        result.put("data",project);
        return result;
    }
}
