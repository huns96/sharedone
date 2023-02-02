package com.sharedOne.controller.price;

import com.sharedOne.domain.*;
import com.sharedOne.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("price")
public class PriceController {

    @Autowired(required=false)
    private PriceService priceService;

    @GetMapping("modifyPopup")
    public void modify(String num, Model model) {
        PriceDto priceDto = priceService.getPriceInfo(num);
        List<PriceDto> list = priceService.getItemList(priceDto);
        model.addAttribute("price", priceDto);
        model.addAttribute("itemList", list);
    }

    @ResponseBody
    @PostMapping("modify")
    public String updatePrice(
            @Validated @RequestBody PriceDto priceDto,
            BindingResult bindingResult,
            RedirectAttributes rttr,
            Principal principal) {

        String upduser = principal.getName();
        priceDto.setUpduser(upduser);

        int num = priceDto.getNum();
        System.out.print("num:::::::"+num);
//        int checkPrice = priceService.dateCheck(priceDto);
//        System.out.print(checkPrice);
//
//        if (checkPrice > 0) {
//            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
//            System.out.print("등록 실패");
//
//            return "redirect:/price/priceList";
//        }
        int check = priceService.modify(priceDto);
        if (check ==1) {
            rttr.addFlashAttribute("message", "수정완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "수정실패하였습니다.");
        }


        return "redirect:/price/priceList";


    }

    @PostMapping("remove")
    public String deletePrice(
            @Validated PriceDto priceDto,
            @RequestParam(name = "removePrices", required = false) List<Integer> removePrices,
            Principal principal,
            RedirectAttributes rttr
    ){

        String upduser = principal.getName();
        priceDto.setUpduser(upduser);

        if (removePrices != null){
            System.out.println("deletePricesNum : exist" );
            System.out.println("deletePricesNum : exist" + removePrices );
            for (int num : removePrices) {
                System.out.println("deletePricesNum :" +num);
            }
        }

        if (removePrices == null){
            System.out.println("deletePricesNum : no" );
        }

        System.out.print("remove:::"+priceDto);
        priceService.remove(priceDto,removePrices);


        return "redirect:/price/priceList";
    }

    @ResponseBody
    @PostMapping("delete")
    public void delete(
            @RequestParam(name = "removePrices", required = false) List<Integer> removePrices,
            PriceDto priceDto,
            Principal principal,
            RedirectAttributes rttr
    ){

        System.out.print(removePrices);
        String upduser = principal.getName();
        priceDto.setUpduser(upduser);

        if (removePrices != null){
            System.out.println("deletePricesNum : exist" );
            System.out.println("deletePricesNum : exist" + removePrices );
            for (int num : removePrices) {
                System.out.println("deletePricesNum :" +num);
            }
        }

        if (removePrices == null){
            System.out.println("deletePricesNum : no" );
        }

        System.out.print("remove:::"+priceDto);

        priceService.remove(priceDto,removePrices);

    }


//
//    @PutMapping("priceList")
//    public String modify(PriceDto price, RedirectAttributes rttr, Principal principal){
//        int checkPrice = priceService.dateCheck(price);
//        System.out.print(checkPrice);
//
//        if (checkPrice > 0) {
//            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
//            System.out.print("수정 실패");
//
//            return "redirect:/price/priceList";
//        }
//        int check = priceService.modify(price);
//        if (check ==1) {
//            rttr.addFlashAttribute("message", "수정완료하였습니다.");
//        } else {
//            rttr.addFlashAttribute("message", "수정실패하였습니다.");
//        }
//
//
//        return "redirect:/price/priceList";
//    }
//
//    @PostMapping("priceList")
//    public String registerT(PriceDto price, RedirectAttributes rttr){
//
//        int checkPrice = priceService.dateCheck(price);
//        System.out.print(checkPrice);
//
//        if (checkPrice > 0) {
//            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
//            System.out.print("등록 실패");
//
//            return "redirect:/price/priceList";
//        }
//        int check = priceService.register(price);
//        if (check ==1) {
//            rttr.addFlashAttribute("message", "등록완료하였습니다.");
//        } else {
//            rttr.addFlashAttribute("message", "등록실패하였습니다.");
//        }
//
//
//        return "redirect:/price/priceList";
//    }

    @GetMapping("priceList")
    @PreAuthorize("hasAnyAuthority('관리자', '팀장', '팀원')")
//    @RequestMapping(value = "list", produces="application/json;charset=utf-8")
    public List<PriceDto> list(@RequestParam(name = "page", defaultValue = "1") int page,
                               PageInfo pageInfo,
                               @RequestParam(name="t", defaultValue = "all") String type,
                               @RequestParam(name="q", defaultValue = "") String keyword,
                               @RequestParam(name="bt", defaultValue = "all") String buyerType,
                               @RequestParam(name="bq", defaultValue = "") String buyerKeyword,
                               @RequestParam(name="pt", defaultValue = "all") String productType,
                               @RequestParam(name="pq", defaultValue = "") String productKeyword,
                               Model model) {

        System.out.print(page);
        System.out.print(pageInfo);

        List<PriceDto> list = priceService.listPrice(page, pageInfo, buyerType, buyerKeyword, productType, productKeyword);

        List<BuyerDto> buyerList = priceService.searchBuyer(type, keyword, page, pageInfo);

        model.addAttribute("buyers", buyerList);


        List<ProductDto> productList = priceService.searchProduct(type, keyword, page, pageInfo);

        model.addAttribute("products", productList);

        model.addAttribute("priceList", list);

        System.out.println("keyword::::::::"+keyword);

        System.out.print(list);
        return list;
    }

    @GetMapping("buyer")
    public void buyerList(
            @RequestParam(name = "page", defaultValue = "1") int page,
            PageInfo pageInfo,
            @RequestParam(name="t", defaultValue = "all") String type,
            @RequestParam(name="q", defaultValue = "") String keyword,
            Model model) {



        List<BuyerDto> buyerList = priceService.searchBuyer(type, keyword, page, pageInfo);

        model.addAttribute("buyers", buyerList);

    }

    @GetMapping("product")
    public void productList(
            @RequestParam(name = "page", defaultValue = "1") int page,
            PageInfo pageInfo,
            @RequestParam(name="t", defaultValue = "all") String type,
            @RequestParam(name="q", defaultValue = "") String keyword,
            Model model) {



        List<ProductDto> productList = priceService.searchProduct(type, keyword, page, pageInfo);

        model.addAttribute("products", productList);

    }

    // =========================================== test view


    @GetMapping("registerPopup")
    public void register(){

    }


    @ResponseBody
    @PostMapping("register")
    public Map<String, Object> register(@RequestBody PriceDto price, RedirectAttributes rttr, Principal principal){
        String adduser = principal.getName();
        price.setAdduser(adduser);


//        int checkPrice = priceService.dateCheck(price);
//        System.out.print(checkPrice);
//
//        if (checkPrice > 0) {
//            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
//            System.out.print("등록 실패");
//
//            return "redirect:/price/register";
//        }
//        int check = priceService.register(price);
//        if (check ==1) {
//            rttr.addFlashAttribute("message", "등록완료하였습니다.");
//        } else {
//            rttr.addFlashAttribute("message", "등록실패하였습니다.");
//        }
//
//
//        return "redirect:/price/priceList";
        Map<String,Object> map = new HashMap<>();
        int check = priceService.register(price);
        if (check ==1) {
//            rttr.addFlashAttribute("message", "등록완료하였습니다.");
            map.put("message", "등록완료하였습니다.");
        } else {
//            rttr.addFlashAttribute("message", "등록실패하였습니다.");
            map.put("message", "등록완료하였습니다.");
        }


        return map;

    }

    @ResponseBody
    @PostMapping("add")
    public Map<String, Object> add(@RequestBody PriceDto price, RedirectAttributes rttr, Principal principal){
        String adduser = principal.getName();
        price.setAdduser(adduser);
        String upduser = principal.getName();
        price.setUpduser(upduser);

        System.out.println("price:::::::::"+price);

        Map<String,Object> map = new HashMap<>();
        priceService.register(price);



        return map;

    }

    //        int check = priceService.register(price);
//        if (check ==1) {
////            rttr.addFlashAttribute("message", "등록완료하였습니다.");
//            map.put("message", "등록완료하였습니다.");
//        } else {
////            rttr.addFlashAttribute("message", "등록실패하였습니다.");
//            map.put("message", "등록완료하였습니다.");
//        }
//
//
//        return map;


    @ResponseBody
    @PostMapping(value="dateCheck", produces = "application/json")
    public Map<String, Object> dateCheck(@RequestBody PriceDto price) {


        System.out.print(price+":::::::::checkPrice");
        System.out.print(price.getStart_date()+":::::::::checkPrice");

        Map<String,Object> map = new HashMap<>();

        int checkPrice = priceService.dateCheck(price);
        System.out.print(checkPrice+":::::::::checkPrice");

        if (checkPrice > 0) {
            map.put("check", "fail");
            map.put("message", "기간이 중복되었습니다.");
            System.out.print("등록 실패");
        }else {
            map.put("check", "success");
            map.put("message", "기간체크성공");
        }
        return map;

    }



}

