package com.example.sharedOne.controller;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.domain.PageInfo;
import com.example.sharedOne.domain.PriceDto;
import com.example.sharedOne.service.BuyerService;
import com.example.sharedOne.service.PriceService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.util.JSONPObject;
import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("price")
public class SampleController {

    @Autowired(required=false)
    private PriceService priceService;

//    @GetMapping("price")
//    public void pricelist (Model model){
//        List<PriceDto> pricelist = priceService.getPrice();
//        model.addAttribute("pricelist", pricelist);
//
//        System.out.print("========"+pricelist);
//    }

//    @GetMapping({"modify"})
//    public void modify(int num, Model model) {
//
//        PriceDto priceDto = priceService.get(num);
//
//        model.addAttribute("price", priceDto);
//
//    }

    @PutMapping("pricelist")
    public Map<String, Object> update(@Validated PriceDto priceDto){

        Map<String, Object> map = new HashMap<>();
        int cnt = priceService.modify(priceDto);

		if (cnt == 1) {
			map.put("message", "수정되었습니다.");
		} else {
			map.put("message", "수정되지 않았습니다.");
		}

		return map;

    }

//    @GetMapping("register")
//    public void register(){
//
//    }

//    @PostMapping("register")
    @PostMapping("pricelist")
    public Map<String, Object> register(PriceDto price){
        Map<String, Object> map = new HashMap<>();
        int check = priceService.register(price);
        if (check ==1) {
            map.put("message", "등록완료되었습니다.");
        } else {
            map.put("massage", "등록실패하였습니다.");
        }


        return map;
    }

    @GetMapping("pricelist")
//    @RequestMapping(value = "list", produces="application/json;charset=utf-8")
    public List<PriceDto> list(@RequestParam(name = "page", defaultValue = "1") int page,
                               PageInfo pageInfo,
                               Model model) {

        System.out.print(page);
        System.out.print(pageInfo);

        List<PriceDto> list = priceService.listPrice(page, pageInfo);



        model.addAttribute("priceList", list);

        System.out.print(list);
        return list;
    }

    @GetMapping("buyerList")
    public void list(@RequestParam(name="t", defaultValue = "all") String type,
                     @RequestParam(name="q", defaultValue = "") String keyword,
                     Model model) {



        List<BuyerDto> list = priceService.searchBuyer(type, keyword);

        model.addAttribute("buyers", list);

    }



}
