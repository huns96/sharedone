<%--
  Created by IntelliJ IDEA.
  User: dlfma
  Date: 2023-01-03
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>오더 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        body { background-color: #e0e0e0; }
        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }
        .left {
            float: left;
            width: 65%;
        }
        .right {
            float: right;
            width: 30%;
        }
        .top {
            /*float: top;*/
            height: 40%;
        }
        .bottom {
            /*float: bottom;*/
            height: 40%;
        }
        h4 {
            font-weight: bold;
            margin-left: 20px;
        }
    </style>
</head>
<body>
    <div class="container-md">
        <div class="row">
            <div class="col">
                <div id="search" class="page-background">
                    <form action="" role="search">
                        <label class="form-label">주문번호</label>
                        <input class="form-control" type="text" placeholder="10자리">

                        <label class="form-label">주문상태</label>
                        <select class="form-select" aria-label="Disabled select example" disabled>
                            <%--1:대기 2:승인요청 3:승인완료 4:승인취소 5:반려 6:종결--%>
                            <option value="대기">대기</option>
                            <option selected value="승인요청">승인요청</option>
                            <option value="승인완료">승인완료</option>
                            <option value="승인취소">승인취소</option>
                            <option value="반려">반려</option>
                            <option value="종결">종결</option>
                        </select>
                        <button type="submit">조회</button>

                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div id="order" class="contents top">
                    <div id="order-list" class="page-background left">
                        <h4>주문 목록</h4>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>주문번호</th>
                                <th>거래처명</th>
                                <th>주문일자</th>
                                <th>납품요청일자</th>
                                <th>상태변경일</th>
                                <th>상태</th>
                                <th>등록자</th>
                                <th>수정자</th>
                                <th>주문수정</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${orderList}" var="order">
                                <tr>
                                    <td>${status.count}</td>
                                    <td>${order.order_code}</td>
                                    <td>${order.buyer_name}</td>
                                    <td>${order.order_date}</td>
                                    <td>${order.approval_date}</td>
                                    <td>${order.return_date}</td>
                                    <td>${order.status}</td>
                                    <td>${order.adduser}</td>
                                    <td>${order.upduser}</td>
                                    <td>수정 버튼</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <div id="order-info" class="page-background right">
                        <h4>주문 내역</h4>
                        <form action=""></form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div id="item" class="contents bottom">
                    <div id="item-list" class="page-background left">
                        <h4>상품 목록</h4>
                    </div>
                    <div id="item-info" class="page-background right">
                        <h4>상품 내역</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
