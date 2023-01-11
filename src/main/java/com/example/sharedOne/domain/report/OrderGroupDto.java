package com.example.sharedOne.domain.report;

import lombok.Data;

@Data
public class OrderGroupDto {
    private String sumCondition;
    private int sumQuantity;
    private int sumPrice;

}
