package com.financing.service.impl;

import com.financing.dao.AddressDao;
import com.financing.entity.Address;
import com.financing.entity.User;
import com.financing.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
@Service
public class AddressServiceImpl implements AddressService {

    @Autowired
    private AddressDao addressDao;

    @Override
    public void addAddress(Address address) {
        addressDao.insert(address);
    }

    @Override
    public List<Address> getAddressList() {
        return addressDao.queryAll();
    }

    @Override
    public List<Address> getAddressListByUser(User user) {
        return addressDao.queryByUser(user);
    }

    @Override
    public void deleteAddress(int id) {
        addressDao.delete(id);
    }
}
