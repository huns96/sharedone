package com.example.sharedOne.domain;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;

@Data
public class PriceDto {
    private int num;
    private String buyer_code;
    private String buyer_name;
    private String product_code;
    private String product_name;
    private int price;
    private Date start_date;
    private Date end_date;
    private String currency;


    private String delyn;
    private String adduser;
    private Date adddate;
    private String upduser;
    private Date upddate;




}
