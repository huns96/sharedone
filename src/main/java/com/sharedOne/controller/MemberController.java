package com.sharedOne.controller;

import com.sharedOne.domain.MemberDto;
import com.sharedOne.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    model.addAttribute("memberList", memberList);
    }

    @PostMapping("addMember")
    @Transactional
    public String addMember(MemberDto memberDto, String user_id){
        memberService.insertMember(memberDto);
        memberService.insertAutho(user_id);
        return "redirect:/member/list";
    }
}
