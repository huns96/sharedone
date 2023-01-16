<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>오더 관리</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<%--    <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">--%>
    <style>
        body { background-color: #e0e0e0; }
        .container-md { width: 80%; margin: 20px; }
        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            margin: 5px;
            border-radius: 5px;
        }
        /*#order-list, #item-list { height: 390px; } */  /*[TODO] 페이지네이션 구현 후 추가*/

        h4 {
            font-weight: bold;
            margin-left: 20px;
        }

        table { text-align: center}
        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }
        #order-table, #itemList-table { margin-top: 20px; }

        #search { height: 60px; }
        .search-label {
            width: 100px;  margin-top:8px; text-align:center; font-weight: bold;
        }
        .search-select {
            width: 100px;  text-align:center; margin-left: 20px;
        }
        .search-input {
            width: 150px; /*text-align:center*/
        }
        .search-btn {
            height: 40px;  /*position: absolute; right:6%;*/
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
    <div class="container-md">
        <div class="row">
            <div class="col">
                <div id="search" class="page-background">
                    <form action="/order/orderManagement" role="search" style="display: flex;" >
                        <label class="form-label search-label">주문번호</label>
                        <input id="orderCode" class="form-control search-input" type="text" name="orderCode" value="${param.orderCode}">

                        <label class="form-label search-label">바이어명</label>
                        <div class="input-group" style="width: 230px">
                            <input id="buyerName" class="form-control search-input" type="text" name="buyerName" value="${param.buyerName}" placeholder="바이어코드 검색" readonly>
                            <input id="buyerCode" class="form-control search-input" type="hidden" name="buyerCode" value="${param.buyerCode}">
                            <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                        </div>

                        <label class="form-label search-label"> 주문상태</label>
                        <select id="status" name="status" class="form-select search-input">
                            <option value="all">전체</option>
                            <option value="작성중" ${param.status == '작성중' ? 'selected' : '' }>작성중</option>
                            <option value="승인요청" ${param.status == '승인요청' ? 'selected' : '' }>승인요청</option>
                            <option value="승인완료" ${param.status == '승인완료' ? 'selected' : '' }>승인완료</option>
                            <option value="승인취소" ${param.status == '승인취소' ? 'selected' : '' }>승인취소</option>
                            <option value="반려" ${param.status == '반려' ? 'selected' : '' }>반려</option>
                            <option value="종결" ${param.status == '종결' ? 'selected' : '' }>종결</option>
                        </select>

                        <%--<select name="t" id="searchTypeSelect" class="form-select search-select">
                            <option value="all">전체</option>
                            <option value="adduser" ${param.t == 'adduser' ? 'selected' : '' }>등록자</option>
                            <option value="upduser" ${param.t == 'upduser' ? 'selected' : '' }>수정자</option>
                        </select>
                        <input value="${param.q }" class="form-control search-input" type="search" placeholder="등록자, 수정자" aria-label="Search" name="q">--%>
                        <div class="buttonDiv" style="position: absolute; right:6%;">
                            <button id="reset-btn" class="btn btn-secondary search-btn" type="button">초기화</button>
                            <button class="btn btn-dark search-btn" type="submit">조회</button>
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
                        <button id="addNewOrderButton" class="btn btn-success" style="float: right; margin-right: 20px;">새 주문 등록</button>
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
                                    <th>수정/삭제</th>
                                    <th>상태변경</th>
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
                                    <td>
                                        <c:if test="${order.status == '작성중' || order.status == '승인취소' || order.status == '반려'}">
                                            <button type="button" class="btn btn-outline-warning btn-sm" onclick="modifyOrderPopup(${order.order_code})">수정</button>
                                        </c:if>
                                        <c:if test="${(order.approval_date == '' || order.approval_date == null) &&
                                                        (order.return_date == '' || order.return_date == null) && order.status == '작성중'}">
                                            <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeOrder(${order.order_code})">삭제</button>
                                        </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${order.status == '작성중'}">
                                            <button type="button" class="btn btn-outline-primary btn-sm" onclick="changeStatus('${order.status}',${order.order_code})">승인요청</button>
                                        </c:if>
                                        <c:if test="${order.status == '승인요청'}">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" onclick="changeStatus('${order.status}',${order.order_code})">승인취소</button>
                                        </c:if>
                                    </td>
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
                                <%--<th>주문코드</th>
                                <th>바이어명</th>--%>
                            </tr>
                            </thead>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>
<script type="text/javascript">
    $(function () {
        /* 주문 상품 조회 */
        $('#order-table tr').dblclick(function() {
            let tr = $(this);
            let td = tr.children();
            let orderCode = td.eq(1).text();
            itemListByOrderCode(orderCode);
        });

        /* 검색 초기화 */
        $('#reset-btn').click(function() {
            $('#orderCode').val("");
            $('#buyerCode').val("");
            $('#buyerName').val("");
            $('#status').val("");
        });

        /* 주문 등록 팝업창 */
        $('#addNewOrderButton').click(function() {
            newOrderPopup();
        });

        /* 바이어 검색 팝업창 */
        $('#buyerPopupButton').click(function() {
            buyerPopup();
        });

        /* 등록,수정자 검색 팝업창 */



    });

    /* 주문번호별 상품 조회 */
    function itemListByOrderCode(orderCode) {
        let tbody = $('#itemList-table tbody');
        tbody.empty(); //초기화
        tbody.append("");

        setTimeout(function () {
            $.ajax({
                type: 'POST',
                url: '/order/itemList',
                data: {"orderCode": orderCode},
                dataType : 'json',
                traditional: true,
                success: function (result) {
                    //console.log(result);
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
                            + "<td>" + parseInt(quantity).toLocaleString() + "</td>"
                            + "<td>" + parseInt(price).toLocaleString() + "</td>"
                            + "<td>" + parseInt(total_price).toLocaleString() + "</td>"
                            + "<td>" + parseInt(old_price).toLocaleString() + "</td>"
                            + "<td>" + adduser + "</td>"
                            + "<td>" + upduser + "</td>"
                           /* + "<td>" + order_code + "</td>"
                            + "<td>" + buyer_name + "</td>"*/
                            + "</tr>"
                        );
                    }
                }
            });
        }, 100);
    }

    /* 바이어 검색 팝업창 */
    function buyerPopup() {
        let url = "/search/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }
    // 바이어 정보 추가
    window.setBuyerInfo = function (buyerCode, buyerName) {
        $('#buyerCode').val(buyerCode);
        $('#buyerName').val(buyerName);
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
    function modifyOrderPopup(orderCode) {
        let url = "/order/orderModify?orderCode=" + orderCode;//$('#orderCode').val();
        let popupWidth = 800;
        let popupHeight = 800;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    /* 상태 변경 */
    function changeStatus(nowStatus, orderCode) {
        let status = "";
        if (nowStatus == '작성중') status = "승인요청";
        if (nowStatus == '승인요청') status = "승인취소";

        $.ajax({
            type: 'POST',
            url: '/order/changeStatus',
            data: {
                "status": "반려",
                //"status": status,
                "orderCode": orderCode
            },
            dataType : 'json',
            traditional: true,
            success: function (result) {
                //console.log(result);
            }
        });
        setTimeout(function () {
            location.reload();
        },500);
    }

    /* 주문 삭제 */
    function removeOrder(orderCode) {
        $.ajax({
            type: 'POST',
            url: '/order/remove',
            data: { "orderCode": orderCode },
            dataType : 'json',
            traditional: true,
            success: function (result) {
                //console.log(result);
            }
        });
        setTimeout(function () {
            location.reload();
        },500);
    }

</script>
</body>
</html>
