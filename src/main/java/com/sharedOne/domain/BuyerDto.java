package com.sharedOne.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;
import java.time.LocalDate;

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

    private LocalDate adddate;
    private String upduser;

    private LocalDate upddate;



}
