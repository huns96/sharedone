package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.OrderDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {


    int insertOrder(OrderDto orderDto);

    List<OrderDto> listOrder();
}
