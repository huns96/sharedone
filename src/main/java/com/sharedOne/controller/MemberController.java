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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("member")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @GetMapping("signup")
    public void signup() {

    }

    @GetMapping("login")
    public void login() {

    }

    @GetMapping("list")
    public void list(Model model) {
        List<MemberDto> memberList = memberService.memberList();
        model.addAttribute("memberList", memberList);
    }

    @PostMapping("addMember")
    @Transactional
    public String addMember(MemberDto memberDto, String user_id) {
        memberService.insertMember(memberDto);
        memberService.insertAutho(user_id);
        return "redirect:/member/list";
    }

    @PostMapping("deleteMember")
    @Transactional
    public String deleteMember(String user_id, Principal principal) {
        String upduser = principal.getName();
        memberService.deleteMember(user_id, upduser);
        return "redirect:/member/list";
    }

    @PostMapping("setAutho")
    public String setAutho(String user_id, String auth, RedirectAttributes redirectAttributes) {
        String setAutho = memberService.setAutho(user_id, auth);
        redirectAttributes.addFlashAttribute("result", setAutho);

        return "redirect:/member/list";
    }

    @PostMapping("modifyMember")
    public String modifyMember(String user_id, String name, String phone, Principal principal) {
        String upduser = principal.getName();
        memberService.modifyMember(user_id, name, phone, upduser);
        return "redirect:/member/list";
    }

    @GetMapping("myPage")
    public void myPage(Model model, Principal principal) {

        System.out.println(principal.getName());
        String user_id = principal.getName();
        MemberDto member = memberService.selectUserInfo(user_id);
        model.addAttribute("userInfo", member);
    }

    @PostMapping("deleteAutho")
    public String deleteAutho(MemberDto memberDto) {
        memberService.deleteAutho(memberDto);
        return "redirect:/member/list";
    }
}
