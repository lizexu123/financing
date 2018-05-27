package com.financing.service.impl;

import com.financing.dao.CommentDao;
import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/27.
 */
@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public void addComment(Comment comment) {
        commentDao.insert(comment);
    }

    @Override
    public List<Comment> getCommentList(Project project) {
        return commentDao.queryAll(project);
    }

    @Override
    public List<Comment> getOwnerCommentList(User user) {
        return commentDao.queryByOwner(user);
    }

    @Override
    public List<Comment> getTargetCommentList(User user) {
        return commentDao.queryByTarget(user);
    }
}
