package com.financing.dao.impl;

import com.financing.dao.CommentDao;
import com.financing.entity.Comment;
import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/27.
 */
@Repository
public class CommentDaoImpl implements CommentDao {


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(Comment comment) {
        Session session = sessionFactory.getCurrentSession();
        session.save(comment);
        System.out.println("/////"+comment);
    }

    @Override
    public List<Comment> queryAll(Project project) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Comment where project = ?");
        query.setEntity(0,project);
        List<Comment> comments = query.list();
        return comments;
    }

    @Override
    public List<Comment> queryByOwner(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Comment where fromUser = ?");
        query.setEntity(0,user);
        List<Comment> comments = query.list();
        return comments;
    }

    @Override
    public List<Comment> queryByTarget(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Comment where toUser = ? or project.user=?");
        query.setEntity(0,user);
        query.setEntity(1,user);
        List<Comment> comments = query.list();
        return comments;
    }
}
