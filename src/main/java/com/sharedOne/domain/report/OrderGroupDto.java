package com.sharedOne.domain.report;

import lombok.Data;

@Data
public class OrderGroupDto {
    private String year;
    private String sumCondition;
    private String GroupName;
    private String buyer_name;
    private String adduser_name;
    private int sumQuantity;
    private int sumPrice;


}
