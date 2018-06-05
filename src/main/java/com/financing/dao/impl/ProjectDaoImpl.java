package com.financing.dao.impl;

import com.financing.dao.ProjectDao;
import com.financing.entity.Category;
import com.financing.entity.Project;
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
 * Created by Penny on 2018/5/16.
 */
@Repository
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public String insert(Project project) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        String id = (String) session.save(project);
        tx.commit();
        System.out.println("success "+project);
        return id;
    }

    @Override
    public void update(Project project) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.merge(project);
        tx.commit();
        System.out.println(project);
    }

    @Override
    public Project queryById(String id) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Project project = (Project) session.load(Project.class,id);
        tx.commit();
        return project;

    }

    @Override
    public List<Project> queryAll() throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project");
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryNewProject() throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project order by publishTime desc");
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryHotProject() throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project order by supportCount desc");
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public void delete(String id) throws Exception {

    }

    @Override
    public long queryProjectCount() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("select count(*) from Project");
        long count = (long) query.uniqueResult();
        tx.commit();
        return count;
    }

    @Override
    public long queryProjectFinished() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("select count(*) from Project where status = 1 or status = 3");
        long count = (long) query.uniqueResult();
        tx.commit();
        return count;
    }

    @Override
    public long querySupportCount() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("select sum (supportCount) from Project");
        long count = (long) query.uniqueResult();
        tx.commit();
        return count;
    }

    @Override
    public List<Project> queryNewProjectTop() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project order by publishTime desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryHotProjectTop() {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project order by supportCount desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryProjectTopByCID(Category category) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project where status IN (0,1) and category = ? order by supportCount desc");
        query.setEntity(0,category);
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryProjectByCID(Category category) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project where category = ?");
        query.setEntity(0,category);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryProjectByKey(String keyword) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from Project where title like %:keyword% or team like %:keyword% or purpose like %:keyword% or detail like %:keyword%");
        query.setString("keyword",keyword);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public List<Project> queryByUser(User user) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        System.out.println("session = " + session);
        Query query = session.createQuery("from Project where user= ?");
        query.setEntity(0,user);
        List<Project> projects = query.list();
        tx.commit();
        return projects;
    }

    @Override
    public void updateSupport(Project project, BigDecimal amount) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("update Project set supportCount = supportCount +1,actualAmount = actualAmount +? where id =?");
        query.setBigDecimal(0,amount);
        query.setString(1,project.getId());
        query.executeUpdate();
        tx.commit();
    }

}
