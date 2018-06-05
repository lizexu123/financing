package com.financing.service.impl;

import com.financing.dao.ProjectDao;
import com.financing.entity.Category;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.ProjectService;
import com.financing.utils.WebServiceUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/17.
 */
@Service
public class ProjectServiceImpl implements ProjectService {

    @Autowired
    private ProjectDao projectDao;

    @Override
    public Project getProject(String id) {
        try {
            return projectDao.queryById(id);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public String addProject(Project project) {
        try {
            return projectDao.insert(project);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public String currencyExchange(String from,String to) {
        String appKey = "361c69c728db00dbf4e7323b43f6fb14";
        String result =null;
        String url ="http://op.juhe.cn/onebox/exchange/currency";//请求接口地址
        Map params = new HashMap();//请求参数
        params.put("from",from);//身份证号码
        params.put("to",to);//返回数据格式：json或xml,默认json
        params.put("key",appKey);//你申请的key

        try {
            result = WebServiceUtil.net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
                JSONArray resultArray = object.getJSONArray("result");
                String currExchange = resultArray.getJSONObject(0).getString("result");

                return currExchange;
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
                return "fail";
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public Boolean updateProject(Project project) {
        try {
            projectDao.update(project);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<Project> getProjectList() {
        try {
            return projectDao.queryAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<Project> getNewProjectList() {
        try {
            return projectDao.queryNewProject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public List<Project> getHotProjectList() {
        try {
            return projectDao.queryHotProject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public long getProjectCount() {
        return projectDao.queryProjectCount();
    }

    @Override
    public long getProjectFinished() {
        return projectDao.queryProjectFinished();
    }

    @Override
    public long getSupportCount() {
        return projectDao.querySupportCount();
    }

    @Override
    public List<Project> getNewProjectTop() {
        return projectDao.queryNewProjectTop();
    }

    @Override
    public List<Project> getHotProjectTop() {
        return projectDao.queryHotProjectTop();
    }

    @Override
    public List<Project> getProjectTopByCID(int cid) {
        Category category = new Category();
        category.setId(cid);
        return projectDao.queryProjectTopByCID(category);
    }

    @Override
    public List<Project> getProjectByCID(int cid) {
        Category category = new Category();
        category.setId(cid);
        return projectDao.queryProjectByCID(category);
    }

    @Override
    public List<Project> getProjectByKey(String keyword) {
        return projectDao.queryProjectByKey(keyword);
    }

    @Override
    public List<Project> getProjectByUser(User user) {
        return projectDao.queryByUser(user);
    }

    @Override
    public void updateSupport(Project project, BigDecimal amount) {
        projectDao.updateSupport(project,amount);
    }


}
