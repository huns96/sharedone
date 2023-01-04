package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ProductMapper {
    List<ProductDto> getList();

}
