package com.sharedOne.controller;

import com.sharedOne.domain.MemberDto;
import com.sharedOne.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    @Transi
    public String addMember(
            @RequestParam String user_id,
            @RequestParam String password,
            @RequestParam String name,
            @RequestParam String phone,
            @RequestParam String adduser){
        System.out.println("user_id: " + user_id);
        System.out.println("name: " + name);
        System.out.println("adduser: " + adduser);
        memberService.insertMember(user_id, password, name, phone, adduser);

        memberService.insertAutho(user_id);
        return "redirect:/member/list";
    }
}
