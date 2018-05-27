package com.financing.controller;

import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**项目评论
 * @author Penny
 */
@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    /**
     * 发表评论
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/doAddComment",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddComment(HttpServletRequest request, HttpSession session){
        User user = (User) session.getAttribute("user");
        String projectId = request.getParameter("project");
        String toUserId = request.getParameter("to_user");
        String content = request.getParameter("content");

        Project project = new Project();
        project.setId(projectId);
        User toUser = new User();
        toUser.setId(toUserId);

        Comment comment = new Comment();
        comment.setFromUser(user);
        comment.setCreateTime(new Date());
        comment.setContent(content);
        comment.setProject(project);
        comment.setToUser(toUser);

        commentService.addComment(comment);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","comment success");
        result.put("data","");
        return result;
    }

    /**
     * 根据项目获取评论列表
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doGetComment-{pid}")
    @ResponseBody
    public Map<String,Object> doGetComment(@PathVariable("pid") String pid){
        Project project = new Project();
        project.setId(pid);

        List<Comment> comments = commentService.getCommentList(project);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",comments);
        return result;
    }

    /**
     * 用户获取自己发表的评论列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doGetOwnerComment")
    @ResponseBody
    public Map<String,Object> doGetOwnerComment(HttpSession session){
        User user = (User) session.getAttribute("user");

        List<Comment> comments = commentService.getOwnerCommentList(user);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",comments);
        return result;
    }

    /**
     * 用户获取收到的评论列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doGetReceiveComment")
    @ResponseBody
    public Map<String,Object> doGetReceiveComment(HttpSession session){
        User user = (User) session.getAttribute("user");

        List<Comment> comments = commentService.getTargetCommentList(user);

        Map<String,Object> result = new HashMap<String,Object>();

        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",comments);
        return result;
    }

}
