package com.sharedOne.controller;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.domain.PriceDto;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.service.PriceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import java.util.List;

@Controller
@RequestMapping("price")
public class PriceController {

    @Autowired(required=false)
    private PriceService priceService;

    @PostMapping("modify")
    public String updatePrice(
            @Validated PriceDto priceDto,
            BindingResult bindingResult,
            RedirectAttributes rttr) {

        int num = priceDto.getNum();
        System.out.print("num:::::::"+num);
        int checkPrice = priceService.dateCheck(priceDto);
        System.out.print(checkPrice);

        if (checkPrice > 0) {
            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
            System.out.print("등록 실패");

            return "redirect:/price/priceList";
        }
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
            BindingResult bindingResult,
            RedirectAttributes rttr
    ){

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
        priceService.remove(priceDto,removePrices);


        return "redirect:/price/priceList";
    }



    @PutMapping("priceList")
    public String modify(PriceDto price, RedirectAttributes rttr){
        int checkPrice = priceService.dateCheck(price);
        System.out.print(checkPrice);

        if (checkPrice > 0) {
            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
            System.out.print("수정 실패");

            return "redirect:/price/priceList";
        }
        int check = priceService.modify(price);
        if (check ==1) {
            rttr.addFlashAttribute("message", "수정완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "수정실패하였습니다.");
        }


        return "redirect:/price/priceList";
    }

    @PostMapping("priceList")
    public String register(PriceDto price, RedirectAttributes rttr){

        int checkPrice = priceService.dateCheck(price);
        System.out.print(checkPrice);

        if (checkPrice > 0) {
            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
            System.out.print("등록 실패");

            return "redirect:/price/priceList";
        }
        int check = priceService.register(price);
        if (check ==1) {
            rttr.addFlashAttribute("message", "등록완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "등록실패하였습니다.");
        }


        return "redirect:/price/priceList";
    }

    @GetMapping("priceList")
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

        List<BuyerDto> buyerList = priceService.searchBuyer(type, keyword);

        List<BuyerDto> buyerCodeSearchList = priceService.codeSearchBuyer(keyword);
        List<BuyerDto> buyerNameSearchList = priceService.nameSearchBuyer(keyword);
        System.out.println("buyerCodeSearchList"+buyerCodeSearchList);
        System.out.println("buyerNameSearchList"+buyerNameSearchList);

        model.addAttribute("buyers", buyerList);
        model.addAttribute("buyerCodeSearch", buyerCodeSearchList);
        model.addAttribute("buyerNameSearch", buyerNameSearchList);

        List<ProductDto> productList = priceService.searchProduct(type, keyword);

        List<ProductDto> productCodeSearchList = priceService.codeSearchProduct(keyword);
        List<ProductDto> productNameSearchList = priceService.nameSearchProduct(keyword);

        System.out.println("productCodeSearchList"+buyerCodeSearchList);
        System.out.println("productNameSearchList"+buyerNameSearchList);

        System.out.print(productCodeSearchList);
        System.out.print(productNameSearchList);
        model.addAttribute("productCodeSearch", productCodeSearchList);
        model.addAttribute("productNameSearch", productNameSearchList);

        model.addAttribute("products", productList);

        model.addAttribute("priceList", list);

        System.out.println("keyword::::::::"+keyword);

        System.out.print(list);
        return list;
    }

    @GetMapping("buyer")
    public void buyerList(@RequestParam(name="t", defaultValue = "all") String type,
                     @RequestParam(name="q", defaultValue = "") String keyword,
                     Model model) {



        List<BuyerDto> buyerList = priceService.searchBuyer(type, keyword);

        model.addAttribute("buyers", buyerList);

    }

    @GetMapping("product")
    public void productList(@RequestParam(name="t", defaultValue = "all") String type,
                     @RequestParam(name="q", defaultValue = "") String keyword,
                     Model model) {



        List<ProductDto> productList = priceService.searchProduct(type, keyword);

        model.addAttribute("products", productList);

    }

    // =========================================== test view


    @GetMapping("register")
    public void registerTest(){

    }


    @PostMapping("register")
    public String registerTest(PriceDto price, RedirectAttributes rttr){

        int checkPrice = priceService.dateCheck(price);
        System.out.print(checkPrice);

        if (checkPrice > 0) {
            rttr.addFlashAttribute("message", "기간이 중복되었습니다.");
            System.out.print("등록 실패");

            return "redirect:/price/register";
        }
        int check = priceService.register(price);
        if (check ==1) {
            rttr.addFlashAttribute("message", "등록완료하였습니다.");
        } else {
            rttr.addFlashAttribute("message", "등록실패하였습니다.");
        }


        return "redirect:/price/priceList";
    }


}


