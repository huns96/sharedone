package com.sharedOne.mapper;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApprovalMapper {
    List<OrderDto> approvalList(int offset, int records, String type, String keyword);

    List<OrderItemDto> listItem(String orderCode);

    OrderDto getOrder(String orderCode);

    int changeStatus(OrderDto orderDto);

    int countAll(String keyword, String type);

    int approvalOrder(OrderDto orderDto);

    int returnOrder(OrderDto orderDto);

    int cancelOrder(OrderDto orderDto);
}
