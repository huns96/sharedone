package com.sharedOne.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BuyerDto {
    private String buyer_code;
    private String name;
    private String address;
    private String country;
    private String license;
    private String contact;

    private String delyn;
    private String adduser;
    private Timestamp adddate;
    private String upduser;
    private Timestamp upddate;



}
