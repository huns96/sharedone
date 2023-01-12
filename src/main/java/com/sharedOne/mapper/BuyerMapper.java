package com.sharedOne.mapper;

import com.sharedOne.domain.BuyerDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BuyerMapper {
    BuyerDto selectBuyers();
}
