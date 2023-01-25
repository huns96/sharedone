package com.sharedOne.service;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.mapper.BuyerMapper;
import com.github.pagehelper.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Service
public class BuyerService {
    @Autowired
    private BuyerMapper buyerMapper;

    public Page<BuyerDto> getBuyers() {
        return buyerMapper.selectBuyers();
    }

    public int insertBuyer(BuyerDto buyer) {
        return buyerMapper.insertBuyer(buyer);
    }

    public int updateBuyer(BuyerDto buyer) {
        return buyerMapper.updateBuyer(buyer);
    }

    public int deleteBuyer(String buyer_code) {
        return buyerMapper.deleteBuyer(buyer_code);
    }

    public Page<BuyerDto> getBuyersByKeyword(String type, String newKeyword) {
        return buyerMapper.selectBuyersByKeyword(type, newKeyword);
    }

    public void insertBuyer2(String[] itemList, String user_Id) {
        List<BuyerDto> newBuyers = new ArrayList<>();
        if (!itemList[0].contains(",")) {
            List<String> list = Arrays.asList(itemList);
            BuyerDto buyer = new BuyerDto();
            String buyer_code ="";
            buyer_code+= itemList[2].substring(0,2).toUpperCase();
            Random random = new Random();
            int num = random.nextInt(10000);
            String strNum = String.format("%04d", num);
            buyer_code +=strNum;
            System.out.println(buyer_code); // buyer_code 만듬
            buyer.setName(list.get(0));
            buyer.setAddress(list.get(1));
            buyer.setCountry(list.get(2));
            buyer.setLicense(list.get(3));
            buyer.setContact(list.get(4));
            buyer.setAdduser(user_Id);
            buyer.setBuyer_code(buyer_code);
            newBuyers.add(buyer);
        } else {
            for (int i = 0; i < itemList.length; i++) {
                List<String> list = Arrays.asList(itemList[i].split(","));
                BuyerDto buyer = new BuyerDto();
                String buyer_code ="";
                buyer_code+= list.get(2).substring(0,2).toUpperCase();
                Random random = new Random();
                int num = random.nextInt(10000);
                String strNum = String.format("%04d", num);
                buyer_code +=strNum;
                System.out.println(buyer_code); // buyer_code 만듬
                buyer.setName(list.get(0));
                buyer.setAddress(list.get(1));
                buyer.setCountry(list.get(2));
                buyer.setLicense(list.get(3));
                buyer.setContact(list.get(4));
                buyer.setAdduser(user_Id);
                buyer.setBuyer_code(buyer_code);
                newBuyers.add(buyer);
            }
        }
            for (BuyerDto buyer : newBuyers) {
                buyerMapper.insertBuyer2(buyer);
            }
    }
}
