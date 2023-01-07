package com.example.sharedOne.mapper;

import com.example.sharedOne.domain.CategoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {

    List<CategoryDto> selectById(int main_id);

}
