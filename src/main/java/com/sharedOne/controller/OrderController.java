package com.sharedOne.controller;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.service.OrderService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("order")
@Slf4j
public class OrderController {

    @Autowired
    private OrderService orderService;

    /* 주문 관리 (메인)
    * - 주문 리스트 조회
    * */
    @GetMapping("orderManagement")
    public void management(Model model) {
        List<OrderDto> list = orderService.getOrderList();
        model.addAttribute("orderList", list);
        log.info("orderList ========> {}", list);
    }

    /* 주문 등록 - 팝업 */
    @GetMapping("orderRegister")
    public void register(Model model) {

    }

    @PostMapping("register")
    @ResponseBody
    public String register(OrderDto orderDto, RedirectAttributes rttr) {
        //log.info("register orderDto ==========> {}", orderDto);
        return orderService.registerOrder(orderDto);
    }

    @PostMapping("registerItem")
    @ResponseBody
    public void register(@RequestParam(value="items") String[] addItems, @RequestParam String orderCode, RedirectAttributes rttr) {
        int cnt = orderService.registerOrderItem(addItems, orderCode);
        if (cnt==1) {
            rttr.addFlashAttribute("message", orderCode + " 주문이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", orderCode + " 주문이 등록되지 않았습니다.");
        }
    }


    /* 주문 상품 리스트 조회 */
    @RequestMapping("itemList")
    @ResponseBody
    public List<OrderItemDto> itemList(@RequestParam String orderCode) {
        List<OrderItemDto> itemList = orderService.getItemList(orderCode);
        log.info("itemList ========> {}", itemList);
        return itemList;
    }

}
