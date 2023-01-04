package com.sharedOne.controller;

import com.sharedOne.domain.MemberDto;
import com.sharedOne.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("signup")
    public void signup(){

    }

    @GetMapping("login")
    public void login(){

    }

    @GetMapping("list")
    public void list(Model model){
    List<MemberDto> memberList = memberService.memberList();
    System.out.println(memberList);
    model.addAttribute("memberList", memberList);
    }
}
