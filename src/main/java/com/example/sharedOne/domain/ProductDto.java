package com.example.sharedOne.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ProductDto {
    private String product_code;
    private String name;
    private String ea;
    private int category_id;
    private String delyn;
    private String adduser;
    private Timestamp adddate;
    private String upduser;
    private Timestamp upddate;


    @Override
    public String toString() {
        return "ProductDto{" +
                "product_code='" + product_code + '\'' +
                ", name='" + name + '\'' +
                ", ea='" + ea + '\'' +
                ", category_id=" + category_id +
                ", delyn='" + delyn + '\'' +
                ", adduser='" + adduser + '\'' +
                ", adddate=" + adddate +
                ", upduser='" + upduser + '\'' +
                ", upddate=" + upddate +
                '}';
    }
}
