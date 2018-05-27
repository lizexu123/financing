package com.financing.service;

import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/27.
 */
public interface CommentService {
    void addComment(Comment comment);
    List<Comment> getCommentList(Project project);
    List<Comment> getOwnerCommentList(User user);
    List<Comment> getTargetCommentList(User user);
}
