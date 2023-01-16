package com.sharedOne.controller.Kyj;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sharedOne.domain.CategoryDto;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.service.CategoryService;
import com.sharedOne.service.ProductService;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import java.util.*;

@Controller
@RequestMapping("product")

public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private CategoryService categoryService;

    @GetMapping("list")
    public String list(Model model, @RequestParam(defaultValue = "1")int page) {

        PageHelper.startPage(page, 10);
        Page<ProductDto> productDtos = productService.getList();

        model.addAttribute("pageNum", productDtos.getPageNum());
        model.addAttribute("pageSize", productDtos.getPageSize());
        model.addAttribute("pages", productDtos.getPages());
        model.addAttribute("total",productDtos.getTotal());
        model.addAttribute("products", productDtos.getResult());

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

    @GetMapping("listSearch")
    public String listSearch(Model model, @RequestParam(defaultValue = "1")int page,
                             @RequestParam(name="search",defaultValue = "all")String type,
                             @RequestParam(name="keyword",defaultValue = "")String keyword){

        PageHelper.startPage(page, 10);
        String newKeyword = "%"+keyword+"%";
        Page<ProductDto> productDtos = productService.getProductByKeword(type,newKeyword);
        model.addAttribute("pageNum", productDtos.getPageNum());
        model.addAttribute("pageSize", productDtos.getPageSize());
        model.addAttribute("pages", productDtos.getPages());
        model.addAttribute("total",productDtos.getTotal());
        model.addAttribute("products", productDtos.getResult());

        return "product/list";
    }

    @GetMapping("listSearchCategory")
    public String listSearch(Model model, @RequestParam(defaultValue = "1")int page,
                             @RequestParam(name="categoryId", defaultValue = "")String categoryId){
       // System.out.println("THIS IS CATEGORYID" + categoryId); // middle category
        PageHelper.startPage(page, 10);

        if(categoryId.equals("")){
            Page<ProductDto> products = productService.getList();
            model.addAttribute("pageNum", products.getPageNum());
            model.addAttribute("pageSize", products.getPageSize());
            model.addAttribute("pages", products.getPages());
            model.addAttribute("total",products.getTotal());
            model.addAttribute("products", products);
        }else {
            int category = Integer.parseInt(categoryId);
            Page<ProductDto> products = productService.getListByCategory(category);
            model.addAttribute("pageNum", products.getPageNum());
            model.addAttribute("pageSize", products.getPageSize());
            model.addAttribute("pages", products.getPages());
            model.addAttribute("total",products.getTotal());
            model.addAttribute("products", products);
        }

        return "product/list";
    }

    @PostMapping("register")
    public String register(String name, String ea, int category,int category_id) {
        System.out.println("name" + name);
        System.out.println("ea" + ea);
        System.out.println("category" + category);
        System.out.println("category_id" + category_id);
        String product_code = "";
        if (category == 1) {
            product_code = "MO";
        } else if (category == 2) {
            product_code = "TV";
        } else if (category == 3) {
            product_code = "HO";
        } //category_id = integer

//        System.out.println(name + " " + ea + " " + category_id);


        Random random = new Random();
        int num = random.nextInt(10000);
        String strNum = String.format("%04d", num);
        String adduser = "admin";
        product_code += strNum;
        System.out.println("this is product_code" + product_code);
        ProductDto temp = new ProductDto();
        temp.setProduct_code(product_code);
        temp.setName(name);
        temp.setEa(ea);
        temp.setCategory_id(category_id);
        temp.setAdduser("admin");
//        System.out.println(temp);


        System.out.println(product_code +" " + name + " " + ea + " " + category_id + " " + adduser);
        int insertProduct =
               productService.insertProduct(product_code, name, ea, category_id, adduser);

        System.out.println(insertProduct);


        return "redirect:/product/list";
    }

    @GetMapping("categoryListMid/{main_id}")
    @ResponseBody
    public HashMap<Integer,String> categoryList(@PathVariable int main_id) {
        List<CategoryDto> categoryList = categoryService.getListById(main_id);
        HashMap<Integer,String> hm = new HashMap<>();

        for(int i=0;i<categoryList.size();i++){
            hm.put(categoryList.get(i).getMiddle_id(),categoryList.get(i).getMiddle_name());
        }
//        System.out.println(hm);
//
//        System.out.println(categoryList);
        return hm;
    }

    @GetMapping("categoryListSub/{middle_id}")
    @ResponseBody
    public HashMap<Integer,String> categoryListSub(@PathVariable int middle_id){
        //System.out.println(middle_id);
        List<CategoryDto> categoryListSub = categoryService.getListByIdSub(middle_id);
        HashMap<Integer,String> hm = new HashMap<>();
        //System.out.println(categoryListSub);
        for(int i=0;i<categoryListSub.size();i++){
            hm.put(categoryListSub.get(i).getSub_id(),categoryListSub.get(i).getSub_name());
        }
        //System.out.println(categoryListSub);
        //HashMap<Integer,String> hm = new HashMap<>();

        return hm;
    }

    @PostMapping("delete")
    public String deleteProduct(String checkedList){
        int number = 0;
        int cnt = 0;
//        System.out.println("나 호출됐냐?" + checkedList);
        if(checkedList.length() ==0){
            return "redirect:/product/list";
        }
        else{
            String[] checked = checkedList.split(",");
            number = checked.length;
            cnt = 0;
            for(int i=0;i<checked.length;i++){
                cnt += productService.deleteProduct(checked[i]);
            }

            if(number == cnt){
                System.out.println("삭제 완료요");
            }else{
                System.out.println("삭제 안됨");
            }
            return "redirect:/product/list";
        }
    }
}
