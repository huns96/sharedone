package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;


    public Page<MemberDto> memberList(String keyword) {
        return memberMapper.memberList("%" + keyword + "%");
    }

    public void insertMember(MemberDto memberDto) {
        memberMapper.insertMember(memberDto);
    }

    public void insertAutho(String user_id) {

        memberMapper.insertAutho(user_id);
    }


    public void deleteMember(String user_id, String upduser) {
        memberMapper.deleteMember(user_id, upduser);
    }

    public String setAutho(String user_id, String auth) {
        String authCheck = memberMapper.authCheck(user_id, auth);
        if (authCheck != null) {

            return "exist";
        } else if (authCheck == null) {
            memberMapper.setAutho(user_id, auth);

            return "success";
        }

        return "error";
    }

    public String deleteAutho(String user_id, String auth) {
        String authCheck = memberMapper.authCheck(user_id, auth);

        if (authCheck != null) {
            memberMapper.deleteAutho(user_id, auth);
            return "success";
        } else if (authCheck == null) {
            return "not exist";
        }
        return "error";
    }

    public void modifyMember(String user_id, String name, String password, String phone, String upduser) {
        memberMapper.modifyMember(user_id, name, password, phone, upduser);
    }

    public MemberDto selectUserInfo(String user_id) {

        return memberMapper.selectUserInfo(user_id);
    }



}