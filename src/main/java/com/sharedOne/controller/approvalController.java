package com.sharedOne.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.service.ApprovalService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("approval")
@Slf4j
public class approvalController {

    @Autowired
    private ApprovalService approvalService;

    @GetMapping("approvalList")
    public void list(@RequestParam(required = false) String orderCode,
                     @RequestParam(required = false) String buyerCode,
                     @RequestParam(required = false) String status,
                     @RequestParam(required = false) String userId,
                     @RequestParam(defaultValue = "1")int page,
                     Model model) {

        PageHelper.startPage(page,7);
        Page<OrderDto> list = approvalService.approvalList(orderCode, buyerCode, status, userId);

        model.addAttribute("pageNum", list.getPageNum());
        model.addAttribute("pageSize", list.getPageSize());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("total",list.getTotal());
        model.addAttribute("approvalList", list);

//        List<OrderDto> list = (page, pageInfo, type, keyword);
//        model.addAttribute("approvalList", list);
    }


    @RequestMapping("itemList")
    @ResponseBody
    public Page<OrderItemDto> itemList(@RequestParam String orderCode,
                                       @RequestParam String requestDate,
                                       @RequestParam(defaultValue = "1")int page,
                                       Model model) {
        //PageHelper.startPage(page,4);
        Page<OrderItemDto> list = approvalService.getItemList(orderCode, requestDate);
        //log.info("list itemDto ===============> {}", list);
        model.addAttribute("pageNum_item", list.getPageNum());
        model.addAttribute("pageSize_item", list.getPageSize());
        model.addAttribute("pages_item", list.getPages());
        model.addAttribute("total_item",list.getTotal());
        return list;
    }

//    @GetMapping("approvalModify")
//    public void modify(String orderCode, Model model) {
//        OrderDto orderDto = approvalService.getOrderInfo(orderCode);
//        model.addAttribute("order", orderDto);
//
//    }

    @PostMapping("approvalModify")
    public String approval(OrderDto orderDto, RedirectAttributes rttr, Principal principal) {
        String upduser = principal.getName();
        orderDto.setUpduser(upduser);

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
    public String returnModify(OrderDto orderDto, RedirectAttributes rttr, Principal principal) {
        String upduser = principal.getName();
        orderDto.setUpduser(upduser);

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
