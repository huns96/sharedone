package com.sharedOne.mapper;

import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.PriceDto;
import com.sharedOne.domain.ProductDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PriceMapper {

    List<PriceDto> selectPrice();

    int insert(PriceDto price);

    int countAll();

    List<PriceDto> listPrice(int offset, int records);


//    @Update("UPDATE price SET buyer_code = #{buyer_code}, product_code = #{product_code},price = #{price}, start_date = #{start_date}, end_date = #{end_date}, currency = #{currency}, upduser = 'user' WHERE num = #{num} ")
    int update(PriceDto priceDto);

    PriceDto findPriceByNum(int num);

    void remove(PriceDto priceDto);

    int dateCheck(PriceDto price);

    List<BuyerDto> listBuyer(String type, String keyword);
    List<ProductDto> listProduct(String type, String keyword);

    List<BuyerDto> codeSearchBuyer(String keyword);

    List<BuyerDto> nameSearchBuyer(String keyword);

    List<ProductDto> codeSearchProduct(String keyword);

    List<ProductDto> nameSearchProduct(String keyword);
}
