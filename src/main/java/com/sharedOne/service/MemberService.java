package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.mapper.member.MemberMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
public class MemberService {
    @Autowired
    private MemberMapper memberMapper;


    public Page<MemberDto> memberList(String keyword) {
        return memberMapper.memberList("%" + keyword + "%");
    }

    @Transactional
    public void insertMember(String[] addMemList, String user_id) {
        List<MemberDto> itemList = new ArrayList<>();
        if (!addMemList[0].contains(",")) {
            MemberDto memberDto = new MemberDto();
            List<String> list = Arrays.asList(addMemList);
            memberDto.setName(list.get(0));
            memberDto.setUser_id(list.get(1));
            memberDto.setPassword(list.get(2));
            memberDto.setPhone(list.get(3));
            memberDto.setAdduser(user_id);
            itemList.add(memberDto);
        } else {
            for (int i = 0; i < addMemList.length; i++) {
                List<String> list = Arrays.asList(addMemList[i].split(","));
                MemberDto memberDto = new MemberDto();
                memberDto.setName(list.get(0));
                memberDto.setUser_id(list.get(1));
                memberDto.setPassword(list.get(2));
                memberDto.setPhone(list.get(3));
                memberDto.setAdduser(user_id);
                itemList.add(memberDto);
            }
        }
            for (MemberDto item : itemList) {
                memberMapper.insertMember(item);
                memberMapper.insertAutho(item.getUser_id());
            }
    }

/*    public void insertAutho(String user_id) {


    }*/


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
