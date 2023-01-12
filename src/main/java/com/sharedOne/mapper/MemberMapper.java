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

    int deleteMember(String user_id, String upduser);

    int setAutho(String user_id, String auth);

    int modifyMember(String user_id, String name, String phone, String upduser);

    MemberDto selectUserInfo(String user_id);

    String authCheck(String user_id, String auth);
}
