package com.sharedOne.service;

import com.sharedOne.domain.ProductDto;
import com.sharedOne.domain.report.*;
import com.sharedOne.mapper.report.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;


@Service
public class ReportService {
    @Autowired
    private ReportMapper reportMapper;


    public List<OrderDto> getOrders(String order_code, String buyer_code,
                                    String status, String adduser,
                                    String from_request_date, String to_request_date,
                                    String from_add_date,
                                    String to_add_date, String product_code, PageInfo pageInfo, int page) {
        System.out.println("서비스겟오더스" + order_code);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("order_code", order_code);
        map.put("buyer_code", buyer_code);
        map.put("status", status);
        map.put("adduser", adduser);
        map.put("from_add_date", from_add_date);
        map.put("to_add_date", to_add_date);
//        return reportMapper.selectOrders(map);


        int records = 10;
        int offset = (page - 1) * records;

        int countAll = reportMapper.countAll(order_code, buyer_code, status, from_request_date, to_request_date,
                adduser, from_add_date, to_add_date, product_code, pageInfo);// SELECT Count(*) FROM Board

        System.out.println(countAll + "countAll결과");

        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page - 1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        rightPageNumber = Math.min(rightPageNumber, lastPage);

        // 이전버튼 유무
        boolean hasPrevButton = page > 10;
        // 다음버튼 유무
        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);

        // 이전버튼 눌렀을 때 가는 페이지 번호
        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;

        pageInfo.setHasPrevButton(hasPrevButton);
        pageInfo.setHasNextButton(hasNextButton);
        pageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
        pageInfo.setJumpNextPageNumber(jumpNextPageNumber);
        pageInfo.setCurrentPageNumber(page);
        pageInfo.setLeftPageNumber(leftPageNumber);
        pageInfo.setRightPageNumber(rightPageNumber);
        pageInfo.setLastPageNumber(lastPage);

//        return boardMapper.list(offset, records, type, "%" + keyword + "%");

        return reportMapper.selectOrders(order_code, buyer_code, status, from_request_date, to_request_date,
                adduser, from_add_date, to_add_date, product_code, pageInfo, offset, records);
    }

    public List<String> searchOrderCode(String order_code_part) {
        System.out.println(order_code_part + "서비스오더코드파트");

        String orderCodePart = "%" + order_code_part + "%";
        System.out.println(orderCodePart + "1231");

        System.out.println(reportMapper.searchOrderCode(orderCodePart) + "서치오더코드매퍼결과");
        return reportMapper.searchOrderCode(orderCodePart);
    }


    public List<OrderItemDto> getOrderItems(String product_code) {

        return reportMapper.getOrderItems(product_code);
    }


    public SumDto getSums(String order_code, String buyer_code, String status, String adduser,
                          String from_request_date, String to_request_date,
                          String from_add_date, String to_add_date, String product_code, String sumCondition) {

        return reportMapper.getSums(order_code, buyer_code, status, adduser, from_request_date, to_request_date,
                from_add_date, to_add_date, product_code, sumCondition);
    }

    public List<OrderGroupDto> getOrderGroups(Model model, String order_code, String buyer_code, String status,
                                              String adduser, String from_request_date, String to_request_date,
                                              String from_add_date, String to_add_date,
                                              String product_code, String sumCondition) {
        List<OrderGroupDto> orderGroups = reportMapper.selectOrderGroups(order_code, buyer_code, status, adduser,
                from_request_date, to_request_date,
                from_add_date, to_add_date, product_code, sumCondition);
        if (sumCondition.equals(("year(h.request_date)"))) {
            model.addAttribute("groupName", "년도");
        }
        if (sumCondition.equals(("quarter(h.request_date)"))) {
            model.addAttribute("groupName", "분기");
            for (OrderGroupDto order : orderGroups) {
                order.setGroupName(order.getYear() + "/" + order.getGroupName() + "분기");
            }
        }
        if (sumCondition.equals(("month(h.request_date)"))) {
            model.addAttribute("groupName", "월");
            for (OrderGroupDto order : orderGroups) {
                order.setGroupName(order.getYear() + "/" + order.getGroupName()+"월");
            }
        }
        if (sumCondition.equals(("week(h.request_date)"))) {
            model.addAttribute("groupName", "주차");
            for (OrderGroupDto order : orderGroups) {
                order.setGroupName(order.getYear() + "/" + order.getGroupName() + "주차");
            }
        }
        if (sumCondition.equals("b.name")) {
            model.addAttribute("groupName", "바이어");

        }
        if (sumCondition.equals("addm.name")) {
            model.addAttribute("groupName", "담당자");
        }
        if (sumCondition.equals("h.status")) {
            model.addAttribute("groupName", "주문상태");
        }

        System.out.println("오더그룹스" + orderGroups);
        // 왜 한 그룹으로 나오지..? > 이유는 모르겠지만 자동으로 고쳐짐;
        orderGroups.forEach(orderGroupDto -> System.out.println("찾으려고 적음" + orderGroupDto));

        return orderGroups;
    }

    public List<OrderDto> getOrderCodes() {
        return reportMapper.getOrderCodes();
    }

    public List<ProductDto> getProducts() {
        return reportMapper.getProducts();
    }


//    public List<BoardDto> listBoard(int page, String type, String keyword, PageInfo pageInfo) {
//        int records = 10;
//        int offset = (page - 1) * records;
//
//        int countAll = boardMapper.countAll(type, "%" + keyword + "%"); // SELECT Count(*) FROM Board
//        int lastPage = (countAll - 1) / records + 1;
//
//        int leftPageNumber = (page - 1) / 10 * 10 + 1;
//        int rightPageNumber = leftPageNumber + 9;
//        rightPageNumber = Math.min(rightPageNumber, lastPage);
//
//        // 이전버튼 유무
//        boolean hasPrevButton = page > 10;
//        // 다음버튼 유무
//        boolean hasNextButton = page <= ((lastPage - 1) / 10 * 10);
//
//        // 이전버튼 눌렀을 때 가는 페이지 번호
//        int jumpPrevPageNumber = (page - 1) / 10 * 10 - 9;
//        int jumpNextPageNumber = (page - 1) / 10 * 10 + 11;
//
//        pageInfo.setHasPrevButton(hasPrevButton);
//        pageInfo.setHasNextButton(hasNextButton);
//        pageInfo.setJumpPrevPageNumber(jumpPrevPageNumber);
//        pageInfo.setJumpNextPageNumber(jumpNextPageNumber);
//        pageInfo.setCurrentPageNumber(page);
//        pageInfo.setLeftPageNumber(leftPageNumber);
//        pageInfo.setRightPageNumber(rightPageNumber);
//        pageInfo.setLastPageNumber(lastPage);
//
//        return boardMapper.list(offset, records, type, "%" + keyword + "%");
//    }

}
