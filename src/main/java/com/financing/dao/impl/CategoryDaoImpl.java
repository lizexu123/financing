package com.financing.dao.impl;

import com.financing.dao.CategoryDao;
import com.financing.entity.Category;
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
 * Created by Penny on 2018/5/16.
 */
@Repository
public class CategoryDaoImpl implements CategoryDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Category> queryAll() throws Exception {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Category ");
        List<Category> list = query.list();
        return list;
    }

    @Override
    public List<Map<String, Object>> queryStatistic() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("SELECT c.id,c.name,COUNT(p.id) AS COUNT " +
                "FROM Project p right join p.category c " +
                "GROUP BY c.id");
        List<Map<String,Object>> list = query.list();
        return list;
    }

    @Override
    public void insert(Category category) {
        Session session = sessionFactory.getCurrentSession();
        session.save(category);
        System.out.println(category.getName());
    }
}
