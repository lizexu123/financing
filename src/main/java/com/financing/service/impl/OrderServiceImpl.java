package com.financing.service.impl;

import com.financing.dao.OrderDao;
import com.financing.entity.Order;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.OrderService;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Override
    public void addOrder(Order order) {
        orderDao.insert(order);
    }

    @Override
    public List<Order> getOrderListByUser(User user) {
        return orderDao.queryByUser(user);
    }

    @Override
    public List<Order> getOrderListByProject(Project project) {
        return orderDao.queryByProject(project);
    }

//    @Override
//    public void cancelOrder(Order order) {
//        order.setStatus((byte) -1);
//        orderDao.updateByStatus(order);
//    }

    @Override
    public Order getOrderDetail(String id) {
        return orderDao.queryById(id);
    }

    @Override
    public long getOrderTotal() {
        return orderDao.queryTotal();
    }

    @Override
    public List<Order> getOrderList() {
        return orderDao.queryAll();
    }

    @Override
    public List<Order> getOrderListByPStatus(Byte status) {

        return orderDao.queryByProjectStatus(status);
    }

    @Override
    public void refundOrder(Order order) {
        orderDao.updateByStatus(order);
    }

    @Override
    public List<Map<String, Object>> getOrderStatistic() {
        List<Object> list =  orderDao.queryOrderStatistic();
        List<Map<String,Object>> statistic = new ArrayList<Map<String,Object>>();
        for (int i = 0;i<list.size();i++) {
            Object oj =  list.get(i);
            JSONArray array = JSONArray.fromObject(oj);
            Map<String,Object> data = new HashMap<String,Object>();
            List<Map<String,Object>> dataList = new ArrayList<Map<String,Object>>();
            Map<String,Object> dataSub = new HashMap<String,Object>();
            if((i!=0)&&JSONArray.fromObject(list.get(i-1)).get(0).equals(array.get(0))){//日期相同
                data = statistic.get(i-1);
                dataList = (List<Map<String, Object>>) data.get("data");
                dataSub.put("status",array.get(1));//status
                dataSub.put("count",array.get(2));//count
                dataList.add(dataSub);
            }else {

                data.put("date",array.get(0));//date

                dataSub.put("status",array.get(1));//status
                dataSub.put("count",array.get(2));//count
                dataList.add(dataSub);
                data.put("data",dataList);
                statistic.add(data);
            }
        }

        for (Map<String,Object> map:statistic) {
            List<Map<String,Object>> dataList = (List<Map<String, Object>>) map.get("data");
            for (int i = 0; i<dataList.size();i++){
                if (dataList.get(i).get("status").equals(0)){
                    break;
                }
                if (i==dataList.size()-1) {
                    Map<String, Object> newMap = new HashMap<String, Object>();
                    newMap.put("status", 0);
                    newMap.put("count", 0);
                    dataList.add(newMap);
                }
            }

            for (int i = 0; i<dataList.size();i++){
                if (dataList.get(i).get("status").equals(-1)){
                    break;
                }
                if (i==dataList.size()-1){
                    Map<String,Object> newMap = new HashMap<String,Object>();
                    newMap.put("status",-1);
                    newMap.put("count",0);
                    dataList.add(newMap);
                }
            }

            for (int i = 0; i<dataList.size();i++){
                if (dataList.get(i).get("status").equals(-2)){
                    break;
                }
                if (i==dataList.size()-1) {
                    Map<String, Object> newMap = new HashMap<String, Object>();
                    newMap.put("status", -2);
                    newMap.put("count", 0);
                    dataList.add(newMap);
                }
            }
        }
        return statistic;
    }
}
