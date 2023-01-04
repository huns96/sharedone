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
}
