package com.sharedOne.mapper;

import com.github.pagehelper.Page;
import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApprovalMapper {
//    List<OrderDto> approvalList(int offset, int records, String type, String orderCode, String buyerCode);

    Page<OrderItemDto> listItem(String orderCode, String requestDate);

    OrderDto getOrder(String orderCode);


//    int countAll(String orderCode, String buyerCode, String type);

    int approvalOrder(OrderDto orderDto);

    int returnOrder(OrderDto orderDto);

    int cancelOrder(OrderDto orderDto);

    Page<OrderDto> listOrder(String orderCode, String buyerCode, String status, String userId);
}
