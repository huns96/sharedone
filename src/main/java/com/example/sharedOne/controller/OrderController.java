package com.example.sharedOne.controller;

import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.domain.OrderItemDto;
import com.example.sharedOne.service.OrderService;
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

    /* 주문 관리 화면 */
    @GetMapping("orderManagement")
    public void main(Model model) {
        /* 오더 리스트 조회 */
        List<OrderDto> list = orderService.getOrderList();
        model.addAttribute("orderList", list);
        log.info("orderList ========> {}", list);
    }

    /* 주문 등록 */
    @PostMapping("register")
    @ResponseBody
    public void register(OrderDto orderDto, RedirectAttributes rttr) {
        log.info("register orderDto ==========> {}", orderDto);
        int cnt = orderService.registerOrder(orderDto);
        if (cnt==1) {
            rttr.addFlashAttribute("message", orderDto.getOrder_code() + " 주문이 등록되었습니다.");
        } else {
            rttr.addFlashAttribute("message", orderDto.getOrder_code() + " 주문이 등록되지 않았습니다.");
        }
    }

    /* 주문 상품 리스트 조회 */
    @RequestMapping("itemList")
    @ResponseBody
    public List<OrderItemDto> itemList(@RequestBody String orderCode) {
        List<OrderItemDto> itemList = orderService.getItemList(orderCode);
        log.info("itemList ========> {}", itemList);
        return itemList;
    }

}
