package com.example.sharedOne.domain;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.DateFormat;

@Data
public class ProductDto {
    private String product_code;
    private String name;
    private String ea;
    private String category_id;

    private String delyn;
    private String adduser;
    private Date adddate;
    private String upduser;
    private Date upddate;




}
