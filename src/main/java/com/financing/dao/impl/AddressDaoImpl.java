package com.financing.dao.impl;

import com.financing.dao.AddressDao;
import com.financing.entity.Address;
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
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.save(address);
        tx.commit();
    }

    @Override
    public void update(Address address) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        session.update(address);
        tx.commit();

        System.out.println(" "+address.toString());
    }

    @Override
    public void delete(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = session.getTransaction();
        tx.begin();
        Query query = session.createQuery("delete from Address where id =?");
        query.setInteger(0,id);
        tx.commit();
    }

    @Override
    public List<Address> queryAll() {
        return null;
    }

    @Override
    public Address queryById(int id) {
        return null;
    }
}
