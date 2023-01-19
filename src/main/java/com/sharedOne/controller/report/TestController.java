package com.sharedOne.controller.report;

import com.sharedOne.domain.report.OrderDto;
import com.sharedOne.domain.report.OrderGroupDto;
import com.sharedOne.domain.report.PageInfo;
import com.sharedOne.domain.report.SumDto;
import com.sharedOne.mapper.report.ReportMapper;
import com.sharedOne.service.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("report")
public class TestController {

    @Autowired
    private ReportService reportService;
    @Autowired
    private ReportMapper reportMapper;

    @PostMapping("work")
    public String reportMain(
            Model model, PageInfo pageInfo, @RequestBody OrderDto searchOrders,
                             @RequestParam(name = "page", defaultValue = "1" , required = false) int page,
                             @RequestParam(name = "records", defaultValue = "10", required = false) int records
                            ) {

        System.out.println("work2호출");
//        String111.forEach((s, o) -> System.out.println(s + " : " + o));
//        return  null;
        Map<String, Object> map = new HashMap<String, Object>();

        map.put("kor", "Korea");
        map.put("us", "United States");

        return null;
    }
//        System.out.println(searchOrders + "searchOrders");
//
//        String order_code = searchOrders.getOrder_code();
//        String buyer_code = searchOrders.getBuyer_code();
//        String adduser = searchOrders.getAdduser();
//        String status = searchOrders.getStatus();
//        String from_request_date = searchOrders.getFrom_request_date();
//        String to_request_date = searchOrders.getTo_request_date();
//        String from_add_date = searchOrders.getFrom_add_date();
//        String to_add_date = searchOrders.getTo_add_date();
//        String sumCondition = searchOrders.getSumCondition();
//
//
//        if (from_request_date != null & to_request_date != null &
//                from_add_date != null & to_add_date != null) {
//            if ((from_request_date.equals("") & !to_request_date.equals("")
//                    | (!from_request_date.equals("") & to_request_date.equals("")))
//                    |
//                    ((from_add_date.equals("") & !to_add_date.equals(""))
//                            | (!from_add_date.equals("") & to_add_date.equals("")))) {
//
//                model.addAttribute("message", "날짜 입력이 잘못 되었습니다");
//                model.addAttribute("searchOrders", searchOrders);
//                return "/report/result";
//            }
//        }
//
//        if (sumCondition != null)
//            if (!sumCondition.equals("")) {
//                System.out.println(searchOrders.getComment() + "섬레졀트 작업시작");
//                List<OrderGroupDto> orderGroups = reportService.getOrderGroups(model, searchOrders);
//
//                SumDto sums = reportService.getSums(searchOrders);
//                int countAll = reportMapper.groupContAll(searchOrders);
//
//
//                model.addAttribute("orderGroups", orderGroups);
//                model.addAttribute("sums", sums);
//                model.addAttribute("orderGroupCount", countAll);
//                model.addAttribute("from_add_date", from_add_date);
////            if(!from_add_date.equals("")&from_add_date!=null){
//                model.addAttribute("to_add_date", to_add_date);
////            }
//                model.addAttribute("from_request_date", from_request_date);
//                model.addAttribute("to_request_date", to_request_date);
//                model.addAttribute("searchOrders", searchOrders);
//                return "/report/sumResult";
//            }
//
//
//        //---------------------------------------------------------------------
//
//        System.out.println("레졀트 작업시작");
//        if (order_code == null & buyer_code == null & adduser == null & from_add_date == null & to_add_date == null) {
//            status = " ";
//        }
//        List<OrderDto> orders = reportService.getOrders(searchOrders, pageInfo, page, records);
//
//        SumDto sums = reportService.getSums(searchOrders);
//
////        System.out.println("갯수 : " + orders.size());
//        System.out.println(sums + "sums");
//        model.addAttribute("orders", orders);
//        model.addAttribute("sums", sums);
//        model.addAttribute("orderCount", searchOrders.getCountAll());
//        model.addAttribute("from_add_date", from_add_date);
//        model.addAttribute("to_add_date", to_add_date);
//        model.addAttribute("from_request_date", from_request_date);
//        model.addAttribute("to_request_date", to_request_date);
//        model.addAttribute("searchOrders", searchOrders);
//        System.out.println(searchOrders.getBuyer_name()+"fjlee");
//
//        return "/report/result";
//    }
}
