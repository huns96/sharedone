package com.example.sharedOne.controller.Kyj;

import com.example.sharedOne.domain.CategoryDto;
import com.example.sharedOne.domain.ProductDto;
import com.example.sharedOne.service.CategoryService;
import com.example.sharedOne.service.ProductService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("product")

public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("list")
    public String list(Model model) {

        List<ProductDto> productDtos = productService.getList();

        //System.out.println(productDtos);
        model.addAttribute("products", productDtos);
        return "product/list";
    }


    @GetMapping("list.json")
    @ResponseBody
    public String list2(Model model) {
        List<ProductDto> data = productService.getList();
        //  System.out.println(data);

        //System.out.println(data);

        JSONObject jo = new JSONObject();
        JSONArray ja = new JSONArray();

        for (int i = 0; i < data.size(); i++) {
            Map<String, Object> hm = new HashMap<>();
            JSONObject obj2 = new JSONObject();
            hm.put("code", data.get(i).getProduct_code());
            hm.put("name", data.get(i).getName());
            hm.put("ea", data.get(i).getEa());
            obj2.putAll(hm);
            ja.add(obj2);
/*
            JSONObject j = new JSONObject(hm);
            System.out.println(j);*/
        }
        //System.out.println(ja);
        jo.put("data", ja);
//        System.out.println(jo);
        return jo.toJSONString();

    }

    @GetMapping("list2")
    public void list22() {

    }

    @PostMapping("register")
    public String register(String name, String ea, int category_id) {
        String product_code = "";
        if (category_id == 67) {
            product_code = "MO";
        } else if (category_id == 68) {
            product_code = "TV";
        } else if (category_id == 69) {
            product_code = "HO";
        }
//        System.out.println("this is" + product_code);
//        System.out.println(name + " " + ea + " " + category_id);


        return "redirect:/product/list";
    }

    @GetMapping("categoryList/{main_id}")
    @ResponseBody
    public String categoryList(@PathVariable int main_id) {
        List<CategoryDto> categoryList = categoryService.getListById(main_id);

        System.out.println(categoryList);
        return "";
    }
}
