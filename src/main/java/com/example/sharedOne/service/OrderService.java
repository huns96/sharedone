package com.example.sharedOne.service;

import com.example.sharedOne.domain.OrderDto;
import com.example.sharedOne.domain.OrderItemDto;
import com.example.sharedOne.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
@Slf4j
public class OrderService {

    @Autowired
    private OrderMapper orderMapper;

    /* 주문 등록 */
    public int registerOrder(OrderDto orderDto) {
        String orderCode = generateOrderCode(orderDto);
        orderDto.setOrder_code(orderCode); // 주문번호 채번
        log.info("========== {}번 주문 등록 시작 ===========", orderCode);
        orderDto.setAdduser("user1"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함

        // order_header 정보 저장
        int cnt = orderMapper.insertOrder(orderDto);
        
        
        // order_item 정보 저장
        //addItems();


        log.info("========== {}번 주문 등록 성공 ===========", orderCode);
        return cnt;
        
    }
    
    /* 주문 번호 생성 */
    public String generateOrderCode(OrderDto orderDto) {
        String orderCode = "";
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        String buyerCode = orderDto.getBuyer_code();
        String code = buyerCode.substring(buyerCode.length()-2, buyerCode.length());
        String random = (int) (Math.random() * 100) + "";
        orderCode = date + code + random;
        //log.info("주문번호 ==============> {} = {} + {} + {}", orderCode, date, code, random);
        return orderCode;
    }
    
    /* 주문 상품 추가 */
    public int addItems() {
        log.info("========== 상품등록 시작 ===========");
        int cnt = 0;//orderMapper.insertOrder(orderDto);





        log.info("========== {}개 상품등록 성공 ===========", cnt);
        return cnt;
    }
    
    /* 주문 목록 조회 */
    public List<OrderDto> getOrderList() {
        return orderMapper.listOrder();
    }
    
    /* 주문 상품 목록 조회 */
    public List<OrderItemDto> getItemList(String order_code) {
        log.info("itemList orderCode ========> {}", order_code);
        return orderMapper.listItem(order_code);
    }
}
