package com.financing.controller;

import com.financing.entity.Interest;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */
@Controller
public class InterestController {
    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    @Autowired
    private InterestService interestService;

    /**
     * 获取用户收藏列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doGetInterest")
    @ResponseBody
    public Map<String,Object> doGetInterest(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Interest> interests = interestService.getInterestByUser(user);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",interests);
        return result;
    }

    /**
     * 用户点击项目添加收藏
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doAddInterest-{pid}")
    @ResponseBody
    public Map<String,Object> doAddInterest(HttpSession session,@PathVariable("pid") String pid){
        User user = (User) session.getAttribute("user");
        Project project = new Project();
        project.setId(pid);
        Interest interest = new Interest();
        interest.setUser(user);
        interest.setProject(project);
        interestService.addInterest(interest);

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data","");
        return result;
    }


    /**
     * 取消收藏
     * @param session
     * @param id
     * @return
     */
    @RequestMapping(value = "/doCancelInterest-{id}")
    @ResponseBody
    public Map<String,Object> doCancelInterest(HttpSession session, @PathVariable("id") String id){
        User user = (User) session.getAttribute("user");
        interestService.cancelInterest(Integer.valueOf(id));

        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data","");
        return result;
    }
}
