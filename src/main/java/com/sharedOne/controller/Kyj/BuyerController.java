package com.sharedOne.controller.Kyj;


import com.sharedOne.domain.BuyerDto;
import com.sharedOne.service.BuyerService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @GetMapping("list")
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
    public String listSearch(Model model,
            @RequestParam(name ="search", defaultValue = "all")String type,
                             @RequestParam(name ="keyword", defaultValue = "")String keyword){

//        System.out.println(type + " " + keyword);
        String newKeyword = "%"+keyword+"%";
        List<BuyerDto> buyerLists = buyerService.getBuyersByKeyword(type,newKeyword);

        System.out.println(buyerLists);
        model.addAttribute("buyerList",buyerLists);

        return "buyer/list";
    }

    @PostMapping("register")
    public String register(BuyerDto buyer, RedirectAttributes redirectAttributes){
        String buyer_code ="";
        buyer_code+= buyer.getCountry().substring(0,2).toUpperCase();
        Random random = new Random();
        int num = random.nextInt(10000);
        String strNum = String.format("%04d", num);
        buyer_code +=strNum;
        System.out.println(buyer_code); // buyer_code 만듬
        buyer.setBuyer_code(buyer_code);
        buyer.setAdduser("admin");

        int insertBuyer = buyerService.insertBuyer(buyer);

        if(insertBuyer == 1){
            redirectAttributes.addFlashAttribute("message","등록 완료");
        }else{
            redirectAttributes.addFlashAttribute("message","등록 실패");
        }

        return "redirect:/buyer/list";
    }

    @PostMapping("modify")
    public String modify(BuyerDto buyer,RedirectAttributes redirectAttributes){
        buyer.setUpduser("admin");
        Timestamp now = new Timestamp(System.currentTimeMillis());
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
