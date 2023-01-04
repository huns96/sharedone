package com.example.sharedOne.service;

import com.example.sharedOne.domain.ProductDto;
import com.example.sharedOne.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<ProductDto> getList(){
        return productMapper.getList();
    }
}
