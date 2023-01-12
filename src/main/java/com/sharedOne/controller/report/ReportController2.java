//package com.example.sharedOne.controller.report;
//
//import com.example.sharedOne.domain.report.OrderDto;
//import com.example.sharedOne.domain.report.OrderItemDto;
//import com.example.sharedOne.service.ReportService;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.Date;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//@Controller
//@RequestMapping("report")
//public class ReportController2 {
//
//    @Autowired
//    private ReportService reportService;
//
//    @GetMapping ("main")
//    public void reportMain(Model model, @RequestParam(required = false) String order_code,
//                                        @RequestParam(required = false) String buyer_code,
//                                        @RequestParam(required = false) String status,
//                                        @RequestParam(required = false) String adduser,
//                                        @RequestParam(required = false) String memo,
//                                        @RequestParam(required = false) Date from_order_date,
//                                         @RequestParam(required = false) Date  to_order_date
//    ){
//        System.out.println("리포트메인"+"order_code:"+order_code);
//
//        List<OrderDto> orders = reportService.getOrders(order_code,buyer_code,status,adduser,
//                                            memo,from_order_date,to_order_date);
//        System.out.println(orders);
//        model.addAttribute("orders",orders );
//    }
//
//    @ResponseBody
//    @PostMapping("search/order_code")
//    public List<String> searchOrderCode(@RequestBody String partOfOrderCode){
//        System.out.println("서치오더코드");
//        System.out.println(partOfOrderCode);
//        //RequestBody로 값 받아옴 근데 왜 1이 아니라 "1" ?
//        //임시방편으로 서브스트링메서드로 양 옆 쌍따옴표 떼어냄..
//        //그리고 json 리퀘스트바디로 받을 때 맵이나 객체여야한다고 했나? 지금 String 으로 받아짐.
//        //  또 리스폰스바디로 보낼때도 리스트형식도 되는데?
//        String orderCodePart = partOfOrderCode.substring(1,partOfOrderCode.length()-1);
//        List<String> orderCodes= reportService.searchOrderCode(orderCodePart);
//        System.out.println(orderCodes+"오더코드검색결과");
//
//      //-----------------------------오더코드 검색 완료(배열로 받아옴)------------------------------------
//
//        Map<String,Object> map= new HashMap<>();
//        map.put("1",partOfOrderCode);
//        System.out.println(map+"map");
//        return  orderCodes;
//        }
//        // 왜 메인으로 넘어가는거?
//        // 리퀘스트바디로 잘 받고 리스폰스바디로 잘 보냈는데 메인으로 넘어가서.. 문제인건가?
//        //  컨트롤러에서 뷰로 넘긴 map을 보려고 하는데 아래 문법이 틀림?
//        //    .then(function(변수2){document.querySelector('#orderCodes')
//        //                    .innerHTML=변수2; })
//
//
////    @ResponseBody
////    @PostMapping("search/order_code")
////    public Map<String, Object> searchOrderCode(@RequestBody String order_code_part){
////        System.out.println("서치/오더코드");
////        Map<String,Object> map= new HashMap<>();
////        String orderCodes = reportService.searchOrderCode(order_code_part);
////        System.out.println("121"+orderCodes);
////        map.put("orderCode",orderCodes );
////        System.out.println("1211"+map);
////        return map;
////    }
//
//
//    @GetMapping("order-itme")
//    public   List<OrderItemDto> getOrderItemByOrderCode(@RequestParam String product_code){
//        System.out.println("오더_아이템 반환");
//           List<OrderItemDto> orderItemDtos = reportService.getOrderItems(product_code);
//
//           return orderItemDtos;
//    }
//
//}
