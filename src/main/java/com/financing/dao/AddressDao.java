package com.financing.dao;

import com.financing.entity.Address;

import java.util.List;

/**
 * Created by Penny on 2018/5/20.
 */
public interface AddressDao {
    void insert(Address address);
    void update(Address address);
    void delete(int id);
    List<Address> queryAll();
    Address queryById(int id);

}
