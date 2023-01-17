package com.sharedOne.controller;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.OrderItemDto;
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
                             Model model) {
        //log.info("buyer param ========> {} / {}", type, value);
        List<BuyerDto> list = searchService.getBuyerList(type, value);
        model.addAttribute("buyerList", list);
        //log.info("buyerList ========> {}", list);
    }

    /* 상품 검색 */
    @GetMapping("productPopup")
    public void getProductInfo(@RequestParam String buyer_code, Model model) {
        List<OrderItemDto> list = searchService.getItemList(buyer_code);
        model.addAttribute("itemList", list);
        //log.info("itemList ========> {}", list);

    }

    /* 등록자 , 수정자 검색 */
    @GetMapping("memberPopup")
    public void getMemberInfo(@RequestParam(required = false) String type,
                            @RequestParam(required = false) String value,
                            Model model) {
        List<BuyerDto> list = searchService.getMemberList(type, value);
        model.addAttribute("memberList", list);
    }
}