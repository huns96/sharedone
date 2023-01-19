package com.sharedOne.controller.Kyj;


import com.sharedOne.domain.BuyerDto;
import com.sharedOne.service.BuyerService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.core.Local;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @GetMapping("list")
    @PreAuthorize("hasAnyAuthority('팀원', '팀장', '관리자')")
    public String list(Model model, @RequestParam(defaultValue = "1")int page){
        PageHelper.startPage(page,10);
        Page<BuyerDto> buyerList = buyerService.getBuyers();


        model.addAttribute("pageNum", buyerList.getPageNum());
        model.addAttribute("pageSize", buyerList.getPageSize());
        model.addAttribute("pages", buyerList.getPages());
        model.addAttribute("total",buyerList.getTotal());
        model.addAttribute("buyerList", buyerList.getResult());

        return "buyer/list";
    }

    @GetMapping("listSearch")
    @PreAuthorize("hasAnyAuthority('팀원', '팀장', '관리자')")
    public String listSearch(Model model, @RequestParam(defaultValue = "1")int page,
            @RequestParam(name ="search", defaultValue = "all")String type,
                             @RequestParam(name ="keyword", defaultValue = "")String keyword){

        PageHelper.startPage(page,10);
//        System.out.println(type + " " + keyword);
        String newKeyword = "%"+keyword+"%";
        Page<BuyerDto> buyerLists = buyerService.getBuyersByKeyword(type,newKeyword);

        System.out.println(buyerLists);
        model.addAttribute("pageNum", buyerLists.getPageNum());
        model.addAttribute("pageSize", buyerLists.getPageSize());
        model.addAttribute("pages", buyerLists.getPages());
        model.addAttribute("total",buyerLists.getTotal());
        model.addAttribute("buyerList", buyerLists.getResult());
        model.addAttribute("type",type);
        model.addAttribute("keyword",keyword);
        return "buyer/list";
    }

    @PostMapping("register")
    public String register(BuyerDto buyer, RedirectAttributes redirectAttributes, Principal principal){
        String user_id = principal.getName();
        System.out.println("아이디" + user_id);
        String buyer_code ="";
        buyer_code+= buyer.getCountry().substring(0,2).toUpperCase();
        Random random = new Random();
        int num = random.nextInt(10000);
        String strNum = String.format("%04d", num);
        buyer_code +=strNum;
        System.out.println(buyer_code); // buyer_code 만듬
        buyer.setBuyer_code(buyer_code);
        buyer.setAdduser(user_id);
        System.out.println("this is buyer" + buyer);

        int insertBuyer = buyerService.insertBuyer(buyer);

        if(insertBuyer == 1){
            redirectAttributes.addFlashAttribute("message","등록 완료");
        }else{
            redirectAttributes.addFlashAttribute("message","등록 실패");
        }

        return "redirect:/buyer/list";
    }

    @PostMapping("modify")
    public String modify(BuyerDto buyer,RedirectAttributes redirectAttributes, Principal principal) {
        String user_id = principal.getName();
        buyer.setUpduser(user_id);
        LocalDate now = LocalDate.now();
        buyer.setUpddate(now);
//        System.out.println(buyer);
        int updateBuyer = buyerService.updateBuyer(buyer);
//        System.out.println(updateBuyer);
        if(updateBuyer ==1){
            redirectAttributes.addFlashAttribute("message","수정 완료");
        }else{
            redirectAttributes.addFlashAttribute("message","수정 실패");
        }
        return "redirect:/buyer/list";
    }
    @PostMapping("delete")
    public String delete(String checkedList,RedirectAttributes redirectAttributes){
        String[] checked = checkedList.split(",");
        int number = checked.length;
        int cnt = 0;
        for(int i=0;i<checked.length;i++){
            cnt += buyerService.deleteBuyer(checked[i]);
        }

        if(number == cnt){
            redirectAttributes.addFlashAttribute("message","수정 완료");
        }else{
            redirectAttributes.addFlashAttribute("message","수정 실패");
        }
        return "redirect:/buyer/list";

    }

}
