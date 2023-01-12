package com.sharedOne.domain.report;

import lombok.Data;

@Data
public class OrderGroupDto {
    private String groupName;
    private int sumQuantity;
    private int sumPrice;

}
