package com.example.sharedOne.mapper.report;

import com.example.sharedOne.domain.OrderDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {
    public List<OrderDto> selectOrders(String order_code, String type);

    public List<String> searchOrderCode(String order_code_part);


}


