package com.sharedOne.mapper;

import com.sharedOne.domain.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface ProductMapper {
    List<ProductDto> getList();


    int insertProduct(String product_code, String name, String ea, int category_id, String adduser);

    int deleteProduct(String product_code);
}
