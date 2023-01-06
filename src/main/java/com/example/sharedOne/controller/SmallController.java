package com.example.sharedOne.controller;

import com.example.sharedOne.domain.PageInfo;
import com.example.sharedOne.domain.PriceDto;
import com.example.sharedOne.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("order")
public class SmallController {

    @Autowired(required=false)
    private PriceService priceService;

    @GetMapping("approvalList")
    public void list(@RequestParam(name = "page", defaultValue = "1") int page,
                     PageInfo pageInfo,
                     Model model) {

        System.out.print(page);
        System.out.print(pageInfo);

        List<PriceDto> list = priceService.listPrice(page, pageInfo);

        model.addAttribute("approvalList", list);


    }

    @PutMapping("modify")
    public Map<String, Object> update(@Validated PriceDto priceDto){

        Map<String, Object> map = new HashMap<>();
//        int cnt = priceService.modify(orderDto);

//        if (cnt == 1) {
//            map.put("message", "승인되었습니다.");
//        } else {
//            map.put("message", "승인되지 않았습니다.");
//        }

        return map;

    }

}
