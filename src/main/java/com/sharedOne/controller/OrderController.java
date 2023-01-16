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

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("order")
@Slf4j
public class OrderController {

    @Autowired
    private OrderService orderService;

    /* 주문 관리 (메인) - 주문 리스트 조회 */
    @GetMapping("orderManagement")
    public void management(@RequestParam(required = false) String orderCode,
                           @RequestParam(required = false) String buyerCode,
                           @RequestParam(required = false) String status,
                           @RequestParam(required = false) String adduser,
                           @RequestParam(required = false) String upduser,
                           Model model) {
        //log.info("param ========> {} / {} / {}", orderCode, buyerCode, status);
        List<OrderDto> list = orderService.getOrderList(orderCode, buyerCode, status, adduser, upduser);
        model.addAttribute("orderList", list);
    }

    /* 주문 등록 - 팝업 */
    @GetMapping("orderRegister")
    public void register(Model model) {

    }

    /* 주문 등록 */
    @PostMapping("register")
    @ResponseBody
    public String register(OrderDto orderDto, RedirectAttributes rttr) {
        return orderService.registerOrder(orderDto);
    }

    /* 주문 상품 등록 */
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
        return orderService.getItemList(orderCode);
    }

    /* 주문 정보 조회 - 수정페이지 */
    @GetMapping("orderModify")
    public void modify(String orderCode, Model model) {
        OrderDto orderDto = orderService.getOrderInfo(orderCode);
        List<OrderItemDto> list = orderService.getItemList(orderCode);
        model.addAttribute("order", orderDto);
        model.addAttribute("itemList", list);
    }

    /* 주문 수정  */
    @PostMapping("modify")
    @ResponseBody
    public String modify(OrderDto orderDto, RedirectAttributes rttr) {
        return orderService.modifyOrder(orderDto);
    }

    /* 주문 상품 수정  */
    @PostMapping("modifyItem")
    @ResponseBody
    public void modify(@RequestParam(value="addItems", required = false) String[] addItems,
                       @RequestParam(value="removeItems", required = false) String[] removeItems,
                       @RequestParam(value="modifyItems", required = false) String[] modifyItems,
                       @RequestParam String orderCode, RedirectAttributes rttr) {

//        log.info("orderModify addItems ==========> {}", (Object) addItems);
//        log.info("orderModify removeItems ==========> {}", (Object) removeItems);
//        log.info("orderModify modifyItems ==========> {}", (Object) modifyItems);

        if (addItems != null) {
            orderService.registerOrderItem(addItems, orderCode);
        }
        if (modifyItems != null) {
            orderService.modifyOrderItem(modifyItems, orderCode);
        }
        if (removeItems != null) {
            orderService.removeOrderItem(removeItems, orderCode);
        }

//        if (cnt==1) {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 수정되었습니다.");
//        } else {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 수정되지 않았습니다.");
//        }
    }

    /* 주문 상태 변경 */
    @PostMapping("changeStatus")
    @ResponseBody
    public void changeStatus(@RequestParam String orderCode, @RequestParam String status, RedirectAttributes rttr) {
        orderService.changeStatus(orderCode, status);
//        int cnt = orderService.changeStatus(orderCode, status);
//        if (cnt==1) {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 등록되었습니다.");
//        } else {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 등록되지 않았습니다.");
//        }

    }

    /* 주문 삭제 - 승인요청 전 최초 등록일 경우 */
    @PostMapping("remove")
    @ResponseBody
    public void remove(@RequestParam String orderCode, RedirectAttributes rttr) {
        orderService.removeOrder(orderCode);
//        if (cnt==1) {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 삭제되었습니다.");
//        } else {
//            rttr.addFlashAttribute("message", orderCode + " 주문이 삭제되지 않았습니다.");
//        }

    }
}
