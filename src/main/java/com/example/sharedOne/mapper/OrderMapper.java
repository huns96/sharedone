package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(OrderDto orderDto);

    List<OrderDto> listOrder();

    List<OrderItemDto> listItem(String order_code);
}
