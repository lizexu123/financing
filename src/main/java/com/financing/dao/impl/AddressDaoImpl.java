package com.financing.dao.impl;

import com.financing.dao.AddressDao;
import com.financing.entity.Address;
import com.financing.entity.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Penny on 2018/5/20.
 */
@Repository
public class AddressDaoImpl implements AddressDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void insert(Address address) {
        Session session = sessionFactory.getCurrentSession();
        session.save(address);
    }

    @Override
    public void update(Address address) {
        Session session = sessionFactory.getCurrentSession();
        session.update(address);

        System.out.println(" "+address.toString());
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("delete from Address where id =?");
        query.setInteger(0,id);
    }

    @Override
    public List<Address> queryAll() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Address ");
        List<Address> addresses = query.list();
        return addresses;
    }

    @Override
    public List<Address> queryByUser(User user) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("from Address where user = ?");
        List<Address> addresses = query.list();

        return addresses;
    }

    @Override
    public Address queryById(int id) {
        return null;
    }
}
