package com.financing.dao.impl;

import com.financing.dao.ProjectBackDao;
import com.financing.entity.Project;
import com.financing.entity.ProjectBack;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by dell on 2018/5/19.
 */
@Repository
public class ProjectBackDaoImpl implements ProjectBackDao {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(ProjectBack projectBack) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(projectBack);
        tx.commit();
        System.out.println(projectBack.toString());
    }

    @Override
    public List<ProjectBack> queryAll(Project project) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from ProjectBack where project = ?");
        query.setEntity(0,project);
        List<ProjectBack> backs = query.list();
        tx.commit();
        return backs;
    }

    @Override
    public void update(ProjectBack projectBack) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.update(projectBack);
        tx.commit();
        System.out.println(projectBack.toString());
    }
}
