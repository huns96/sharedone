package com.sharedOne.controller.member;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.service.MemberService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("member")
@Slf4j
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
    @PreAuthorize("hasAuthority('관리자')")
    public String list(
            Model model,
            @RequestParam(name = "q", defaultValue = "") String keyword,
            @RequestParam(defaultValue = "1") int page) {
        PageHelper.startPage(page, 5);
        Page<MemberDto> memberList = memberService.memberList(keyword);
        model.addAttribute("memberList", memberList);
        model.addAttribute("pageNum", memberList.getPageNum());
        model.addAttribute("pageSize", memberList.getPageSize());
        model.addAttribute("pages", memberList.getPages());
        model.addAttribute("total", memberList.getTotal());
        model.addAttribute("memberList", memberList.getResult());

        return "member/list";
    }

    @PostMapping("addMember")
    @Transactional
    //public String addMember(MemberDto memberDto, String user_id) {
    public String addMember(List<String> addMemList) {
        for (int i = 0; i < addMemList.size(); i++){
            System.out.println("목록" + addMemList.get(0));
            System.out.println("목록" + addMemList.get(1));
        }
        //memberService.insertMember(memberDto);
        //memberService.insertAutho(user_id);
        return "redirect:/member/list";
    }

    @GetMapping("addMembers")
    public void addMembers(){

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

    @PostMapping("deleteAutho")
    public String deleteAutho(String user_id, String auth, RedirectAttributes redirect) {
        MemberDto member = memberService.selectUserInfo(user_id);
        List<String> authList = member.getAuth();
        if (authList.size() == 1) {
            redirect.addFlashAttribute("authMustHaveOne", authList.size());
        } else {
            String deleteAutho = memberService.deleteAutho(user_id, auth);
            redirect.addFlashAttribute("deleteResult", deleteAutho);
        }
        return "redirect:/member/list";
    }

    @PostMapping("modifyMember")
    public String modifyMember(String user_id, String name, String password, String phone, Principal principal) {
        String upduser = principal.getName();
        memberService.modifyMember(user_id, name, password, phone, upduser);
        return "redirect:/member/list";
    }

    @GetMapping("myPage")
    public String myPage(Model model, Principal principal, SecurityContextHolder sch) {
        /*String user_id = principal.getName();*/
        String id = sch.getContext().getAuthentication().getPrincipal().toString();
        if (id == "anonymousUser") {
            return "redirect:/member/accessDenied";
        } else {
            String user_id = principal.getName();
            MemberDto member = memberService.selectUserInfo(user_id);
            model.addAttribute("userInfo", member);
        }
        return null;
    }

    @GetMapping("existId/{id}")
    @ResponseBody
    public Map<String, Object> existId(@PathVariable String id) {
        Map<String, Object> map = new HashMap<>();
        MemberDto member = memberService.selectUserInfo(id);
        if (member == null) {
            map.put("status", "not exist");
            map.put("message", "사용가능한 아이디입니다.");
        } else {
            map.put("status", "exist");
            map.put("message", "중복된 아이디입니다.");
        }
        return map;
    }

    @GetMapping("accessDenied")
    public void accessDenied(Model model) {
        log.info("MemberController:  accessDenied()");
        model.addAttribute("errMsg", "접근 권한이 없습니다.");
        model.addAttribute("url", "/member/login");
    }

}
