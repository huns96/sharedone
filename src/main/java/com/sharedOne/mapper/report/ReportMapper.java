package com.sharedOne.mapper.report;

import com.github.pagehelper.Page;
import com.sharedOne.domain.BuyerDto;
import com.sharedOne.domain.ProductDto;
import com.sharedOne.domain.report.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ReportMapper {
    public List<OrderDto> getOrders(OrderDto searchOrders);

//public List<OrderDto> selectOrders(Map<String,Object> map);

    public List<String> searchOrderCode(String order_code_part);

    List<OrderItemDto> getOrderItems(String product_code);

    SumDto getSums(OrderDto searchOrders);

    List<OrderGroupDto> selectOrderGroups(OrderDto searchOrders);

    List<OrderDto> getOrderCodes();

    int countAll(OrderDto searchOrders);

    int groupContAll(OrderDto searchOrders);

    Page<ProductDto> getProducts(String type, String value);
//    List<ProductDto> getProducts();

}


