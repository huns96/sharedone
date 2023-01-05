package com.example.sharedOne.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderItemDto {
    private int num; // 인덱스
    private String orderCode; // 주문번호
    private String productCode; // 제품번호
    private String currency; // 통화
    private int quantity; // 수량
    private int price; // 단가
    private int totalPrice; // 총금액

    private String delyn; //삭제 여부
    private String adduser; // 등록자
    private Timestamp adddate; // 등록일
    private String upduser; // 수정자
    private Timestamp upddate; // 수정일
}
