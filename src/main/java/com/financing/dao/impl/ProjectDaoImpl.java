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
import java.util.Map;

/**
 * Created by Penny on 2018/5/16.
 */
@Repository
public class ProjectDaoImpl implements ProjectDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public String insert(Project project) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        String id = (String) session.save(project);
        System.out.println("success "+project);
        return id;
    }

    @Override
    public void update(Project project) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        session.merge(project);
        System.out.println(project);
    }

    @Override
    public Project queryById(String id) throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Project project = (Project) session.get(Project.class,id);
        return project;

    }

    @Override
    public List<Project> queryAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project");
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryAllByLimit(int BeginIndex, int EveryPage) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project");
        query.setFirstResult(BeginIndex);
        query.setMaxResults(EveryPage);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryNewProject() throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project order by publishTime desc");
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryHotProject() throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project order by supportCount desc");
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public void delete(String id) throws Exception {

    }

    @Override
    public long queryProjectCount() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(*) from Project");
        long count = (long) query.uniqueResult();
        return count;
    }

    @Override
    public long queryProjectFinished() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select count(*) from Project where status = 1 or status = 3");
        long count = (long) query.uniqueResult();
        return count;
    }

    @Override
    public long querySupportCount() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select sum (supportCount) from Project");
        long count = (long) query.uniqueResult();
        return count;
    }

    @Override
    public List<Project> queryNewProjectTop() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project order by publishTime desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryHotProjectTop() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project order by supportCount desc");
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryProjectTopByCID(Category category) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project where status IN (0,1) and category = ? order by supportCount desc");
        query.setEntity(0,category);
        query.setFirstResult(0);
        query.setMaxResults(5);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryProjectByCID(Category category) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project where category = ?");
        query.setEntity(0,category);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryProjectByKey(String keyword) {

        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project where CONCAT_WS('',title,contactName,purpose,team,detail) like :param");
        query.setString("param", "%" + keyword + "%");
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public List<Project> queryByUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project where user = ?");
        query.setEntity(0,user);
        List<Project> projects = query.list();
        return projects;
    }

    @Override
    public void updateSupport(Project project, BigDecimal amount,int action) {
        Session session = sessionFactory.getCurrentSession();
        Query query =null;
        switch (action) {
            case 1:
                query = session.createQuery("update Project set supportCount = supportCount +1,actualAmount = actualAmount +? where id =?");
                break;
            case -1:
                query = session.createQuery("update Project set supportCount = supportCount -1,actualAmount = actualAmount -? where id =?");

        }
        query.setBigDecimal(0,amount);
        query.setString(1,project.getId());
        query.executeUpdate();
    }

    @Override
    public List<Project> queryFinancingStaticTop() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Project where status != 2 order by supportCount");
        query.setFirstResult(0);
        query.setMaxResults(15);
        List<Project> statistic = query.list();
        return statistic;
    }

    @Override
    public List<Map<String, Object>> queryProjectStatistic() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select status,count(id) from Project group by status");
        List<Map<String,Object>> statistic = query.list();
        return statistic;
    }

}
