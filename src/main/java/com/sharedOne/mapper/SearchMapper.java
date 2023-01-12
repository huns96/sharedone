package com.sharedOne.mapper;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {

    List<BuyerDto> getBuyerList();

    List<OrderItemDto> getItemList(String buyer_code);
}
