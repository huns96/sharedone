package com.example.sharedOne.domain;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderItemDto {
    private int num; // 인덱스
    private String order_code; // 주문번호
    private String product_code; // 상품명
    private int category_id; // 카테고리
    private String product_name; // 상품명
    private String buyer_code; // 바이어번호
    private String buyer_name; // 바이어명
    private String currency; // 통화
    private int quantity; // 수량
    private int price; // 단가(사용자가 변경가능한 값)
    private int old_price; // 기존단가(price 테이블 값)
    private int total_price; // 총금액

    private String delyn; //삭제 여부
    private String adduser; // 등록자
    private Timestamp adddate; // 등록일
    private String upduser; // 수정자
    private Timestamp upddate; // 수정일
}
