package com.example.sharedOne.mapper.report;

import com.example.sharedOne.domain.report.OrderDto;
import com.example.sharedOne.domain.report.OrderItemDto;
import com.example.sharedOne.domain.report.SumDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {
    public List<OrderDto> selectOrders(String order_code, String buyer_code,
                                       String status, String adduser, String from_add_date,
                                       String to_add_date, String product_code);


//public List<OrderDto> selectOrders(Map<String,Object> map);


    public List<String> searchOrderCode(String order_code_part);


    List<OrderItemDto> getOrderItems(String product_code);

    SumDto getSums(String order_code, String buyer_code, String status,
                         String adduser, String from_add_date, String to_add_date,
                         String product_code, String sumCondition);
}


