package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.SearchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SearchService {

    @Autowired
    private SearchMapper searchMapper;

    public Page<BuyerDto> getBuyerList(String type, String value) {
        return searchMapper.getBuyerList(type, "%" + value + "%");
    }

    public Page<OrderItemDto> getItemList(String buyer_code, String request_date, String type, String value) {
        return searchMapper.getItemList(buyer_code, request_date, type, "%" + value + "%");
    }

    public Page<MemberDto> getMemberList(String type, String value) {
        return searchMapper.getMemberList(type, "%" + value + "%");
    }
}