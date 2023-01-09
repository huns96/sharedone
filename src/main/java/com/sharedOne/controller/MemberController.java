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
    public void list(Model model, String user_id){
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

    @PostMapping("deleteMember")
    @Transactional
    public String deleteMember(String user_id){
        memberService.deleteMember(user_id);
        return "redirect:/member/list";
    }

    @PostMapping("setAutho")
    public String setAutho(String user_id, String auth){
        memberService.setAutho(user_id, auth);
        return "redirect:/member/list";
    }

    @PostMapping("modifyMember")
    public String modifyMember(String user_id, String name, String phone){
        memberService.modifyMember(user_id, name, phone);
        return "redirect:/member/list";
    }
}
