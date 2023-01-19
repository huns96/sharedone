package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.mapper.OrderMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
        log.info("========== [ {}번 주문 등록 ] ===========", orderCode);
        //orderDto.setAdduser("admin"); //[TODO] user 임의로 넣음.. >> 로그인 정보 추가 해야함
        orderMapper.insertOrder(orderDto);
        return orderCode;
    }

    /* 주문 번호 생성 */
    public String generateOrderCode(OrderDto orderDto) {
        String orderCode = "";
        String date = LocalDate.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
        String buyerCode = orderDto.getBuyer_code();
        String code = buyerCode.substring(buyerCode.length()-2, buyerCode.length());
        //String random = (int) (Math.random() * (99-10+1)) + 1 + ""; // 10 ~ 99 랜덤 숫자
        int random = (int) (Math.random() * 100);
        orderCode = date + code + String.format("%02d", random);;
        return orderCode;
    }

    /* 주문 상품 등록 */
    public int registerOrderItem(String[] addItems, String orderCode, String adduser) {
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
            itemDto.setAdduser(adduser);
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
                itemDto.setAdduser(adduser);
                itemList.add(itemDto);
            }
        }

        int cnt = 0;
        for (OrderItemDto item : itemList) {
            orderMapper.insertOrderItem(item);
            cnt++;
        }
        log.info("========== {}개 상품 추가 ===========", cnt);
        return cnt;
    }

    /* 주문 목록 조회 */
    public Page<OrderDto> getOrderList(String orderCode, String buyerCode, String status, String userId) {
        if (orderCode != null && orderCode != "") {
            orderCode = "%" + orderCode + "%";
        }
        if (userId != null && userId != "") {
            int idx = userId.indexOf("(");
            if (idx != -1) {
                userId = userId.substring(0,idx);
            }
        }

        Page<OrderDto> list = orderMapper.listOrder(orderCode, buyerCode, status, userId);
        //log.info("list orderDto ==========> {}", list);
        return list;
    }

    /* 주문 상품 목록 조회 */
    public Page<OrderItemDto> getItemList(String orderCode, String requestDate) {
        Page<OrderItemDto> list = orderMapper.listItem(orderCode, requestDate);
        //log.info("list OrderItemDto ==========> {}", list);
        return list;
    }

    public OrderDto getOrderInfo(String orderCode) {
        return orderMapper.getOrder(orderCode);
    }

    /* 주문 수정 */
    public String modifyOrder(OrderDto orderDto) {
        orderMapper.updateOrder(orderDto);
        log.info("========== [ {}번 주문 수정 ] ===========", orderDto.getOrder_code());
        return orderDto.getOrder_code();
    }

    /* 주문 상품 수정 */
    public int modifyOrderItem(String[] modifyItems, String orderCode, String upduser) {
        List<OrderItemDto> modifyItemList = new ArrayList<>();
        OrderItemDto itemDto = new OrderItemDto();
        if (!modifyItems[0].contains(",")){
            List<String> list = Arrays.asList(modifyItems);
            itemDto.setProduct_code(list.get(0));
            itemDto.setProduct_name(list.get(1));
            itemDto.setQuantity(Integer.parseInt(list.get(2)));
            itemDto.setPrice(Integer.parseInt(list.get(3)));
            itemDto.setOrder_code(orderCode);
            itemDto.setUpduser(upduser);
            modifyItemList.add(itemDto);
        } else {
            for (int i=0; i<modifyItems.length; i++) {
                List<String> list = Arrays.asList(modifyItems[i].split(","));
                itemDto = new OrderItemDto();
                itemDto.setProduct_code(list.get(0));
                itemDto.setProduct_name(list.get(1));
                itemDto.setQuantity(Integer.parseInt(list.get(2)));
                itemDto.setPrice(Integer.parseInt(list.get(3)));
                itemDto.setOrder_code(orderCode);
                itemDto.setUpduser(upduser);
                modifyItemList.add(itemDto);
            }
        }

        int cnt = 0;
        for (OrderItemDto item : modifyItemList) {
            orderMapper.updateOrderItem(item);
            cnt++;
        }
        log.info("========== {}개 상품 수정 ===========", cnt);
        return cnt;
    }

    /* 주문 상품 삭제 */
    public int removeOrderItem(String[] removeItems, String orderCode, String upduser) {
        List<OrderItemDto> removeItemList = new ArrayList<>();
        OrderItemDto itemDto = new OrderItemDto();
        if (!removeItems[0].contains(",")){
            List<String> list = Arrays.asList(removeItems);
            itemDto.setProduct_code(list.get(0));
            itemDto.setOrder_code(orderCode);
            itemDto.setUpduser(upduser);
            removeItemList.add(itemDto);
        } else {
            for (int i=0; i<removeItems.length; i++) {
                List<String> list = Arrays.asList(removeItems[i].split(","));
                itemDto = new OrderItemDto();
                itemDto.setProduct_code(list.get(0));
                itemDto.setOrder_code(orderCode);
                itemDto.setUpduser(upduser);
                removeItemList.add(itemDto);
            }
        }

        int cnt = 0;
        for (OrderItemDto item : removeItemList) {
            orderMapper.removeOrderItem(item);
            cnt++;
        }
        log.info("========== {}개 상품 삭제 ===========", cnt);
        return cnt;
    }

    /* 주문 상태 변경 */
    public int changeStatus(String orderCode, String status, String upduser) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrder_code(orderCode);
        orderDto.setStatus(status);
        orderDto.setUpduser(upduser);

        return orderMapper.changeStatus(orderDto);
    }

    /* 주문 삭제 - 승인요청 전 최초 등록일 경우 */
    /*public void removeOrder(String orderCode) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrder_code(orderCode);
        orderDto.setUpduser("user1");
        OrderItemDto itemDto = new OrderItemDto();
        itemDto.setOrder_code(orderCode);
        itemDto.setUpduser("user1");
        log.info("========== [ {}번 주문 삭제 ] ===========", orderDto.getOrder_code());
        // 주문 삭제
        orderMapper.removeOrder(orderDto);
        // 주문 상품 삭제
        orderMapper.removeAllOrderItem(itemDto);
    }*/
}