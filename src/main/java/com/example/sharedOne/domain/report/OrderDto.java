package com.example.sharedOne.domain.report;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class OrderDto {
    //-------order_header--------
    private String order_code;
    private  String buyer_code;
    private Timestamp order_date;
    private Timestamp request_date;
    private  String status;
    private Timestamp approval_date;
    private Timestamp return_date;
    private String memo;
    private String adduser;
    private String adddate;

    //-------order_item--------
    private String product_code;
    private  int quantity;
    private String currency;
    private int price;

    //----------------------
//    private int sumQuantity;
//    private int sumPrice;


}
