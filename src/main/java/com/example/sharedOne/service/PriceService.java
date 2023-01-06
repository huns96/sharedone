package com.example.sharedOne.service;

import com.example.sharedOne.domain.BuyerDto;
import com.example.sharedOne.domain.PageInfo;
import com.example.sharedOne.domain.PriceDto;
import com.example.sharedOne.mapper.PriceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class PriceService {

    @Autowired
    private PriceMapper mapper;


    public List<PriceDto> getPrice() {
        return mapper.selectPrice();
    }



    public int register(PriceDto price) {
        return mapper.insert(price);
    }

    public List<PriceDto> listPrice(int page, PageInfo pageInfo) {

        int records = 10;
        int offset = (page - 1) * records;

        int countAll = mapper.countAll();

        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page - 1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        int currentPageNumber = page;
        rightPageNumber = Math.min(rightPageNumber, lastPage);
        boolean hasNextPageNumber = page <= ((lastPage-1)/10*10);

        pageInfo.setHasNextPageNumber(hasNextPageNumber);
        pageInfo.setCurrentPageNumber(currentPageNumber);
        pageInfo.setLeftPageNumber(leftPageNumber);
        pageInfo.setRightPageNumber(rightPageNumber);
        pageInfo.setLastPageNumber(lastPage);

        return mapper.listPrice(offset, records);
    }

    public int modify(PriceDto priceDto) {
        return mapper.update(priceDto);
    }


    public List<BuyerDto> searchBuyer(String type, String keyword) {
        return mapper.listBuyer(type, "%" + keyword + "%");
    }
}
