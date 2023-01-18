package com.sharedOne.domain.report;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;

@Data
public class OrderDto {

//                             @RequestParam(required = false) String order_code,
//                             @RequestParam(required = false) String buyer_code,
//                             @RequestParam(required = false) String status,
//                             @RequestParam(required = false) String adduser,
//                             @RequestParam(required = false) String from_request_date,
//                             @RequestParam(required = false) String to_request_date,
//                             @RequestParam(required = false) String from_add_date,
//                             @RequestParam(required = false) String to_add_date,
//                             @RequestParam(required = false) String product_code,
//                             @RequestParam(required = false, defaultValue = "i.num") String sumCondition,

    //-------search---------------
    private int offset;
    private int records;
    private String from_request_date;
    private String to_request_date;
    private String from_add_date;
    private String to_add_date;
    private String sumCondition;
    //-------order_header--------
    private String order_code;
    private String buyer_code;
    private Timestamp order_date;
    private Timestamp request_date;
    private String status;
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
    private int quantity;
    private String currency;
    private int price;
    //--------join-----------
    private String buyer_name;
    private String adduser_name;
    private String upduser_name;
    private String product_name;

    private int countAll;
}
