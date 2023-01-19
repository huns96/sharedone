package com.sharedOne.service;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.domain.PriceDto;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.mapper.PriceMapper;
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

    public List<PriceDto> listPrice(int page, PageInfo pageInfo, String buyerType, String buyerKeyword, String productType, String productKeyword) {

        int records = 10;
        int offset = (page - 1) * records;

        int countAll = mapper.countAll("%"+buyerKeyword+"%", buyerType,"%"+productKeyword+"%", productType );

        int lastPage = (countAll - 1) / records + 1;

        int leftPageNumber = (page - 1) / 10 * 10 + 1;
        int rightPageNumber = leftPageNumber + 9;
        int currentPageNumber = page;
        rightPageNumber = Math.min(rightPageNumber, lastPage);
        boolean hasNextPageNumber = page <= ((lastPage-1)/10*10);

        pageInfo.setCountAll(countAll);
        pageInfo.setHasNextPageNumber(hasNextPageNumber);
        pageInfo.setCurrentPageNumber(currentPageNumber);
        pageInfo.setLeftPageNumber(leftPageNumber);
        pageInfo.setRightPageNumber(rightPageNumber);
        pageInfo.setLastPageNumber(lastPage);

        return mapper.listPrice(offset, records, buyerType, "%" + buyerKeyword + "%", productType, "%" + productKeyword + "%");
    }

    public int modify(PriceDto priceDto) {
        return mapper.update(priceDto);
    }


    public PriceDto get(int num) {
        PriceDto priceDto= mapper.findPriceByNum(num);


        return priceDto;
    }

    public void remove(PriceDto priceDto, List<Integer> removePrices) {
        if (removePrices != null)
            for (int num : removePrices) {

                mapper.removePrices(priceDto, num);

            };

        mapper.remove(priceDto);
    }


    public int dateCheck(PriceDto price) {
            return mapper.dateCheck(price);
    }

    public List<BuyerDto> searchBuyer(String type, String keyword, int page, PageInfo pageInfo) {
        int records = 10;
        int offset = (page - 1) * records;

//        int countAll = mapper.buyerCountAll("%"+keyword+"%");
//
//        int lastPage = (countAll - 1) / records + 1;
//
//        int leftPageNumber = (page - 1) / 10 * 10 + 1;
//        int rightPageNumber = leftPageNumber + 9;
//        int currentPageNumber = page;
//        rightPageNumber = Math.min(rightPageNumber, lastPage);
//        boolean hasNextPageNumber = page <= ((lastPage-1)/10*10);
//
//        pageInfo.setCountAll(countAll);
//        pageInfo.setHasNextPageNumber(hasNextPageNumber);
//        pageInfo.setCurrentPageNumber(currentPageNumber);
//        pageInfo.setLeftPageNumber(leftPageNumber);
//        pageInfo.setRightPageNumber(rightPageNumber);
//        pageInfo.setLastPageNumber(lastPage);
        return mapper.listBuyer( type, "%" + keyword + "%");
    }

    public List<ProductDto> searchProduct(String type, String keyword, int page, PageInfo pageInfo) {
        return mapper.listProduct(type, "%" + keyword + "%");
    }

    public List<BuyerDto> codeSearchBuyer(String keyword) {
        return mapper.codeSearchBuyer("%" + keyword + "%");
    }

    public List<BuyerDto> nameSearchBuyer(String keyword) {
        return mapper.nameSearchBuyer("%" + keyword + "%");
    }

    public List<ProductDto> codeSearchProduct(String keyword) {
        return mapper.codeSearchProduct("%" + keyword + "%");
    }

    public List<ProductDto> nameSearchProduct(String keyword) {
        return mapper.nameSearchProduct("%" + keyword + "%");
    }
}
