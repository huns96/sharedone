package com.example.sharedOne.controller;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.service.BuyerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("main")
public class MainController {

    @Autowired
    private BuyerService buyerService;

    @GetMapping ("main2")
    public void mainPage(){

    }

    @GetMapping ("buyerlist")
    public void buyers(Model model){
        BuyerDto buyerlist = buyerService.getBuyers();
        model.addAttribute("buyers", buyerlist);
    }

}
