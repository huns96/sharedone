package com.example.sharedOne.service;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.domain.OrderItemDto;
import com.example.sharedOne.mapper.SearchMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class SearchService {

    @Autowired
    private SearchMapper searchMapper;

    public List<BuyerDto> getBuyerList() {
        return searchMapper.getBuyerList();
    }

    public List<OrderItemDto> getItemList(String buyer_code) {
        return searchMapper.getItemList(buyer_code);
    }
}
