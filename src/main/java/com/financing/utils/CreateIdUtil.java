package com.financing.utils;

import java.util.Random;

/**
 * @author Penny
 */
public class CreateIdUtil {
    final static int[] sizeList ={9,99,999,9999,99999,999999,
            9999999,99999999,999999999};
    //int max=2147483647


    public static String generateSequId(int length){
        Random random = new Random();
        int num = random.nextInt(sizeList[length-1]+1);
        String Id = "";
        int digit = sizeOfInt(num);
        for (int i=0;i<length-digit;i++){
            Id=Id+"0";
        }
        System.out.println("num="+num+" id="+Id);
        return Id+num;
    }

    public static int sizeOfInt(int num){
        for (int i=0;;i++){
            if (num<=sizeList[i])
                return i+1;
        }
    }
}
