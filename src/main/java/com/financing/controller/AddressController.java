package com.financing.controller;

import com.financing.entity.Address;
import com.financing.entity.User;
import com.financing.service.AddressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Penny on 2018/5/21.
 */

@Controller
public class AddressController {

    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;


    @Autowired
    private AddressService addressService;

    /**
     * 添加收货地址
     * @param recipient
     * @param zone
     * @param postcode
     * @param detail
     * @param phone
     * @param session
     * @return
     */
    @RequestMapping(value = "/doAddAddress",method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> doAddAddress(@RequestParam String recipient, @RequestParam String zone, @RequestParam String postcode, @RequestParam String detail, @RequestParam String phone, HttpSession session){
        User user = (User) session.getAttribute("user");

        Address address = new Address();
        address.setUser(user);
        address.setRecipient(recipient);
        address.setPostcode(postcode);
        address.setZone(zone);
        address.setDetail(detail);
        address.setPhone(phone);

        addressService.addAddress(address);
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data","");
        return result;
    }

    /**
     * 获取用户收货地址列表
     * @param session
     * @return
     */
    @RequestMapping(value = "/doGetAddress",method = RequestMethod.GET)
    @ResponseBody
    public Map<String,Object> doGetAddress(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Address> addresses = addressService.getAddressListByUser(user);
        Map<String,Object> result = new HashMap<String,Object>();
        result.put("flag",SUCCESS_CODE);
        result.put("msg","success");
        result.put("data",addresses);
        return result;

    }

}
