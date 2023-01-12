package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.domain.OrderItemDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {

    List<BuyerDto> getBuyerList();

    List<OrderItemDto> getItemList(String buyer_code);
}
