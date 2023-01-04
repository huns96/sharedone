package com.example.sharedOne.service;

import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.mapper.report.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {
    @Autowired
    private ReportMapper reportMapper;


    public List<OrderDto> getOrders(String order_code, String type) {
//        if (order_code.equals(null))
        return reportMapper.selectOrders(order_code,type);
    }

    public  List<String> searchOrderCode(String order_code_part){
        System.out.println(order_code_part+"서비스오더코드파트");

        String orderCodePart = "%"+order_code_part+"%";
        System.out.println(orderCodePart+"1231");

        System.out.println(reportMapper.searchOrderCode(orderCodePart)+"서치오더코드매퍼결과");
        return  reportMapper.searchOrderCode(orderCodePart);
    }


}
