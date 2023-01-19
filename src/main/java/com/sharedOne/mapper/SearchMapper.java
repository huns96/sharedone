package com.sharedOne.mapper;

import com.github.pagehelper.Page;
import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.member.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SearchMapper {

    Page<BuyerDto> getBuyerList(String type, String value);

    Page<OrderItemDto> getItemList(String buyer_code, String request_date, String type, String value);

    Page<MemberDto> getMemberList(String type, String value);
}