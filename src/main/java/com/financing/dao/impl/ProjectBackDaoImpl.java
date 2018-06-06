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
        Session session = sessionFactory.getCurrentSession();
        session.save(projectBack);
        System.out.println(projectBack.toString());
    }

    @Override
    public List<ProjectBack> queryAll(Project project) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from ProjectBack where project = ?");
        query.setEntity(0,project);
        List<ProjectBack> backs = query.list();
        return backs;
    }

    @Override
    public void update(ProjectBack projectBack) {
        Session session = sessionFactory.getCurrentSession();
        session.update(projectBack);
        System.out.println(projectBack.toString());
    }

    @Override
    public ProjectBack queryById(int id) {
        Session session = sessionFactory.getCurrentSession();
        ProjectBack projectBack = (ProjectBack) session.get(ProjectBack.class,id);
        return projectBack;
    }

    @Override
    public void updateActual(ProjectBack projectBack,int action) {
        Session session = sessionFactory.getCurrentSession();
        Query query = null;
        switch (action){
            case 1:
                query = session.createQuery("update ProjectBack set actual = actual + 1 where id = ?");
                break;
            case -1:
                query = session.createQuery("update ProjectBack set actual = actual - 1 where id = ?");
                break;
        }
        query.setInteger(0,projectBack.getId());
        query.executeUpdate();
    }
}
