package com.sharedOne.mapper;

import com.github.pagehelper.Page;
import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(OrderDto orderDto);

    int insertOrderItem(OrderItemDto itemDto);

    Page<OrderDto> listOrder(String orderCode, String buyerCode, String status, String userId);

    Page<OrderItemDto> listItem(String orderCode, String requestDate);

    OrderDto getOrder(String orderCode);

    int updateOrder(OrderDto orderDto);

    void updateOrderItem(OrderItemDto item);

    void removeOrderItem(OrderItemDto item);

    int changeStatus(OrderDto orderDto);

    /*void removeOrder(OrderDto orderDto);

    void removeAllOrderItem(OrderItemDto item);*/
}
