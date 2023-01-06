package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.domain.PriceDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PriceMapper {

    List<PriceDto> selectPrice();

    int insert(PriceDto price);

    int countAll();

    List<PriceDto> listPrice(int offset, int records);


    int update(PriceDto priceDto);

    List<BuyerDto> listBuyer(String type, String keyword);
}
