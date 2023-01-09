package com.sharedOne.mapper;

import com.sharedOne.domain.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MemberMapper {
    List<MemberDto> memberList();
    int insertMember(MemberDto memberDto);

    int insertAutho(String user_id);

    MemberDto selectById(String user_id);

    int deleteMember(String userId);

    int setAutho(String user_id, String auth);

    int modifyMember(String user_id, String name, String phone);
}
