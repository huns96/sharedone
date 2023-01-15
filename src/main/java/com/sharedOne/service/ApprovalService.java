package com.sharedOne.service;

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
    public List<OrderDto> approvalList(int page, PageInfo pageInfo, String type, String keyword) {
        int records = 10;
        int offset = (page - 1) * records;

        int countAll = mapper.countAll("%"+keyword+"%", type);

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

        return mapper.approvalList(offset, records, type, "%" + keyword + "%");
    }

    /* 주문 상품 목록 조회 */
    public List<OrderItemDto> getItemList(String orderCode) {
        return mapper.listItem(orderCode);
    }

    public OrderDto getOrderInfo(String orderCode) {
        return mapper.getOrder(orderCode);
    }

    /* 주문 수정 */

    /* 주문 상태 변경 */
    public int changeStatus(String orderCode, String status) {
        OrderDto orderDto = new OrderDto();
        orderDto.setOrder_code(orderCode);
        orderDto.setStatus(status);
        orderDto.setUpduser("user1");
        return mapper.changeStatus(orderDto);
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
}
