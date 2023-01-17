package com.sharedOne.mapper;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OrderMapper {
    int insertOrder(OrderDto orderDto);

    int insertOrderItem(OrderItemDto itemDto);

    List<OrderDto> listOrder(String orderCode, String buyerCode, String status, String userId);

    List<OrderItemDto> listItem(String orderCode);

    OrderDto getOrder(String orderCode);

    int updateOrder(OrderDto orderDto);

    void updateOrderItem(OrderItemDto item);

    void removeOrderItem(OrderItemDto item);

    int changeStatus(OrderDto orderDto);

    /*void removeOrder(OrderDto orderDto);

    void removeAllOrderItem(OrderItemDto item);*/
}
