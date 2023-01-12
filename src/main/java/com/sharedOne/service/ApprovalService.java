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
    public List<OrderDto> approvalList(int page, PageInfo pageInfo) {
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

        return mapper.approvalList(offset, records);
    }

    public List<OrderItemDto> getItemList(String orderCode) {

        return mapper.listItem(orderCode);

    }
}
