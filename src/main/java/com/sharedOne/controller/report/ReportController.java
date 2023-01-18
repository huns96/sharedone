package com.sharedOne.controller.report;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.domain.report.*;
import com.sharedOne.mapper.report.ReportMapper;
import com.sharedOne.service.ReportService;
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
    @Autowired
    private ReportMapper reportMapper;


    @GetMapping("result")
    public void reportMain(@RequestParam(defaultValue = "1") int page) {

//        return "forward:/report/result";
    }

    @GetMapping("work")
    public String reportMain(Model model, PageInfo pageInfo, OrderDto searchOrders,
                             @RequestParam(name = "page", defaultValue = "1") int page,
                             @RequestParam(name = "records", defaultValue = "10") int records) {
        System.out.println(searchOrders + "searchOrders");

        String order_code = searchOrders.getOrder_code();
        String buyer_code = searchOrders.getBuyer_code();
        String adduser = searchOrders.getAdduser();
        String status = searchOrders.getStatus();
        String from_request_date = searchOrders.getFrom_request_date();
        String to_request_date = searchOrders.getTo_request_date();
        String from_add_date = searchOrders.getFrom_add_date();
        String to_add_date = searchOrders.getTo_add_date();
        String sumCondition = searchOrders.getSumCondition();


        if (from_request_date != null & to_request_date != null &
                from_add_date != null & to_add_date != null) {
            if ((from_request_date.equals("") & !to_request_date.equals("")
                    | (!from_request_date.equals("") & to_request_date.equals("")))
                    |
                    ((from_add_date.equals("") & !to_add_date.equals(""))
                            | (!from_add_date.equals("") & to_add_date.equals("")))) {

                model.addAttribute("message", "날짜 입력이 잘못 되었습니다");
                model.addAttribute("searchOrders", searchOrders);
                return "/report/result";
            }
        }

        if (sumCondition != null)
            if (!sumCondition.equals("")) {
                System.out.println(searchOrders.getComment() + "섬레졀트 작업시작");
                List<OrderGroupDto> orderGroups = reportService.getOrderGroups(model, searchOrders);

                SumDto sums = reportService.getSums(searchOrders);
                int countAll = reportMapper.groupContAll(searchOrders);


                model.addAttribute("orderGroups", orderGroups);
                model.addAttribute("sums", sums);
                model.addAttribute("orderGroupCount", countAll);
                model.addAttribute("from_add_date", from_add_date);
//            if(!from_add_date.equals("")&from_add_date!=null){
                model.addAttribute("to_add_date", to_add_date);
//            }
                model.addAttribute("from_request_date", from_request_date);
                model.addAttribute("to_request_date", to_request_date);
                model.addAttribute("searchOrders", searchOrders);
                return "/report/sumResult";
            }


        //---------------------------------------------------------------------

        System.out.println("레졀트 작업시작");
        if (order_code == null & buyer_code == null & adduser == null & from_add_date == null & to_add_date == null) {
            status = " ";
        }
        List<OrderDto> orders = reportService.getOrders(searchOrders, pageInfo, page, records);

        SumDto sums = reportService.getSums(searchOrders);

//        System.out.println("갯수 : " + orders.size());
        System.out.println(sums + "sums");
        model.addAttribute("orders", orders);
        model.addAttribute("sums", sums);
        model.addAttribute("orderCount", searchOrders.getCountAll());
        model.addAttribute("from_add_date", from_add_date);
        model.addAttribute("to_add_date", to_add_date);
        model.addAttribute("from_request_date", from_request_date);
        model.addAttribute("to_request_date", to_request_date);
        model.addAttribute("searchOrders", searchOrders);
        System.out.println(searchOrders.getBuyer_name()+"fjlee");

        return "/report/result";
    }


    @GetMapping("graph")
    public void apiTest() {
    }

    @GetMapping("mainTest")
    public void mainTest() {
    }

    @GetMapping("orderPopup")
    public void orderPopup() {
    }

    @GetMapping("search/orderCodes")
    public String getOrderCodes(Model model) {
        List<OrderDto> orderCodes = reportService.getOrderCodes();
        model.addAttribute("orderCodes", orderCodes);
        System.out.println(orderCodes);
        return "/report/orderPopup";
    }

//    @GetMapping("productPopup")
//    public void getProductCodes(Model model) {
//        List<ProductDto> products = reportService.getProducts();
//        model.addAttribute("products", products);
//        System.out.println(products);
//    }


    @GetMapping("productPopup")
    public void getBuyerInfo(@RequestParam(required = false) String type,
                             @RequestParam(required = false) String value,
                             @RequestParam(defaultValue = "1")int page,
                             Model model) {
        PageHelper.startPage(page,5);
        Page<ProductDto> list = reportService.getProducts(type, value);

        model.addAttribute("pageNum", list.getPageNum());
        model.addAttribute("pageSize", list.getPageSize());
        model.addAttribute("pages", list.getPages());
        model.addAttribute("total",list.getTotal());
        model.addAttribute("products", list);
    }





    @ResponseBody
    @PostMapping("search/order_code")
    public List<String> searchOrderCode(@RequestBody String partOfOrderCode) {
        System.out.println(partOfOrderCode);
        String orderCodePart = partOfOrderCode.substring(1, partOfOrderCode.length() - 1);
        List<String> orderCodes = reportService.searchOrderCode(orderCodePart);
        System.out.println(orderCodes + "오더코드검색결과");
        //-----------------------------오더코드 검색 완료(배열로 받아옴)------------------------------------
        Map<String, Object> map = new HashMap<>();
        map.put("1", partOfOrderCode);
        System.out.println(map + "map");
        return orderCodes;
    }




    @GetMapping("order-itme")
    public List<OrderItemDto> getOrderItemByOrderCode(@RequestParam String product_code) {
        System.out.println("오더_아이템 반환");
        List<OrderItemDto> orderItemDtos = reportService.getOrderItems(product_code);

        return orderItemDtos;
    }

}
