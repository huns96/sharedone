package com.example.sharedOne.controller.Kyj;


import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Random;

@Controller
@RequestMapping("buyer")
public class BuyerController {

    @Autowired
    private BuyerService buyerService;

    @GetMapping("list")
    public String list(Model model){
        List<BuyerDto> buyerList = buyerService.getBuyers();
        model.addAttribute("buyerList",buyerList);

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
}
