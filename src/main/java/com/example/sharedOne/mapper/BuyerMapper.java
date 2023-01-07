package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.BuyerDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuyerMapper {
    List<BuyerDto> selectBuyers();

    int insertBuyer(BuyerDto buyer);
}
