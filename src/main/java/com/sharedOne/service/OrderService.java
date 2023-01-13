package com.sharedOne.service;

import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    /* 주문 등록 */
    public String registerOrder(OrderDto orderDto) {
        String orderCode = generateOrderCode(orderDto);
        orderDto.setOrder_code(orderCode); // 주문번호 채번
        log.info("========== {}번 주문 등록 ===========", orderCode);
        orderDto.setAdduser("user1"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함
        orderMapper.insertOrder(orderDto);
        return orderCode;
    }
    
    /* 주문 번호 생성 */
    public String generateOrderCode(OrderDto orderDto) {
        String orderCode = "";
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        String buyerCode = orderDto.getBuyer_code();
        String code = buyerCode.substring(buyerCode.length()-2, buyerCode.length());
        String random = (int) (Math.random() * (99-10+1)) + 1 + ""; // 10 ~ 99 랜덤 숫자
        orderCode = date + code + random;
        return orderCode;
    }
    
    /* 주문 상품 등록 */
    public int registerOrderItem(String[] addItems, String orderCode) {
        List<OrderItemDto> itemList = new ArrayList<>();
        OrderItemDto itemDto = new OrderItemDto();
        if (!addItems[0].contains(",")){
            List<String> list = Arrays.asList(addItems);
            itemDto.setProduct_code(list.get(0));
            itemDto.setProduct_name(list.get(1));
            itemDto.setQuantity(Integer.parseInt(list.get(2)));
            itemDto.setPrice(Integer.parseInt(list.get(3)));
            itemDto.setTotal_price(Integer.parseInt(list.get(4)));
            itemDto.setOrder_code(orderCode);
            itemDto.setAdduser("user1"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함
            itemList.add(itemDto);
        } else {
            for (int i=0; i<addItems.length; i++) {
                List<String> list = Arrays.asList(addItems[i].split(","));
                itemDto = new OrderItemDto();
                itemDto.setProduct_code(list.get(0));
                itemDto.setProduct_name(list.get(1));
                itemDto.setQuantity(Integer.parseInt(list.get(2)));
                itemDto.setPrice(Integer.parseInt(list.get(3)));
                itemDto.setTotal_price(Integer.parseInt(list.get(4)));
                itemDto.setOrder_code(orderCode);
                itemDto.setAdduser("user1"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함
                itemList.add(itemDto);
            }
        }
        //log.info("register itemList ===========> {}", itemList);
        int cnt = 0;
        for (OrderItemDto item : itemList) {
            orderMapper.insertOrderItem(item);
            cnt++;
        }
        log.info("========== {}개 상품등록 성공 ===========", cnt);
        return cnt;
    }
    
    /* 주문 목록 조회 */
    public List<OrderDto> getOrderList() {
        return orderMapper.listOrder();
    }
    
    /* 주문 상품 목록 조회 */
    public List<OrderItemDto> getItemList(String orderCode) {
        return orderMapper.listItem(orderCode);
    }

    public OrderDto getOrderInfo(String orderCode) {
        return orderMapper.getOrder(orderCode);
    }

    public int changeStatus(String orderCode, String status) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrder_code(orderCode);
        orderDto.setStatus(status);
        orderDto.setUpduser("user1"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함

        return orderMapper.changeStatus(orderDto);
    }
}
