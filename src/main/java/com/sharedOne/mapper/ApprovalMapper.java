package com.sharedOne.mapper;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ApprovalMapper {
    List<OrderDto> approvalList(int offset, int records);

    List<OrderItemDto> listItem(String orderCode);

    int countAll();
}
