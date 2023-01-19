package com.sharedOne.service;

import com.github.pagehelper.Page;
import com.sharedOne.domain.OrderDto;
import com.sharedOne.domain.OrderItemDto;
import com.sharedOne.domain.PageInfo;
import com.sharedOne.mapper.ApprovalMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class ApprovalService {

    @Autowired
    private ApprovalMapper mapper;

    /* 주문 목록 조회 */
//    public List<OrderDto> approvalList(int page, PageInfo pageInfo, String orderCode, String buyerCode, String type, String userId) {
//        int records = 10;
//        int offset = (page - 1) * records;
//
//        int countAll = mapper.countAll("%"+orderCode+"%", "%"+buyerCode+"%", type);
//
//
//        if (userId != null && userId != "") {
//            int idx = userId.indexOf("(");
//            if (idx != -1) {
//                userId = userId.substring(0,idx);
//            }
//        }
//
//        int lastPage = (countAll - 1) / records + 1;
//
//        int leftPageNumber = (page - 1) / 10 * 10 + 1;
//        int rightPageNumber = leftPageNumber + 9;
//        int currentPageNumber = page;
//        rightPageNumber = Math.min(rightPageNumber, lastPage);
//        boolean hasNextPageNumber = page <= ((lastPage-1)/10*10);
//
//        pageInfo.setHasNextPageNumber(hasNextPageNumber);
//        pageInfo.setCurrentPageNumber(currentPageNumber);
//        pageInfo.setLeftPageNumber(leftPageNumber);
//        pageInfo.setRightPageNumber(rightPageNumber);
//        pageInfo.setLastPageNumber(lastPage);
//
//        return mapper.approvalList(offset, records, type, "%"+orderCode+"%", "%"+buyerCode+"%");
//    }

    /* 주문 상품 목록 조회 */
    public Page<OrderItemDto> getItemList(String orderCode, String requestDate) {
        Page<OrderItemDto> list = mapper.listItem(orderCode, requestDate);
        //log.info("list OrderItemDto ==========> {}", list);
        return list;
    }


    public OrderDto getOrderInfo(String orderCode) {
        return mapper.getOrder(orderCode);
    }




    public int approvalModify(OrderDto orderDto) {
        return mapper.approvalOrder(orderDto);
    }

    public int returnModify(OrderDto orderDto) {
        return mapper.returnOrder(orderDto);
    }

    public int cancel(OrderDto orderDto) {
        return mapper.cancelOrder(orderDto);
    }

    public Page<OrderDto> approvalList(String orderCode, String buyerCode, String status, String userId) {
        if (orderCode != null && orderCode != "") {
            orderCode = "%" + orderCode + "%";
        }
        if (userId != null && userId != "") {
            int idx = userId.indexOf("(");
            if (idx != -1) {
                userId = userId.substring(0,idx);
            }
        }

        Page<OrderDto> list = mapper.listOrder(orderCode, buyerCode, status, userId);
        return list;
    }
}
