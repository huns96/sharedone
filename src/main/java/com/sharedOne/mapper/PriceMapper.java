package com.sharedOne.mapper;

import com.github.pagehelper.Page;
import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.PriceDto;
import com.sharedOne.domain.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PriceMapper {

    List<PriceDto> selectPrice();

    int insert(PriceDto price);

    int countAll(String buyerKeyword, String buyerType, String productKeyword, String productType);

    List<PriceDto> listPrice(int offset, int records, String buyerType, String buyerKeyword, String productType, String productKeyword);


    //    @Update("UPDATE price SET buyer_code = #{buyer_code}, product_code = #{product_code},price = #{price}, start_date = #{start_date}, end_date = #{end_date}, currency = #{currency}, upduser = 'user' WHERE num = #{num} ")
    int update(PriceDto priceDto);

    PriceDto findPriceByNum(int num);

    void remove(PriceDto priceDto);



    List<BuyerDto> listBuyer(String type, String keyword);
    List<ProductDto> listProduct(String type, String keyword);


    void removePrices(PriceDto priceDto, int num);

    int buyerCountAll(String keyword, String type);

    Page<ProductDto> getProductList(String type, String value);

    int dateCheck(PriceDto price);

    PriceDto getPriceInfo(String num);

    List<PriceDto> gerItemList(PriceDto priceDto);
//    int dateCheck(String buyer_code, String product_code, Date start_date, Date end_date);
}
