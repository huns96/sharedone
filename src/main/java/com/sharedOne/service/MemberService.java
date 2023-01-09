package com.sharedOne.service;

import com.sharedOne.domain.MemberDto;
import com.sharedOne.mapper.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;


    public List<MemberDto> memberList() {

        return memberMapper.memberList();
    }

    public void insertMember(MemberDto memberDto) {
        memberMapper.insertMember(memberDto);
    }

    public void insertAutho(String user_id) {
        memberMapper.insertAutho(user_id);
    }


    public void deleteMember(String userId) {
        memberMapper.deleteMember(userId);
    }

    public void setAutho(String user_id, String auth) {
        memberMapper.setAutho(user_id, auth);
    }

    public void modifyMember(String user_id, String name, String phone) {
        memberMapper.modifyMember(user_id, name, phone);
    }
}
