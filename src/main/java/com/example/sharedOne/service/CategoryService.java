package com.example.sharedOne.service;

import com.example.sharedOne.domain.CategoryDto;
import com.example.sharedOne.mapper.CategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public List<CategoryDto> getListById(int main_id) {
        return categoryMapper.selectById(main_id);
    }
}
