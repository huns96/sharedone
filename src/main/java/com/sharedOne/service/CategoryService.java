package com.sharedOne.service;

import com.sharedOne.domain.CategoryDto;
import com.sharedOne.mapper.CategoryMapper;
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

    public List<CategoryDto> getListByIdSub(int middle_id) {
        return categoryMapper.selectByIdSub(middle_id);
    }
}
