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


    public void deleteMember(String user_id, String upduser) {
        memberMapper.deleteMember(user_id, upduser);
    }

    public void setAutho(String user_id, String auth) {
        List<String> authList = memberMapper.selectUserInfo(user_id).getAuth();
        MemberDto memberDto= memberMapper.selectUserInfo(user_id);

        System.out.println("냥냥펀치"+ memberDto );
        /*memberMapper.setAutho(user_id, auth);*/
    }

    public void modifyMember(String user_id, String name, String phone, String upduser) {
        memberMapper.modifyMember(user_id, name, phone, upduser);
    }

    public MemberDto selectUserInfo(String user_id) {

        return memberMapper.selectUserInfo(user_id);
    }

    public void deleteAutho(MemberDto memberDto) {
    }
}
