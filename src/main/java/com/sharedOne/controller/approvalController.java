package com.sharedOne.controller;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.service.ApprovalService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("approval")
@Slf4j
public class approvalController {

    @Autowired
    private ApprovalService approvalService;

    @GetMapping("approvalList")
    @PreAuthorize("hasAnyAuthority('팀장', '관리자')")
    public void list(@RequestParam(name = "page", defaultValue = "1") int page, PageInfo pageInfo, Model model
                    ,@RequestParam(name="t", defaultValue = "all") String type,
                     @RequestParam(name="q", defaultValue = "") String keyword) {
        List<OrderDto> list = approvalService.approvalList(page, pageInfo, type, keyword);
        model.addAttribute("approvalList", list);


        log.info("orderList ========> {}", list);
    }


    @RequestMapping("itemList")
    @ResponseBody
    public List<OrderItemDto> itemList(@RequestParam String orderCode) {
        List<OrderItemDto> itemList = approvalService.getItemList(orderCode);
        log.info("itemList ========> {}", itemList);
        return itemList;
    }

//    @GetMapping("approvalModify")
//    public void modify(String orderCode, Model model) {
//        OrderDto orderDto = approvalService.getOrderInfo(orderCode);
//        model.addAttribute("order", orderDto);
//
//    }

    @PostMapping("approvalModify")
    public String approval(OrderDto orderDto, RedirectAttributes rttr) {

        int num = orderDto.getNum();
        System.out.print("num:::::::"+num+"::::::::::");

        int check = approvalService.approvalModify(orderDto);
        if (check ==1) {
            rttr.addFlashAttribute("message", "승인완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "승인실패하였습니다.");
        }

        return "redirect:/approval/approvalList";
    }


    @PostMapping("returnModify")
    public String returnModify(OrderDto orderDto, RedirectAttributes rttr) {

        int num = orderDto.getNum();
        System.out.print("num:::::::"+num+"::::::::::");

        int check = approvalService.returnModify(orderDto);
        if (check ==1) {
            rttr.addFlashAttribute("message", "승인완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "승인실패하였습니다.");
        }

        return "redirect:/approval/approvalList";
    }

    @PostMapping("cancel")
    public String cancel(OrderDto orderDto, RedirectAttributes rttr) {

        int num = orderDto.getNum();
        System.out.print("num:::::::"+num+"::::::::::");

        int check = approvalService.cancel(orderDto);
        if (check ==1) {
            rttr.addFlashAttribute("message", "승인완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "승인실패하였습니다.");
        }

        return "redirect:/approval/approvalList";
    }



}
