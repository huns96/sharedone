<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>오더 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
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

        .search-label {
            width: 90px;
        }
        .search-input {
            width: 120px;
        }
        .search-btn {
            width: 80px;
            float: right;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
    <div class="container-md" style="width: 80%;">
        <div class="row">
            <div class="col">
                <div id="search" class="page-background">
                    <form class="form" action="" role="search">
                        <div class="row">
                            <label class="form-label search-label">주문번호</label>
                            <input class="form-control search-input" type="text" placeholder="10자리">
                            <label class="form-label search-label">바이어</label>
                            <input class="form-control search-input" type="text" placeholder="바이어검색">

                            <label class="form-label search-label">주문상태</label>
                            <select class="form-select search-input" aria-label="Disabled select example">
                                <%--1:대기 2:승인요청 3:승인완료 4:승인취소 5:반려 6:종결--%>
                                <option value="작성중">작성중</option>
                                <option selected value="승인요청">승인요청</option>
                                <option value="승인완료">승인완료</option>
                                <option value="승인취소">승인취소</option>
                                <option value="반려">반려</option>
                                <option value="종결">종결</option>
                            </select>

                            <button class="search-btn" type="submit">조회</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col">
                <div id="orders" class="contents top">
                    <div id="order-list" class="page-background">
                        <h4>주문 목록
                        <button id="addNewOrderButton" class="btn btn-danger" style="float: right"
                                data-bs-toggle="modal" data-bs-target="#newOrder">새 주문 등록</button>
                        </h4>
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
                            <c:forEach items="${orderList}" var="order" varStatus="status">
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
                        <table class="table table-hover" id="itemList-table">
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
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- 새 주문 등록 모달 --%>
    <%--<div class="modal fade" id="newOrder" &lt;%&ndash;style="z-index:1041;"&ndash;%&gt;&lt;%&ndash;data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true"&ndash;%&gt;>
        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="staticBackdropLabel"><b>새 주문 등록</b></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="newOrderForm" class="form-inline">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="newOrderCode" class="form-label">주문 코드</label>
                                <input id="newOrderCode" type="text" class="form-control" name="order_code" disabled/>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">상태</label>
                                <select class="form-select" disabled>
                                    <option selected value="작성중">작성중</option>
                                    <option value="승인요청">승인요청</option>
                                    <option value="승인완료">승인완료</option>
                                    <option value="승인취소">승인취소</option>
                                    <option value="반려">반려</option>
                                    <option value="종결">종결</option>
                                </select>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="newBuyerCode" class="form-label">바이어코드</label>
                                <div class="input-group">
                                    <input id="newBuyerCode" type="text" class="form-control" name="buyer_code" disabled/>
                                    <a data-bs-toggle="modal" href="#buyerPopup" class="btn btn-outline-secondary">검색</a>
                                    &lt;%&ndash;<button class="btn btn-outline-secondary" type="button" data-bs-toggle="modal"data-bs-target="#buyerPopup">>검색</button>&ndash;%&gt;
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="newBuyerName" class="form-label">바이어명</label>
                                <input id="newBuyerName" type="text" class="form-control" name="buyer_name" disabled/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="newRequestDate" class="form-label">납품요청일</label>
                                <input id="newRequestDate" type="date" class="form-control" name="request_date" />
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="newOrderDate" class="form-label">주문일</label>
                                <input id="newOrderDate" type="date" class="form-control" name="order_date" disabled/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col mb-3">
                                <label for="newMemo" class="form-label">주문메모</label>
                                <textarea rows="3" id="newMemo" class="form-control" name="memo"></textarea>
                            </div>
                        </div>
                        <hr>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label for="newProductCode" class="form-label">상품코드</label>
                                <div class="input-group">
                                    <input id="newProductCode" type="text" class="form-control" name="product_code" disabled/>
                                    <button id="productPopup" class="btn btn-outline-secondary" type="button">검색</button>
                                </div>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label for="newProductName" class="form-label">상품명</label>
                                <input id="newProductName" type="text" class="form-control" name="product_name" disabled/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="newPrice" class="form-label">단가</label>
                                <input id="newPrice" type="text" class="form-control" name="price" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="newQuantity" class="form-label">수량</label>
                                <input id="newQuantity" type="text" class="form-control" name="quantity" />
                            </div>
                            <div class="col-md-4 mb-3">
                                <label class="form-label"></label>
                                <button id="resetItemButton" class="btn btn-danger">초기화</button>
                                <button id="addNewItemButton" class="btn btn-danger">상품등록</button>
                            </div>
                        </div>
                        <div class="row">
                            <table class="table table-hover" id="newItem-table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>상품번호</th>
                                    <th>상품명</th>
                                    <th>수량</th>
                                    <th>단가</th>
                                    <th>총금액</th>
                                    <th>X</th>
                                </tr>
                                </thead>
                                <tbody></tbody>
                            </table>
                        </div>
                    </form>

                </div>
                <div class="modal-footer">
                    <button type="button" id="newOrderSubmitButton" class="btn btn-danger" data-bs-dismiss="modal">주문등록</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>--%>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">
    $(function () {
        /* 주문 상품 조회 */
        $('#order-table tr').dblclick(function() {
            itemListByOrderCode();
        });

        /* 주문 등록 팝업창 */
        $('#addNewOrderButton').click(function() {
            newOrderPopup();
        });

        /* 주문 수정 팝업창 */


        /* 바이어 검색 팝업창 */


        /* 등록,수정자 검색 팝업창 */


    });

    /* 주문번호별 상품 조회 */
    function itemListByOrderCode() {
        let tbody = $('#itemList-table tbody');
        tbody.empty(); //초기화
        tbody.append("");
        let tr = $(this);
        let td = tr.children();
        let orderCode = td.eq(1).text();

        setTimeout(function () {
            $.ajax({
                type: 'POST',
                url: '/order/itemList',
                data: {"orderCode": orderCode},
                success: function (result) {
                    console.log(result);
                    for (var i = 0; i < result.length; i++) {
                        let index = i + 1;
                        let product_code = result[i].product_code;
                        let product_name = result[i].product_name;
                        let quantity = result[i].quantity;
                        let price = result[i].price;
                        let total_price = result[i].total_price;
                        let old_price = result[i].old_price;
                        let adduser = result[i].adduser;
                        let upduser = result[i].upduser;
                        let order_code = result[i].order_code;
                        let buyer_name = result[i].buyer_name;
                        //let updateButton = updateButton;

                        tbody.append(
                            "<tr>"
                            + "<td>" + index + "</td>"
                            + "<td>" + product_code + "</td>"
                            + "<td>" + product_name + "</td>"
                            + "<td>" + quantity + "</td>"
                            + "<td>" + price + "</td>"
                            + "<td>" + total_price + "</td>"
                            + "<td>" + old_price + "</td>"
                            + "<td>" + adduser + "</td>"
                            + "<td>" + upduser + "</td>"
                            + "<td>" + order_code + "</td>"
                            + "<td>" + buyer_name + "</td>"
                            + "<td>수정버튼</td>"
                            + "</tr>"
                        );
                    }
                }
            });
        }, 100);
    }

    /* 새 주문 등록 팝업창 */
    function newOrderPopup() {
        let url = "/order/orderRegister";
        let popupWidth = 800;
        let popupHeight = 800;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    /* 주문 수정 팝업창 */

</script>
</body>
</html>
