package com.sharedOne.controller;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.domain.PriceDto;
import com.sharedOne.service.ApprovalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("approval")
public class SmallController {

    @Autowired(required=false)
    private ApprovalService approvalService;

    @GetMapping("approvalList")
    public void list(@RequestParam(name = "page", defaultValue = "1") int page,
                     PageInfo pageInfo,
                     Model model) {

        System.out.print(page);
        System.out.print(pageInfo);

        List<OrderDto> list = approvalService.approvalList(page, pageInfo);

        model.addAttribute("approvalList", list);


    }

    @GetMapping("itemList")
    @ResponseBody
    public List<OrderItemDto> itemList(@RequestBody String orderCode) {
        List<OrderItemDto> itemList = approvalService.getItemList(orderCode);
        return itemList;
    }

    @PutMapping("modify")
    public Map<String, Object> update(@Validated PriceDto priceDto){

        Map<String, Object> map = new HashMap<>();
//        int cnt = approvalService.modify(orderDto);

//        if (cnt == 1) {
//            map.put("message", "승인되었습니다.");
//        } else {
//            map.put("message", "승인되지 않았습니다.");
//        }

        return map;

    }

}
