package com.sharedOne.mapper;

import com.sharedOne.domain.CategoryDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryMapper {

    List<CategoryDto> selectById(int id);

    List<CategoryDto> selectByIdSub(int middle_id);
}
