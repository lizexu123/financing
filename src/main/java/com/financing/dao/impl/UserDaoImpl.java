package com.financing.dao.impl;

import com.financing.dao.UserDao;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
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
        Session session = sessionFactory.getCurrentSession();
        session.save(user);
        System.out.println("success! "+user);
    }

    @Override
    public void update(User user) throws Exception{
        Session session = sessionFactory.getCurrentSession();
        session.merge(user);
    }

    @Override
    public void delete(String id) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("update User set status = -1 where id=?");
        query.setString(0,id);
        query.executeUpdate();
    }

    @Override
    public User queryById(String id) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        User user = (User) session.get(User.class,id);
        return user;
    }

    @Override
    public List<User> queryAll() throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User");
        List<User> list = query.list();
        return list;
    }

    @Override
    public User queryByMobile(String mobile) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        System.out.println("mobile = " + mobile);
        Query query = session.createQuery("from User where mobile=?");
        query.setString(0,mobile);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public User queryByName(String username) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from User where username =?");
        query.setString(0,username);
        User user = (User)query.uniqueResult();
        return user;
    }

    @Override
    public long queryTotal() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT count(*) FROM User");
        long total = (long) query.uniqueResult();
        return total;
    }

    @Override
    public void updateBalance(BigDecimal balance,User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("update User set balance = balance+? where id=?");
        query.setBigDecimal(0,balance);
        query.setString(1,user.getId());
        query.executeUpdate();
    }
}
