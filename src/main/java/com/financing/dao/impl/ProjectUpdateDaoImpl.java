package com.financing.dao.impl;

import com.financing.dao.ProjectUpdateDao;
import com.financing.entity.Project;
import com.financing.entity.ProjectUpdate;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/26.
 */
@Repository
public class ProjectUpdateDaoImpl implements ProjectUpdateDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(ProjectUpdate projectUpdate) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(projectUpdate);
        tx.commit();
        System.out.println("///"+projectUpdate);
    }

    @Override
    public List<ProjectUpdate> queryAll(Project project) {

        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("from ProjectUpdate where project = ?");
        query.setEntity(0,project);
        List<ProjectUpdate> updates = query.list();
        tx.commit();
        return updates;
    }
}
