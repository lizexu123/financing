package com.financing.service.impl;

import com.financing.dao.InterestDao;
import com.financing.entity.Interest;
import com.financing.entity.User;
import com.financing.service.InterestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
@Service
public class InterestServiceImpl implements InterestService {

    @Autowired
    private InterestDao interestDao;

    @Override
    public void addInterest(Interest interest) {
        interestDao.insert(interest);
    }

    @Override
    public void cancelInterest(int id) {
        interestDao.delete(id);
    }

    @Override
    public List<Interest> getInterestByUser(User user) {
        return interestDao.queryByUser(user);
    }
}
