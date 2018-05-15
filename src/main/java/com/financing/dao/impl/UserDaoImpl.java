package com.financing.dao.impl;

import com.financing.dao.UserDao;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/13.
 */
@Repository
public class UserDaoImpl implements UserDao{


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(User user) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(user);
        tx.commit();
        System.out.println("success! "+user);
    }

    @Override
    public void update(User user) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.update(user);
        tx.commit();
    }

    @Override
    public void delete(String id) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("update User set status = -1 where id=?");
        query.setString(0,id);
        query.executeUpdate();
        tx.commit();
    }

    @Override
    public User queryById(String id) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        User user = (User) session.load(User.class,id);
        tx.commit();
        return user;
    }

    @Override
    public List<User> queryAll() throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from User");
        List<User> list = query.list();
        tx.commit();
        return list;
    }

    @Override
    public User queryByMobile(String mobile) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from User where mobile=?");
        query.setString(0,mobile);
        User user = (User)query.uniqueResult();
        tx.commit();
        return user;
    }

    @Override
    public User queryByName(String username) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from User where username=?");
        query.setString(0,username);
        User user = (User)query.uniqueResult();
        tx.commit();
        return user;
    }
}
