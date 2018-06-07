package com.financing.controller;

import com.financing.entity.*;
import com.financing.service.ProjectBackService;
import com.financing.service.ProjectService;
import com.financing.utils.DateUtil;
import com.financing.utils.FileUploadUtil;
import com.financing.utils.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
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

    @Autowired
    private ProjectBackService projectBackService;

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    /**
     * 用户发布项目,货币汇率转换
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
        int categoryId = Integer.parseInt(request.getParameter("category_id"));
        System.out.println("categoryId = " + categoryId);
        System.out.println("user = " + user);
        System.out.println("title = " + title);
        String cover = FileUploadUtil.uploadFile(coverUpload,session);
        if (cover.equals("file format error")){
            result.put("flag",FAIL_CODE);
            result.put("msg",cover);
            result.put("data","");
            return result;
        }
        String exchange = projectService.currencyExchange("CNY","USD");
        if (exchange.equals("fail")){
            result.put("flag",FAIL_CODE);
            result.put("msg",exchange);
            return result;
        }
        double currExchange = Double.parseDouble(exchange);
        BigDecimal goal = BigDecimal.valueOf(Double.valueOf(request.getParameter("goal_amount"))) ;
        BigDecimal goalAmount = goal.multiply(BigDecimal.valueOf(currExchange));

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

        String projectId = projectService.addProject(project);
        if ( projectId!=null){
            //添加无私回报
            ProjectBack projectBack = new ProjectBack();
            projectBack.setCompensation(1);
            projectBack.setContent("Thank you for your unselfish support!");
            project.setId(projectId);
            projectBack.setProject(project);
            projectBackService.addBack(projectBack);

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
        return "project_show2";
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
        return "project_show2";
    }

    /**
     * 项目总数
     * @return
     */
    @RequestMapping(value = "/doProjectCount",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doProjectCount(){
        long count = projectService.getProjectCount();

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
        long count = projectService.getProjectFinished();

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
        long count = projectService.getSupportCount();

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
        return "project_show2";
    }


    /**
     * 项目展示：全部项目
     *
     * @param map
     * @return
     */
    @RequestMapping(value = "/doProjectAll",method = RequestMethod.GET)
    public String doProjectAll(ModelMap map,HttpServletRequest request){
        int everyPage = 5;//每页记录数
        int totalCount = projectService.getProjectAllCont();//获取总记录数
        //点击链接重新获取当前页
        String scurrentPage = request.getParameter("currentPage");
        int currentPage = 1; //当前页，默认1
        if (scurrentPage == null) {
            currentPage = 1;//从第一页开始访问
        } else {
            currentPage = Integer.parseInt(scurrentPage);
        }
        //分页信息
        Page page = PageUtil.createPage(everyPage, totalCount, currentPage);
        //分页数据信息
        List<Project> list = projectService.findByPage(page);

        map.addAttribute("page",page);
        map.addAttribute("list",list);
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
        return "project_show2";
    }


    /**
     * 获取用户发布的项目列表
     * @param session
     * @return
     */
    @RequestMapping(value = "doProjectByUser",method = RequestMethod.GET)
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
     * 用户查看所发布的项目信息
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doProjectInfo-{pid}")
    public String doProjectInfo(HttpSession session, @PathVariable("pid") String pid,ModelMap map){
        User user = (User) session.getAttribute("user");
        Project project = projectService.getProject(pid);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","project detail");
        result.put("data",project);
        map.addAllAttributes(result);

        return "person_projectInfo";
    }


    /**
     * 项目详情页
     *
     * @param pid
     * @param map
     * @return
     */
    @RequestMapping(value = "/doProjectDetail-{pid}")
    public String doProjectDetail(@PathVariable("pid") String pid,ModelMap map){
        Project project = projectService.getProject(pid);
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","project detail");
        result.put("data",project);
        map.addAllAttributes(result);

        return "project_Detail";
    }

}
