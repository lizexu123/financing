package com.financing.dao.impl;

import com.financing.dao.OrderDao;
import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */
@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(Order order) {
        Session session = sessionFactory.getCurrentSession();
        session.save(order);
        System.out.println("////////"+order);
    }

    @Override
    public List<Order> queryByStatus(Byte status) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where status = ?");
        query.setByte(0,status);
        List<Order> orders = query.list();
        return orders;
    }

    @Override
    public void updateByStatus(Order order) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("update Order set status = ? where id = ?");
        query.setByte(0, order.getStatus());
        query.setString(1,order.getId());
        query.executeUpdate();
    }

    @Override
    public List<Order> queryAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order");
        List<Order> orders = query.list();
        return orders;
    }

    @Override
    public List<Order> queryByProject(Project project) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where project = ?");
        query.setEntity(0,project);
        List<Order> orders = query.list();
        return orders;
    }

    @Override
    public List<Order> queryByUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where user = ?");
        query.setEntity(0,user);
        List<Order> orders = query.list();
        return orders;
    }

    @Override
    public Order queryById(String id) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where id = ?");
        query.setString(0,id);
        Order order = (Order) query.uniqueResult();
        return order;
    }

    @Override
    public long queryTotal() {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT count(*) FROM Order where status = 0");
        long total = (long) query.uniqueResult();
        return total;
    }

    @Override
    public List<Order> queryByProjectStatus(Byte status) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Order where  project.status=?");
        query.setByte(0,status);
        List<Order> orders = query.list();
        return orders;
    }

    @Override
    public List<Object> queryOrderStatistic() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createSQLQuery("select DATE_FORMAT(create_time,'%Y-%m-%d'),status,Count(id) from `order` where  DATE_FORMAT(create_time,'%Y-%m-%d')> DATE_SUB(CURDATE(),INTERVAL 30 DAY) GROUP BY DATE_FORMAT(create_time,'%Y-%m-%d'),status ");
        List<Object> statistic = query.list();
        return statistic;
    }
}
