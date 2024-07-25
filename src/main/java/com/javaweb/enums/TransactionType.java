package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum TransactionType {
    CSKH("Chăm sóc khách hàng"),
    DDX("Dẫn đi xem");

    private String name;

    TransactionType(String name) {
        this.name = name;
    }
    public static Map<String,String> transactionType()
    {
        Map<String,String> map = new HashMap<String,String>();
        for(TransactionType it : TransactionType.values())
        {
            map.put(it.toString(),it.name);
        }
        return map;
    }
}
