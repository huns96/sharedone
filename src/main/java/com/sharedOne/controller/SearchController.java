package com.sharedOne.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.member.MemberDto;
import com.sharedOne.service.SearchService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("search")
@Slf4j
public class SearchController {

    @Autowired
    private SearchService searchService;

    /* 바이어 검색 */
    @GetMapping("buyerPopup")
    public void getBuyerInfo(@RequestParam(required = false) String type,
                             @RequestParam(required = false) String value,
                             @RequestParam(defaultValue = "1")int page,
                             Model model) {
        //log.info("buyer param ========> {} / {}", type, value);
        PageHelper.startPage(page,5);
        Page<BuyerDto> list = searchService.getBuyerList(type, value);

        model.addAttribute("pageNum", list.getPageNum());
        model.addAttribute("pageSize", list.getPageSize());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("total",list.getTotal());
        model.addAttribute("buyerList", list);
        //log.info("buyerList ========> {}", list);
    }

    /* 상품 검색 */
    @GetMapping("productPopup")
    public void getProductInfo(@RequestParam String buyer_code,
                               @RequestParam String request_date,
                               @RequestParam(required = false) String type,
                               @RequestParam(required = false) String value,
                               @RequestParam(defaultValue = "1")int page,
                               Model model) {
        PageHelper.startPage(page,5);
        Page<OrderItemDto> list = searchService.getItemList(buyer_code, request_date, type, value);

        model.addAttribute("pageNum", list.getPageNum());
        model.addAttribute("pageSize", list.getPageSize());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("total",list.getTotal());
        model.addAttribute("itemList", list);
        log.info("itemList ========> {}", list);
    }

    /* 등록자 , 수정자 검색 */
    @GetMapping("memberPopup")
    public void getMemberInfo(@RequestParam(required = false) String type,
                              @RequestParam(required = false) String value,
                              @RequestParam(defaultValue = "1")int page,
                              Model model) {
        PageHelper.startPage(page,5);
        Page<MemberDto> list = searchService.getMemberList(type, value);

        model.addAttribute("pageNum", list.getPageNum());
        model.addAttribute("pageSize", list.getPageSize());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("total",list.getTotal());
        model.addAttribute("memberList", list);
        //log.info("memberList ========> {}", list);
    }
}