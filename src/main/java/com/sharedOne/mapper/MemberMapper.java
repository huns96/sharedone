package com.sharedOne.mapper;

import com.sharedOne.domain.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MemberMapper {
    List<MemberDto> memberList();
}
