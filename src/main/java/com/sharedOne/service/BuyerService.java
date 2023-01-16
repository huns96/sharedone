package com.sharedOne.service;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.mapper.BuyerMapper;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BuyerService {
    @Autowired
    private BuyerMapper buyerMapper;

    public Page<BuyerDto> getBuyers() {
        return buyerMapper.selectBuyers();
    }

    public int insertBuyer(BuyerDto buyer) {
        return buyerMapper.insertBuyer(buyer);
    }

    public int updateBuyer(BuyerDto buyer) {
        return buyerMapper.updateBuyer(buyer);
    }

    public int deleteBuyer(String buyer_code) {
        return buyerMapper.deleteBuyer(buyer_code);
    }

    public Page<BuyerDto> getBuyersByKeyword(String type, String newKeyword) {
        return buyerMapper.selectBuyersByKeyword(type, newKeyword);
    }
}
