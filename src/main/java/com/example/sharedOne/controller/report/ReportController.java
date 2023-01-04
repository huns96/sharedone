package com.example.sharedOne.controller.report;

import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping ("main")
    public void reportMain(Model model, @RequestParam(required = false) String order_code,
                                        @RequestParam(required = false) String type ){

        List<OrderDto> orders = reportService.getOrders(order_code,type);

        System.out.println("리포트메인");
        model.addAttribute("orders",orders );
    }

    @ResponseBody
    @PostMapping("search/order_code")
    public Map<String,Object> searchOrderCode(@RequestBody String order_code_part){
        System.out.println("서치오더코드");
        //RequestBody로 값 받아옴 근데 왜 1이 아니라 "1" ?
        //임시방편으로 서브스트링메서드로 양 옆 쌍따옴표 떼어냄..

        String orderCodePart = order_code_part.substring(1,order_code_part.length()-1);
        System.out.println(reportService.searchOrderCode(orderCodePart)+"오더코드검색결과");
      //-----------------------------오더코드 검색 완료--------------------------------------


        Map<String,Object> map= new HashMap<>();
        map.put("1",order_code_part);
        System.out.println(map+"map");
        return  map;
        }
        // 왜 메인으로 넘어가는거?
        // 리퀘스트바디로 잘 받고 리스폰스바디로 잘 보냈는데 메인으로 넘어가서.. 문제인건가?
        //  컨트롤러에서 뷰로 넘긴 map을 보려고 하는데 아래 문법이 틀림?
        //    .then(function(변수2){document.querySelector('#orderCodes')
        //                    .innerHTML=변수2; })


//    @ResponseBody
//    @PostMapping("search/order_code")
//    public Map<String, Object> searchOrderCode(@RequestBody String order_code_part){
//        System.out.println("서치/오더코드");
//        Map<String,Object> map= new HashMap<>();
//        String orderCodes = reportService.searchOrderCode(order_code_part);
//        System.out.println("121"+orderCodes);
//        map.put("orderCode",orderCodes );
//        System.out.println("1211"+map);
//        return map;
//    }



}
