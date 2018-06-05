package com.financing.dao.impl;

import com.financing.dao.AdminDao;
import com.financing.entity.Admin;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 * Created by Penny on 2018/5/31.
 */
@Repository
public class AdminDaoImpl implements AdminDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Admin queryByName(String username) {

        Session session = sessionFactory.getCurrentSession();
//        Transaction tx = session.getTransaction();
//        tx.begin();
        Query query = session.createQuery("from Admin where username =?");
        query.setString(0,username);
        Admin admin = (Admin) query.uniqueResult();
//        tx.commit();
        return admin;
    }
}
