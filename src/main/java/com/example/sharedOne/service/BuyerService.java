package com.example.sharedOne.service;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.mapper.BuyerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyerService {
    @Autowired
    private BuyerMapper buyerMapper;

    public BuyerDto getBuyers() {
        return buyerMapper.selectBuyers();
    }
}
