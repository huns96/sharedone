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

    public void insertMember(String user_id, String password, String name, String phone, String adduser) {
        System.out.println("서비스 : " + user_id);
        System.out.println("서비스 : " + name);
        memberMapper.insertMember(user_id, password, name, phone, adduser);
    }
}
