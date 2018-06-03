package com.financing.dao.impl;

import com.financing.dao.OrderDao;
import com.financing.entity.Order;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(Order order) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(order);
        tx.commit();
        System.out.println("////////"+order);
    }

    @Override
    public List<Order> queryByStatus(Byte status) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Order where status = ?");
        query.setByte(0,status);
        List<Order> orders = query.list();
        tx.commit();
        return orders;
    }

    @Override
    public void updateByStatus(String id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("update Order set status = ? where id = ?");
        query.setByte(0, (byte) 1);
        query.setString(1,id);
        query.executeUpdate();
        tx.commit();
    }

    @Override
    public List<Order> queryAll() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Order");
        List<Order> orders = query.list();
        tx.commit();
        return orders;
    }

    @Override
    public List<Order> queryByUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Order where User = ? and status = 0");
        query.setEntity(0,user);
        List<Order> orders = query.list();
        tx.commit();
        return orders;
    }

    @Override
    public Order queryById(String id) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Order where id = ? and status = 0");
        query.setString(0,id);
        Order order = (Order) query.uniqueResult();
        tx.commit();
        return order;
    }

    @Override
    public long queryTotal() {

        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("SELECT count(*) FROM Order");
        long total = (long) query.uniqueResult();
        tx.commit();
        return total;
    }
}
