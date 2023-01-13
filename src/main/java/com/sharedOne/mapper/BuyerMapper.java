package com.sharedOne.mapper;

import com.sharedOne.domain.BuyerDto;
import com.github.pagehelper.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BuyerMapper {
    Page<BuyerDto> selectBuyers();

    int insertBuyer(BuyerDto buyer);

    int updateBuyer(BuyerDto buyer);

    int deleteBuyer(String buyer_code);

    List<BuyerDto> selectBuyersByKeyword(String type, String newKeyword);
}
