package com.financing.service;

import com.financing.entity.Interest;
import com.financing.entity.User;

import java.util.List;

/**
 * Created by Penny on 2018/5/21.
 */
public interface InterestService {

    void addInterest(Interest interest);
    void cancelInterest(int id);
    List<Interest> getInterestByUser(User user);
}
