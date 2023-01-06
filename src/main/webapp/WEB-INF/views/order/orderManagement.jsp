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
        .top {
            height: 40%;
        }
        .bottom {
            height: 40%;
        }
        h4 {
            font-weight: bold;
            margin-left: 20px;
        }
    </style>
    <%--<script type="text/javascript" src="order.js" ></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
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
                <div id="orders" class="contents top">
                    <div id="order-list" class="page-background">
                        <h4>주문 목록</h4>
                        <table class="table table-hover" id="order-table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>주문번호</th>
                                <th>거래처명</th>
                                <th>주문일자</th>
                                <th>납품요청일자</th>
                                <th>승인일자</th>
                                <th>반려일자</th>
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
                                    <td>${order.request_date}</td>
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
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div id="items" class="contents bottom">
                    <div id="item-list" class="page-background">
                        <h4>주문 상품 목록</h4>
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>상품번호</th>
                                <th>상품명</th>
                                <th>수량</th>
                                <th>단가</th>
                                <th>총금액</th>
                                <th>기존단가</th>
                                <th>등록자</th>
                                <th>수정자</th>
                                <th>주문코드</th>
                                <th>바이어명</th>
                                <th>주문수정</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${itemList}" var="item">
                                <tr id="item"+>
                                    <td>${status.count}</td>
                                    <td>${item.product_code}</td>
                                    <td>${item.product_name}</td>
                                    <td>${item.quantity}</td>
                                    <td>${item.price}</td>
                                    <td>${item.total_price}</td>
                                    <td>${item.old_price}</td>
                                    <td>${item.adduser}</td>
                                    <td>${item.upduser}</td>
                                    <td>${item.order_code}</td>
                                    <td>${item.buyer_name}</td>
                                    <td>수정 버튼</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $(function() {
           $('#order-table tr').dblclick(function() {
               let tr = $(this);
               let td = tr.children();
               let orderCode = td.eq(1).text();
               console.log(orderCode);

               $.ajax({
                   url: "/order/itemList", // 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
                   data: { orderCode: orderCode },  // HTTP 요청과 함께 서버로 보낼 데이터
                   method: "GET",   // HTTP 요청 메소드(GET, POST 등)
                   dataType: "json" // 서버에서 보내줄 데이터의 타입
               })
                   // HTTP 요청이 성공하면 요청한 데이터가 done() 메소드로 전달됨.
                   .done(function(json) {
                       console.log(json);
                       /*$("<h1>").text(json.title).appendTo("body");
                       $("<div class=\"content\">").html(json.html).appendTo("body");*/
                   })
                   // HTTP 요청이 실패하면 오류와 상태에 관한 정보가 fail() 메소드로 전달됨.
                   .fail(function(xhr, status, errorThrown) {
                       /*$("#text").html("오류가 발생했다.<br>")
                           .append("오류명: " + errorThrown + "<br>")
                           .append("상태: " + status);*/
                   })
                   //
                   .always(function(xhr, status) {
                      /* $("#text").html("요청이 완료되었습니다!");*/
                   });
           });
        });

    </script>
</body>
</html>
