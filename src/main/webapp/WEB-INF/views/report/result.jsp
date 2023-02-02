<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>아이템라인별 리포트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    <link rel="stylesheet" href="path-to/node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />--%>
    <%--    <script src="path-to/node_modules/chart.js/dist/Chart.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>


    <style>
        body {
            background-color: #e0e0e0;
        }

        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }

        .top {
            height: 40%;
        }

        h4 {
            font-weight: bold;
            margin-left: 20px;
        }

        .search-btn {
            width: 80px;
            float: right;
        }

        tr > .table-head {
            text-align: center;
            background-color: lightgray;
        }

        tbody .row-head {
            text-align: center;
        }

        tr > .td-body {
            text-align: center;
        }

        .hidden_col {
            display: none
        }

        a {
            text-decoration: none;
            color: black;
        }

        .col-md-6 {
            width: 320px;
            float: left;
            margin-right: 13px;

        }

        .input-group {
            width: 350px;
            float: left;
            margin-right: 13px;
            margin-top: 6px;
        }

        #inputLabel {
            width: 10px !important;
        }

        tfoot {
            text-emphasis: black;
        }

        .input-group2 {
            width: 420px;
            float: left;
            margin-right: 13px;
            margin-top: 10px;
        }

        input.form-control {
            background-color: rgba(187, 187, 189, 0.17)
        }

        select.form-select {
            background-color: rgba(187, 187, 189, 0.17)
        }
    </style>
</head>
<body>


<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="col" style="width: 80%; margin-right: 40px; margin-left: 40px; margin-top: 40px;">

            <my:reportSearch></my:reportSearch>

            <div class="row">
                <div class="col">
                    <div id="orders" class="contents top">
                        <div id="order-list" class="page-background">

                            <table style="text-align: left">

                                <tr>
                                    <td><b>&nbsp; 조회항목 선택 &nbsp; </b>&nbsp;</td>
                                    <td>&nbsp;&nbsp;<input type="checkbox" name="" value="1" id="1" autocomplete="on"
                                                           checked>주문번호&nbsp;&nbsp;
                                    </td>
                                    <td><input type="checkbox" name="" value="2" id="2" autocomplete="on">바이어코드</td>
                                    <td><input type="checkbox" name="" value="2" id="3" checked>바이어명</td>
                                    <td><input type="checkbox" name="" value="3" id="4" checked>요청일&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="4" id="5" checked>승인여부&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="6">승인일&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="7">반려일&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="8">메모&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="9">작성자아이디&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="10" checked>작성자명&nbsp;&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;&nbsp;<input type="checkbox" name="" value="" id="11" checked>작성일시</td>
                                    <td><input type="checkbox" name="" value="" id="12">수정자아이디</td>
                                    <td><input type="checkbox" name="" value="" id="13">수정자명&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="14">수정일시&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="15">승인/반려 메모&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="16">제품코드&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="17" checked>제품명&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="18" checked>수량&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="19" checked>통화&nbsp;&nbsp;</td>
                                    <td><input type="checkbox" name="" value="" id="20" checked>가격&nbsp;&nbsp;</td>
                                </tr>

                            </table>

                            <hr>
                            <p>&nbsp;&nbsp;&nbsp;총 ${orderCount}건

                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                요청일: ${from_request_date}~${to_request_date} &nbsp;&nbsp;/ &nbsp;&nbsp;
                                작성일:${from_add_date}~${to_add_date}</p>
                            <hr>
                            <%--                        <div style="overflow: scroll; width: 100%; height: 390px; padding: 10px;">--%>
                            <table style="text-align: center" id="ordersTable" class="table table-hover">
                                <thead>
                                <tr style="border-bottom: black; background-color: #e0e0e0;">
                                    <%--                            <th></th>--%>
                                    <th id="order_code">&nbsp;주문번호</th>
                                    <th style="display: none" id="buyer_code">바이어 코드</th>
                                    <th>바이어명</th>
                                    <th>요청일</th>
                                    <th id="status">승인여부</th>
                                    <th id="approval_date" style="display: none">승인일</th>
                                    <th id="return_date" style="display: none">반려일</th>
                                    <th id="memo" style="display: none">메모</th>
                                    <th id="adduser" style="display: none">작성자 아이디</th>
                                    <th>작성자명</th>
                                    <th id="adddate">작성일시</th>
                                    <th style="display: none">수정자 아이디</th>
                                    <th style="display: none">수정자명</th>
                                    <th style="display: none">수정일시</th>
                                    <th style="display: none">승인/반려 메모</th>
                                    <th id="product_code" style="display: none">제품 코드</th>
                                    <th>제품명</th>
                                    <th id="quantity">수량</th>
                                    <th id="currency">통화</th>
                                    <th id="price">가격</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${orders}" var="order" varStatus="status">
                                    <tr>
                                            <%--<td>${status.index+1}</td>--%>
                                        <td>&nbsp;&nbsp;${order.order_code}</td>
                                        <td style="display: none">${order.buyer_code} </td>
                                        <td>${order.buyer_name}</td>
                                        <td><fmt:formatDate value="${order.request_date}" pattern="yyyy-MM-dd"/></td>
                                        <td>${order.status}</td>
                                        <td style="display: none"></td>
                                        <td style="display: none"></td>
                                        <td style="display: none">${order.memo}</td>
                                        <td style="display: none">${order.adduser}</td>
                                        <td>${order.adduser_name}</td>
                                        <td>${order.adddate}</td>
                                        <td style="display: none">${order.upduser}</td>
                                        <td style="display: none">${order.upduser_name}</td>
                                        <td style="display: none">${order.upddate}</td>
                                        <td style="display: none">${order.comment}</td>
                                        <td style="display: none">${order.product_code}</td>
                                        <td>${order.product_name}</td>
                                        <td>${order.quantity}</td>
                                        <td>${order.currency}</td>


                                        <td class="row_value"><fmt:formatNumber value="${order.price}"
                                                                                pattern="#,###"/></td>

                                    </tr>
                                </c:forEach>
                                </tbody>


                                <%--                    calcSum--%>
                                <tfoot class="my_table tfoot">

                                <tr>
                                    <td><b>합계</b></td>
                                    <%--                            <td>&nbsp;&nbsp;${order.order_code}</td>--%>
                                    <td style="display: none">${order.buyer_code}</td>
                                    <td></td>
                                    <td>${order.request_date}</td>
                                    <td>${order.status}</td>
                                    <td style="display: none"></td>
                                    <td style="display: none"></td>
                                    <td style="display: none">${order.memo}</td>
                                    <td style="display: none">${order.adduser}</td>
                                    <td>${order.adduser_name}</td>
                                    <td>${order.adddate}</td>
                                    <td style="display: none">${order.upduser}</td>
                                    <td style="display: none">${order.upduser_name}</td>
                                    <td style="display: none">${order.upddate}</td>

                                    <td style="display: none">${order.comment}</td>

                                    <td style="display: none">${order.product_code}</td>
                                    <td>${order.product_name}</td>
                                    <td><b>${sums.sumQuantity}</b></td>
                                    <td>${order.currency}</td>
                                    <%--                        <td class="row_sum"></td>--%>
                                    <td class="row_value"><b> <fmt:formatNumber value="${sums.sumPrice}"
                                                                                pattern="#,###"/></b></td>
                                </tr>
                                </tfoot>

                            </table>
                            <%--                        </div>--%>
                            <nav class="mt-3" aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">

                                    <%-- 맨앞 버튼은 1페이지가 아니면 존재함 --%>
                                    <c:if test="${pageInfo.currentPageNumber ne 1 }">
                                        <c:url value="/report/work" var="listLink">
                                            <c:param name="page" value="1"/>
                                            <c:param name="order_code" value="${param.order_code }"/>
                                            <c:param name="buyer_code" value="${param.buyer_code }"/>
                                            <c:param name="status" value="${param.status }"/>
                                            <c:param name="adduser" value="${param.adduser }"/>
                                            <c:param name="from_add_date" value="${param.from_add_date }"/>
                                            <c:param name="to_add_date" value="${param.to_add_date }"/>
                                            <c:param name="from_request_date" value="${param.from_request_date }"/>
                                            <c:param name="to_request_date" value="${param.to_request_date }"/>
                                            <c:param name="product_code" value="${param.product_code }"/>
                                            <c:param name="product_name" value="${param.product_name }"/>
                                            <c:param name="adduser_name" value="${param.adduser_name }"/>
                                            <c:param name="buyer_name" value="${param.buyer_name }"/>
                                        </c:url>
                                        <!-- li.page-item>a.page-link{맨앞버튼} -->
                                        <li class="page-item">
                                            <a href="${listLink }" class="page-link">
                                                <i class="fa-solid fa-angles-left"></i>
                                            </a>
                                        </li>
                                    </c:if>

                                    <c:if test="${pageInfo.hasPrevButton }">
                                        <c:url value="/report/work" var="listLink">
                                            <c:param name="page" value="${pageInfo.jumpPrevPageNumber }"></c:param>
                                        </c:url>
                                        <li class="page-item">
                                            <a href="${listLink }" class="page-link">
                                                <i class="fa-solid fa-angle-left"></i>
                                            </a>
                                        </li>
                                    </c:if>


                                    <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }"
                                               var="pageNumber">
                                        <c:url value="/report/work" var="listLink">
                                            <c:param name="order_code" value="${param.order_code }"/>
                                            <c:param name="buyer_code" value="${param.buyer_code }"/>
                                            <c:param name="status" value="${param.status }"/>
                                            <c:param name="adduser" value="${param.adduser }"/>
                                            <c:param name="from_add_date" value="${param.from_add_date }"/>
                                            <c:param name="to_add_date" value="${param.to_add_date }"/>
                                            <c:param name="from_request_date" value="${param.from_request_date }"/>
                                            <c:param name="to_request_date" value="${param.to_request_date }"/>
                                            <c:param name="product_code" value="${param.product_code }"/>
                                            <c:param name="page" value="${pageNumber }"/>
                                            <c:param name="product_name" value="${param.product_name }"/>
                                            <c:param name="adduser_name" value="${param.adduser_name }"/>
                                            <c:param name="buyer_name" value="${param.buyer_name }"/>


                                        </c:url>
                                        <li class="page-item

                      <%-- 현재페이지에 active 클래스 추가 --%>
                      ${pageInfo.currentPageNumber eq pageNumber ? 'active' : '' }

                "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
                                        <%--                            "><a class="page-link" href='javascript:void(0);'onclick="searchOrders();">${pageNumber }</a></li>--%>
                                    </c:forEach>

                                    <c:if test="${pageInfo.hasNextButton }">
                                        <c:url value="/report/work" var="listLink">
                                            <c:param name="page" value="${pageInfo.jumpNextPageNumber }"></c:param>
                                            <c:param name="order_code" value="${param.order_code }"/>
                                            <c:param name="buyer_code" value="${param.buyer_code }"/>
                                            <c:param name="status" value="${param.status }"/>
                                            <c:param name="adduser" value="${param.adduser }"/>
                                            <c:param name="from_add_date" value="${param.from_add_date }"/>
                                            <c:param name="to_add_date" value="${param.to_add_date }"/>
                                            <c:param name="from_request_date" value="${param.from_request_date }"/>
                                            <c:param name="to_request_date" value="${param.to_request_date }"/>
                                            <c:param name="product_code" value="${param.product_code }"/>
                                            <c:param name="product_name" value="${param.product_name }"/>
                                            <c:param name="adduser_name" value="${param.adduser_name }"/>
                                            <c:param name="buyer_name" value="${param.buyer_name }"/>
                                        </c:url>
                                        <li class="page-item">
                                            <a href="${listLink }" class="page-link">
                                                <i class="fa-solid fa-angle-right"></i>
                                            </a>
                                        </li>
                                    </c:if>


                                    <c:if test="${pageInfo.currentPageNumber ne pageInfo.lastPageNumber }">
                                        <c:url value="/report/work" var="listLink">
                                            <c:param value="${pageInfo.lastPageNumber }" name="page"/>
                                            <c:param name="order_code" value="${param.order_code }"/>
                                            <c:param name="buyer_code" value="${param.buyer_code }"/>
                                            <c:param name="status" value="${param.status }"/>
                                            <c:param name="adduser" value="${param.adduser }"/>
                                            <c:param name="from_add_date" value="${param.from_add_date }"/>
                                            <c:param name="to_add_date" value="${param.to_add_date }"/>
                                            <c:param name="from_request_date" value="${param.from_request_date }"/>
                                            <c:param name="to_request_date" value="${param.to_request_date }"/>
                                            <c:param name="product_code" value="${param.product_code }"/>
                                            <c:param name="product_name" value="${param.product_name }"/>
                                            <c:param name="adduser_name" value="${param.adduser_name }"/>
                                            <c:param name="buyer_name" value="${param.buyer_name }"/>
                                        </c:url>
                                        <!-- li.page-item>a.page-link{맨뒤버튼} -->
                                        <li class="page-item">
                                            <a href="${listLink }" class="page-link">
                                                <i class="fa-solid fa-angles-right"></i>
                                            </a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="searchOrderCodeModal" tabindex="-1"
     aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">검색창 팝업</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>

            <div class="modal-body">
                <input type="text" id="inputOrderCode" style="float: left">
                <button type="button" class="fa-solid fa-search" style="float: left"
                        onclick="searchOrderCode()"></button>
                <br><br><br><br>

                <div id="orderCodes"></div>
            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기
                </button>
                <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton"
                        class="btn btn-primary">확인
                </button>
                <br><br><br><br>

            </div>
        </div>
    </div>
</div>
<script>


    $(document).ready(function () {
        /* 탭 클릭 */
        $('.anchor_tab li a').on('click', function () {
            var anchorId = $(this).attr('data-anchor');
            // 스크롤 이동
            scroll_to_anchor_tab(anchorId);
        });
    });

    // 탭 이동 - 부드러운 스크롤
    function scroll_to_anchor_tab(anchor_id, speed) {
        if (!speed) var speed = 'slow';
        var a_tag = $("#" + anchor_id);
        if (a_tag.length > 0) {
            $('html, body').animate({
                scrollTop: a_tag.offset().top - $('').height() - $('').height() // 상단에 특정 위치를 제외하고 스크롤할때 해당 이름 작성
            }, speed);
        }
    }


    $(document).ready(function () {
        let sumCondition = '${searchOrders.sumCondition}';
        let radioId
        let status = '${searchOrders.status}'
        if (sumCondition === 'year(h.request_date)') {
            radioId = 'sumCondition_year'
        }
        if (sumCondition === 'quarter(h.request_date)') {
            radioId = 'sumCondition_quarter'
        }
        if (sumCondition === 'month(h.request_date)') {
            radioId = 'sumCondition_month'
        }
        if (sumCondition === 'week(h.request_date)') {
            radioId = 'sumCondition_week'
        }
        if (sumCondition === 'b.name') {
            radioId = 'sumCondition_buyer'
        }
        if (sumCondition === 'addm.name') {
            radioId = 'sumCondition_addm'
        }
        if (sumCondition === 'h.status') {
            radioId = 'sumCondition_status'
        }
        $('#' + radioId).prop("checked", true);
        console.log(radioId + ' : radioId')
    })


    window.setBuyerInfo = function (buyerCode, buyerName) {
        $('#setBuyerCode').val(buyerCode);
        $('#setBuyerName').val(buyerName);
    }

    window.setProduct = function (productCode, productName) {
        $('#setProductCode').val(productCode);
        $('#setProductName').val(productName);
    }
    window.setMemberInfo = function (adduserId, adduserName) {
        $('#setAdduserId').val(adduserId);
        $('#setAdduserName').val(adduserName);
    }

    $('#buyerPopupButton').click(function () {
        buyerPopup();
    });

    $('#productPopupButton').click(function () {
        productPopup();
    });
    $('#memberPopupButton').click(function () {
        memberPopup();
    });

    function productPopup() {
        let url = "/report/productPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }


    function buyerPopup() {
        let url = "/search/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }

    function memberPopup() {
        let url = "/search/memberPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }


    if ('${message}' != '')
        alert('${message}');


    $(document).ready(function () {
        for (var i = 1; i < 21; i++) {
            $('#' + i).change(function () {
                $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
            })
        }
    })


    $(document).ready(function () {
        $('#ordersTable th').each(function (column) {
            $(this).click(function () {
                if ($(this).is('.asc')) {
                    $(this).removeClass('asc');
                    $(this).addClass('desc');
                    sortdir = -1;

                } else {
                    $(this).addClass('asc');
                    $(this).removeClass('desc');
                    sortdir = 1;
                }

                $(this).siblings().removeClass('asc');
                $(this).siblings().removeClass('desc');

                var rec = $('#ordersTable').find('tbody>tr').get();
                console.log(rec)
                console.log()
                rec.sort(function (a, b) {
                    var val1 = $(a).children('td').eq(column).text().toUpperCase();
                    var val2 = $(b).children('td').eq(column).text().toUpperCase();
                    return (val1 < val2) ? -sortdir : (val1 > val2) ? sortdir : 0;
                });

                $.each(rec, function (index, row) {
                    $('#ordersTable tbody ').append(row);
                });
            });
        });
    });


    function searchOrderCode() {
        console.log("jsp 서치오더코드")
        // const boardId = document.querySelector("#boardId").value;
        const partOfOrderCode = document.querySelector("#inputOrderCode").value;
        console.log(partOfOrderCode)

        // console.log(data) 인풋데이터 받아짐
        fetch("${pageContext.request.contextPath}/report/search/order_code", {
            method: "post",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(partOfOrderCode)
        })
            .then(res => res.json())
            .then(
                function (변수2) {
                    console.log(변수2);
                    for (const i of 변수2) {
                        console.log(i)
                        const orderCodesData = `<input type="checkbox" name="order_code" value="\${i}">`
                        console.log(orderCodesData)
                        document.querySelector("#orderCodes").innerHTML = orderCodesData;
                    }
                })
    }


</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
<script>

    function searchOrders() {
        let listLink = "${listLink}"
        fetch(listLink, {
            method: "post",
        }).then(response => {
            return response.json();

        }).then(data => {

        })
    }
</script>

</body>
</html>








