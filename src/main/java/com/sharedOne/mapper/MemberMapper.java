package com.sharedOne.mapper;

import com.sharedOne.domain.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MemberMapper {
    List<MemberDto> memberList();
    int insertMember(String user_id, String password, String name, String phone, String adduser);
}
