<%--
  Created by IntelliJ IDEA.
  User: dlfma
  Date: 2023-01-03
  Time: 오후 2:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>오더 관리</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/price.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
<div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
<div class="container-md" style="width: 84%">


    <div class="row">
        <div class="col">
            <div id="search" class="page-background">
                <form action="" role="search" style="display: flex; height: 40px" >
                    <label class="form-label" style="width: 100px;  margin-top:8px; text-align:center">주문번호</label>
                    <input class="form-control" type="text" placeholder="10자리" style="width: 240px; text-align:center">

                    <label class="form-label" style="width: 100px;  margin-top:8px; text-align:center">주문상태</label>
                    <select class="form-select" style="width: 240px; vertical-align:bottom" aria-label="Disabled select example">
                        <option selected value="승인요청">승인요청</option>
                        <option value="승인완료">승인완료</option>
                    </select>
                    <br>
                    <button type="submit" style="width: 100px; height: 40px; position: absolute; right:2%; border-radius: 7px;">조회</button>
                </form>
            </div>
        </div>
    </div>



    <div class="row">
        <div class="col">
            <div id="orders" class="contents top">
                <div id="order-list" class="page-background">
                    <h4>주문 승인 목록</h4>
                    <table class="table table-hover" id="order-table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>주문번호</th>
                            <th>거래처명</th>
                            <th>주문일자</th>
                            <th>납품요청일자</th>
                            <th>상태</th>
                            <th>등록자</th>
                            <th>승인자</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${approvalList}" var="approval">
                            <tr>
                                <td>${status.count}</td>
                                <td>${approval.order_code}</td>
                                <td>${approval.buyer_name}</td>
                                <td>${approval.order_date}</td>
                                <td>${approval.request_date}</td>
                                <td>${approval.status}</td>
                                <td>${approval.adduser}</td>
                                <td>${approval.upduser}</td>
                                <td><input class="btn btn-primary btn-sm" type="button" value="승인" data-bs-toggle="modal" data-bs-target="#approvalModal"></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="approvalModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5">승인</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    승인하시겠습니까?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                    <button id="approvalConfirmButton" type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
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
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${itemList}" var="item">
                            <tr id="item">
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
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<%--<form id="approvalForm" action="/approval/approvalList" method="post">--%>
<%--    <input type="hidden" name="num" value="${approvalList.num }">--%>
<%--</form>--%>


<script type="text/javascript" src="../js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>


    // document.querySelector("#approvalConfirmButton").addEventListener("click", function() {
    //     document.querySelector("#approvalForm").submit();
    // });

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
