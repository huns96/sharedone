package com.sharedOne.service;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
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

    public List<BuyerDto> getBuyerList() {
        return searchMapper.getBuyerList();
    }

    public List<OrderItemDto> getItemList(String buyer_code) {
        return searchMapper.getItemList(buyer_code);
    }
}
