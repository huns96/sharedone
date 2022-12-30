package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.BuyerDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyerMapper {
    BuyerDto selectBuyers();
}
