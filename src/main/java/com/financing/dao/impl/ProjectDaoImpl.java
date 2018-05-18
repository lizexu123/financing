package com.financing.dao.impl;

import com.financing.dao.ProjectDao;
import com.financing.entity.Project;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/16.
 */
@Repository
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(Project project) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(project);
        tx.commit();
        System.out.println("success "+project);

    }

    @Override
    public void update(Project project) throws Exception {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.update(project);
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
}
