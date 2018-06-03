package com.financing.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Penny on 2018/5/17.
 */
public class DateUtil {


    /**
     * 字符串转日期
     * @param date
     * @return
     * @author Penny
     */
    public static Date StringToDate(String date) {
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        sdf.setLenient(false);
        try {
            return sdf.parse(date);
        } catch (ParseException e) {
            e.printStackTrace();
            throw new IllegalArgumentException("Illegal Date Format");
        }

    }

    /**
     * 日期转字符串
     * @param date
     * @return
     */
    public static String DateToString(Date date) {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String dateString = formatter.format(date);
        return dateString;
    }

    /**
     * 年月日时分秒毫秒 作为 编号
     * @return
     * @author Penny
     */
    public static String dateIDGenerator(){
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        String formatStr = format.format(new Date());
        return formatStr;
    }
}
