package com.sharedOne.domain;

import lombok.Data;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

@Data
public class OrderDto {
    private int num; // 인덱스
    private String order_code; // 주문번호
    private String buyer_code; // 바이어번호
    private Date order_date; // 주문일
    private Date request_date; // 납품요청일
    private Date approval_date; // 승인일
    private Date return_date; // 반려일
    private String status; // 상태 (1:대기 2:승인요청 3:승인완료 4:승인취소 5:반려 6:종결)
    private String memo; // 주문 메모
    
    private String delyn; //삭제 여부
    private String adduser; // 등록자
    private Timestamp adddate; // 등록일
    private String upduser; // 수정자
    private Date upddate; // 수정일

    private String buyer_name; // 바이어명
}
