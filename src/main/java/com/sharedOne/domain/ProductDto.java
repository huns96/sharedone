package com.sharedOne.domain;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;

@Data
public class ProductDto {
    private String product_code;
    private String name;
    private String ea;
    private int category_id;
    private String delyn;
    private String adduser;
    private LocalDate adddate;
    private String upduser;
    private LocalDate upddate;

    private String main_cat;
    private String middle_cat;
    private String sub_cat;


}
