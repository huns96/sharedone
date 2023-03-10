package com.sharedOne.mapper.member;

import com.github.pagehelper.Page;
import com.sharedOne.domain.member.MemberDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface MemberMapper {
    Page<MemberDto> memberList(String keyword);
    int insertMember(MemberDto item);

    int insertAutho(String user_id);

    MemberDto selectById(String user_id);

    int deleteMember(String user_id, String upduser);

    int setAutho(String user_id, String auth);

    int modifyMember(String user_id, String name, String password, String phone, String upduser);

    MemberDto selectUserInfo(String user_id);

    String authCheck(String user_id, String auth);

    int deleteAutho(String user_id, String auth);
}
