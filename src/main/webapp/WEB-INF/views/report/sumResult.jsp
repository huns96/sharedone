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
    <title>합계리포트</title>
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
        <div class="col" style="width: 80%; margin-left: 40px; margin-right: 40px;margin-top: 40px">

            <my:reportSearch></my:reportSearch>

            <div class="row">
                <div class="col">
                    <div id="orders" class="contents top">
                        <%--                    <div class="col page-background" style="margin-left: 40px; margin-right: 40px">--%>
                        <div id="order-list" class="page-background">

                            <p>&nbsp;&nbsp;&nbsp;총 ${orderGroupCount}건

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
                            <table style="text-align: center" class="table table-hover">
                                <thead>
                                <tr style="border-bottom: black; background-color: #e0e0e0;">
                                    <%--                            <th></th>--%>
                                    <th id="order_code">&nbsp;${groupName}</th>
                                    <th id="buyer_code">제품 수량 합계</th>
                                    <th>가격 합계</th>

                                </tr>
                                </thead>
                                <tbody>

                                <c:forEach items="${orderGroups}" var="orderGroup" varStatus="status">
                                    <tr>
                                            <%--                                <td>${status.index+1}</td>--%>
                                        <td id="groupNameButton"><a href="javascript:doDisplay();">
                                            &nbsp;&nbsp;${orderGroup.groupName}</a></td>
                                        <td>${orderGroup.sumQuantity}</td>
                                            <%--                                <td>${orderGroup.sumPrice}</td>--%>
                                        <td class="row_value"><fmt:formatNumber value="${orderGroup.sumPrice}"
                                                                                pattern="#,###"/></td>


                                    </tr>
                                </c:forEach>
                                </tbody>


                                <%--                    calcSum--%>
                                <tfoot class="my_table tfoot">
                                <tr>
                                    <td><b>합계</b></td>

                                    <td><b>${sums.sumQuantity}</b></td>
                                    <%--                            <td>${order.currency}</td>--%>
                                    <%--                        <td class="row_sum"></td>--%>
                                    <td class="row_value"><b><fmt:formatNumber value="${sums.sumPrice}"
                                                                               pattern="#,###"/></b></td>
                                </tr>
                                </tfoot>

                            </table>
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
</body>
</html>








