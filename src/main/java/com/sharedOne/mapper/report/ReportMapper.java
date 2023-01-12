package com.sharedOne.mapper.report;

import com.sharedOne.domain.report.OrderDto;
import com.sharedOne.domain.report.OrderGroupDto;
import com.sharedOne.domain.report.OrderItemDto;
import com.sharedOne.domain.report.SumDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {
    public List<OrderDto> selectOrders(String order_code, String buyer_code,
                                       String status,
                                       String from_request_date, String to_request_date,
                                       String adduser, String from_add_date,
                                       String to_add_date, String product_code);


//public List<OrderDto> selectOrders(Map<String,Object> map);


    public List<String> searchOrderCode(String order_code_part);


    List<OrderItemDto> getOrderItems(String product_code);

    SumDto getSums(String order_code, String buyer_code, String status,
                   String adduser,
                   String from_request_date, String to_request_date, String from_add_date, String to_add_date,
                   String product_code, String sumCondition);

    List<OrderGroupDto> selectOrderGroups(String order_code, String buyer_code, String status, String adduser,
                                          String from_request_date, String to_request_date,
                                          String from_add_date, String to_add_date, String product_code, String sumCondition);
}


