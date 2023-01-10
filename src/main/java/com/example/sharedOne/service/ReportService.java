package com.example.sharedOne.service;

import com.example.sharedOne.domain.report.OrderDto;
import com.example.sharedOne.domain.report.OrderItemDto;
import com.example.sharedOne.domain.report.SumDto;
import com.example.sharedOne.mapper.report.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class ReportService {
    @Autowired
    private ReportMapper reportMapper;


//    public List<OrderDto> getOrders(String order_code, String type) {
////        if (order_code.equals(null))
//        return reportMapper.selectOrders(order_code,type);
//    }
    public List<OrderDto> getOrders(String order_code, String buyer_code,
                                    String status, String adduser, String from_add_date,
                                    String to_add_date, String product_code) {
        System.out.println("서비스겟오더스"+order_code);
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("order_code",order_code);
        map.put("buyer_code",buyer_code);
        map.put("status",status);
        map.put("adduser",adduser);
        map.put("from_add_date",from_add_date);
        map.put("to_add_date",to_add_date);
//        return reportMapper.selectOrders(map);

        return reportMapper.selectOrders(order_code,buyer_code,status,
                adduser,from_add_date,to_add_date,product_code);
    }

    public  List<String> searchOrderCode(String order_code_part){
        System.out.println(order_code_part+"서비스오더코드파트");

        String orderCodePart = "%"+order_code_part+"%";
        System.out.println(orderCodePart+"1231");

        System.out.println(reportMapper.searchOrderCode(orderCodePart)+"서치오더코드매퍼결과");
        return  reportMapper.searchOrderCode(orderCodePart);
    }


    public List<OrderItemDto> getOrderItems(String product_code) {
        return reportMapper.getOrderItems(product_code);
    }


    public SumDto getSums(String order_code, String buyer_code, String status, String adduser,
                                String from_add_date, String to_add_date, String product_code, String sumCondition) {
        return reportMapper.getSums(order_code,buyer_code,status,adduser,
                from_add_date,to_add_date, product_code,sumCondition);
    }
}
