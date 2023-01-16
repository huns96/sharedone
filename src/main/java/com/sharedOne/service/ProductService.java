package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.mapper.ProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public Page<ProductDto> getList(){
        return productMapper.getList();
    }


    public int insertProduct(String product_code, String name, String ea, int category_id, String adduser) {
        return productMapper.insertProduct(product_code, name, ea, category_id, adduser);
    }

    public int deleteProduct(String product_code) {
        return productMapper.deleteProduct(product_code);
    }

    public Page<ProductDto> getProductByKeword(String type, String newKeyword) {
        return productMapper.selectProductByKeyword(type, newKeyword);
    }

    public Page<ProductDto> getListByCategory(int category) {
        return productMapper.selectListByCategory(category);
    }
}
