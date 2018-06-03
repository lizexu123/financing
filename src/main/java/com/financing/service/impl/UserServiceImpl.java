package com.financing.service.impl;

import com.financing.dao.UserDao;
import com.financing.entity.User;
import com.financing.service.UserService;
import com.financing.utils.RandomNameUtil;
import com.financing.utils.WebServiceUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author Penny
 */
@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDao userDao;

    @Override
    public User getUser(String mobile) {
        try {
            System.out.println("mobile = " + mobile);
            User user =userDao.queryByMobile(mobile);
            return user;
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }
    public User getUserByUsername(String username){
        try {
            return userDao.queryByName(username);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public Boolean addUser(User user) {//添加用户
        try {
            String username = "user_";
            do {
                username+= RandomNameUtil.getStringRandom(6);//生成初始随机用户名
            }while (userDao.queryByName(username)!=null);//用户名不重复

            user.setUsername(username);
            user.setAvatar("/financing/image/defaulthead.png");//设置默认头像
            user.setBalance(BigDecimal.valueOf(0));
            user.setStatus((byte) 0);
            user.setIc("unknown");
            user.setRealName("unknown");
            user.setEmail("");
            user.setZone("");
            user.setGender("secrecy");
            user.setIntro("");
            userDao.insert(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public User updateUser(User user) {
        try {
            userDao.update(user);
            return  userDao.queryById(user.getId());
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }

    }

    @Override
    public Boolean deleteUser(String id) {
        try {
            userDao.delete(id);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public Boolean moveOutBlack(String id) {
        try {
            User user = userDao.queryById(id);
            user.setStatus((byte) 0);
            userDao.update(user);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<User> getUserList() {
        try {
            return userDao.queryAll();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

    @Override
    public long getUserTotal() {
        return userDao.queryTotal();
    }

    @Override
    public Boolean verifyIdCard(String ic) {//用户身份证信息验证
        String appKey = "6523d4efdd29cec246ddaeaaffab9737";
        String result =null;
        String url ="http://apis.juhe.cn/idcard/index";//请求接口地址
        Map params = new HashMap();//请求参数
        params.put("cardno",ic);//身份证号码
        params.put("dtype","json");//返回数据格式：json或xml,默认json
        params.put("key",appKey);//你申请的key

        try {
            result = WebServiceUtil.net(url, params, "GET");
            JSONObject object = JSONObject.fromObject(result);
            if(object.getInt("error_code")==0){
                System.out.println(object.get("result"));
                return true;
            }else{
                System.out.println(object.get("error_code")+":"+object.get("reason"));
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException();
        }
    }

}
