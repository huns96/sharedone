package com.sharedOne.domain.report;

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
    private String upduser;
    private String upddate;
    private String comment;

    //-------order_item--------
    private String product_code;
    private  int quantity;
    private String currency;
    private int price;

    //----------------------
    private String buyer_name;
    private String adduser_name;
    private String upduser_name;
    private String product_name;



//    private int sumQuantity;
//    private int sumPrice;


}
