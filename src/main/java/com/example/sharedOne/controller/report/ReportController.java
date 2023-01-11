package com.example.sharedOne.controller.report;

import com.example.sharedOne.domain.report.OrderDto;
import com.example.sharedOne.domain.report.OrderGroupDto;
import com.example.sharedOne.domain.report.OrderItemDto;
import com.example.sharedOne.domain.report.SumDto;
import com.example.sharedOne.service.ReportService;
import jdk.jfr.Frequency;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

@Controller
@RequestMapping("report")
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping("result")
    public  void reportMain(){

//        return "forward:/report/result";
    }

    @GetMapping ("work")
    public String reportMain(Model model,
                           @RequestParam(required = false) String order_code,
                           @RequestParam(required = false) String buyer_code,
                           @RequestParam(required = false) String status,
                           @RequestParam(required = false) String adduser,
                           @RequestParam(required = false) String from_add_date,
                           @RequestParam(required = false) String  to_add_date,
                           @RequestParam(required= false) String product_code,
                           @RequestParam(required= false, defaultValue = "i.num") String sumCondition
    ){
        if (!sumCondition.equals("i.num") & (sumCondition!=null) & !sumCondition.equals("")){
//        if (!sumCondition.equals("i.num") ){
            System.out.println(sumCondition+"섬레졀트 작업시작");
            if(sumCondition.equals("h.buyer_code")){
                model.addAttribute("groupName","바이어코드");
            }
            if(sumCondition.equals("h.adduser")){
                model.addAttribute("groupName","유저명");
            }
            if(sumCondition.equals("h.status")){
                model.addAttribute("groupName","승인여부");
            }


            List<OrderGroupDto> orderGroups = reportService.getOrderGroups(order_code,buyer_code,status,adduser,
                    from_add_date,to_add_date, product_code,sumCondition);
            System.out.println("오더그룹스"+orderGroups);
            // 왜 한 그룹으로 나오지..? > 이유는 모르겠지만 자동으로 고쳐짐;
            orderGroups.forEach(orderGroupDto -> System.out.println("찾으려고 적음"+orderGroupDto));
            model.addAttribute("orderGroups",orderGroups);
            return "/report/sumResult";
        }



        //---------------------------------------------------------------------

        System.out.println("레졀트 작업시작"+"order_code:"+sumCondition);
        if(order_code==null&buyer_code==null&adduser==null&from_add_date==null&to_add_date==null){
            status=" ";
        }

        List<OrderDto> orders = reportService.getOrders(order_code,buyer_code,status,adduser,
                from_add_date,to_add_date, product_code);

        SumDto sums=reportService.getSums(order_code,buyer_code,status,adduser,
                from_add_date,to_add_date, product_code,sumCondition);

        System.out.println("갯수 : "+orders.size());
        System.out.println(sums+"sums");
        System.out.println(orders);
        model.addAttribute("orders",orders );
        model.addAttribute("sums",sums);

        return "/report/result";
    }





//    @GetMapping ("sumResult")
//    public String sumResult(Model model,
//                             @RequestParam(required = false) String order_code,
//                             @RequestParam(required = false) String buyer_code,
//                             @RequestParam(required = false) String status,
//                             @RequestParam(required = false) String adduser,
//                             @RequestParam(required = false) String from_add_date,
//                             @RequestParam(required = false) String  to_add_date,
//                             @RequestParam(required= false) String product_code,
//                             @RequestParam(required= false) String sumCondition
//    ){
//        System.out.println("섬레졀트");
////        if (!(!sumCondition.equals("i.num") & (sumCondition!=null) & !sumCondition.equals(""))){
//        if (sumCondition.equals("i.num") ){
//
//            System.out.println(sumCondition+"섬레졀트");
//            return "/report/result";
//        }
//
//        System.out.println("리포트메인"+"order_code:"+sumCondition);
//        if(order_code==null&buyer_code==null&adduser==null&from_add_date==null&to_add_date==null){
//            status=" ";
//        }
//
//        List<OrderDto> orders = reportService.getOrders(order_code,buyer_code,status,adduser,
//                from_add_date,to_add_date, product_code);
//
//        SumDto sums=reportService.getSums(order_code,buyer_code,status,adduser,
//                from_add_date,to_add_date, product_code,sumCondition);
////         int sumOfQuantity=;
////         int sumPrice=;
//        System.out.println("갯수 : "+orders.size());
//        System.out.println(sums+"토탈");
//        model.addAttribute("orders",orders );
//        model.addAttribute("sums",sums);
//
//        return null;
//    }





    @GetMapping("graph")
    public void apiTest(){
    }
    @GetMapping("mainTest")
    public void mainTest(){
    }


//    @GetMapping("result")
//    public  String reportMainPost(Model model, String order_code, String buyer_code,
//                                String status, String adduser,
//                                String from_add_date, String to_add_date
//    ){
//        System.out.println("리포트메인"+"order_code:"+order_code);
//
//        List<OrderDto> orders = reportService.getOrders(order_code,buyer_code,status,adduser,
//                from_add_date,to_add_date);
//        System.out.println(orders);
//        model.addAttribute("orders",orders );
//        return "redirect:/report/main";
//    }







//    @PostMapping("main")
//    public  void reportMainPost(Model model, String order_code, String buyer_code,
//                String status, String adduser,
//                                String from_add_date, String to_add_date
//                ){
//            System.out.println("리포트메인"+"order_code:"+order_code);
//
//            List<OrderDto> orders = reportService.getOrders(order_code,buyer_code,status,adduser,
//                    from_add_date,to_add_date);
//            System.out.println(orders);
//            model.addAttribute("orders",orders );
//        }

    @ResponseBody
    @PostMapping("search/order_code")
    public List<String> searchOrderCode(@RequestBody String partOfOrderCode){
        System.out.println("서치오더코드");
        System.out.println(partOfOrderCode);
        //RequestBody로 값 받아옴 근데 왜 1이 아니라 "1" ?
        //임시방편으로 서브스트링메서드로 양 옆 쌍따옴표 떼어냄..
        //그리고 json 리퀘스트바디로 받을 때 맵이나 객체여야한다고 했나? 지금 String 으로 받아짐.
        //  또 리스폰스바디로 보낼때도 리스트형식도 되는데?
        String orderCodePart = partOfOrderCode.substring(1,partOfOrderCode.length()-1);
        List<String> orderCodes= reportService.searchOrderCode(orderCodePart);
        System.out.println(orderCodes+"오더코드검색결과");

      //-----------------------------오더코드 검색 완료(배열로 받아옴)------------------------------------

        Map<String,Object> map= new HashMap<>();
        map.put("1",partOfOrderCode);
        System.out.println(map+"map");
        return  orderCodes;
        }



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


    @GetMapping("order-itme")
    public   List<OrderItemDto> getOrderItemByOrderCode(@RequestParam String product_code){
        System.out.println("오더_아이템 반환");
           List<OrderItemDto> orderItemDtos = reportService.getOrderItems(product_code);

           return orderItemDtos;
    }

}



//월별