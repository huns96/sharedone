package com.example.sharedOne.controller.Kyj;

import com.example.sharedOne.domain.ProductDto;
import com.example.sharedOne.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @GetMapping ("list")
    public void list(){
/*
        List<ProductDto> product = productService.getList();
        System.out.println(product);*/
    }

    @GetMapping("list2")
    public String list2(Model model){

        List<ProductDto> productDtos = productService.getList();

        System.out.println(productDtos);
        model.addAttribute("productList",productDtos);
        return "redirect:/product/list";
    }
}
