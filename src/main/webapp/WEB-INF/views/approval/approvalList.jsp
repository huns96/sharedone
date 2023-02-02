<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>오더 승인</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%--    <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">--%>
    <style>
        body { background-color: #e0e0e0; }
        .container-md { width: 85%;
            padding-top: 30px; }
        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }
        #order-list { height: 510px }
        #item-list, #commentDiv { height: 350px; }
        h5 {
            font-weight: bold;
            margin: 5px 0 20px 20px;
        }
        h6 { margin-bottom: 20px; }
        table { text-align: center }
        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }
        /*#order-table, #itemList-table { margin-top: 20px; }*/
        .totalNum {
            float: right;
            margin-right: 20px;
        }
        #totalInfo {
            float: right;
            margin-right: 20px;
            font-weight: bold;
        }
        .itemtableDiv {
            height: 240px;
            overflow: auto;
        }
        .fixedHeader {
            position: sticky;
            top: 0;
            background-color: white /*!important;*/;
        }

        #search { height: 60px; }
        .search-label {
            width: 80px;  margin:8px 8px 0 0; text-align:right; font-weight: bold;
        }
        .search-select {
            width: 90px;  text-align:center; margin-left: 20px;
        }
        .search-input {
            width: 120px; /*text-align:center*/
        }
        .search-btn {
            height: 40px;
        }
        .input-group {
            width: 210px;
        }
        #commentDiv { padding: 15px;}
        #buttonDiv { margin-left: 30px; }

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
                        <form action="${pageContext.request.contextPath}/approval/approvalList" role="search" style="display: flex;" >
                            <label class="form-label search-label">주문번호</label>
                            <input id="orderCode" class="form-control search-input" type="text" name="orderCode" value="${param.orderCode}">

                            <label class="form-label search-label">바이어명</label>
                            <div class="input-group">
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
                                <option value="승인반려" ${param.status == '승인반려' ? 'selected' : '' }>승인반려</option>
                                <option value="종결" ${param.status == '종결' ? 'selected' : '' }>종결</option>
                            </select>

                            <label class="form-label search-label">작성자</label>
                            <div class="input-group">
                                <%--<input id="userName" class="form-control search-input" type="text" name="userName" value="${param.userName}" placeholder="멤버코드 검색" readonly>
                                <input id="userId" class="form-control search-input" type="hidden" name="userId" value="${param.userId}">--%>
                                <input id="userId" class="form-control search-input" type="text" name="userId" value="${param.userId}" placeholder="멤버코드 검색" readonly>
                                <a id="memberPopupButton" class="btn btn-outline-secondary">검색</a>
                            </div>

                            <div id="buttonDiv">
                                <button id="search-btn" class="btn btn-dark search-btn" type="submit" <%--onclick="setSearchValue(${param.orderCode},${param.buyerCode},${param.status},${param.userId})"--%>>검색</button>
                                <button id="reset-btn" class="btn btn-secondary search-btn" type="button">초기화</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col">
                    <div id="orders" class="contents top">
                        <div id="order-list" class="page-background">
                            <h5>주문 승인 목록
                            </h5>
                            <div style="height: 400px;">
                                <table class="table table-hover" id="order-table">
                                    <thead>
                                    <tr style="border-bottom: black; background-color: #e0e0e0;">
                                        <%--                                        <th>#</th>--%>
                                        <th>주문번호</th>
                                        <th>바이어명</th>
                                        <th>주문일자</th>
                                        <th>납품요청일자</th>
                                        <th>승인일자</th>
                                        <th>반려일자</th>
                                        <th>상태</th>
                                        <th>등록자</th>
                                        <th>수정자</th>
                                        <th>승인/반려</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${approvalList}" var="order" varStatus="status">
                                        <tr>
                                                <%--                                                <td>${order.num}</td>--%>
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
                                                <c:if test="${order.status == '승인완료'}">

                                                </c:if>
                                                    <%--  <div class="modal fade" id="cancelModal${order.num}" tabindex="-1" aria-hidden="true">
                                                          <div class="modal-dialog">
                                                              <div class="modal-content">
                                                                  <div class="modal-header">
                                                                      <h1 class="modal-title fs-5">승인 취소</h1>
                                                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                  </div>
                                                                  <div class="modal-body">
                                                                      <form id="cancelForm" action="/approval/cancel" method="post">
                                                                          <input type="hidden" name="num" value="${order.num}">
                                                                          <label class="form-label">취소 사유</label>
                                                                          <br>
                                                                          <textarea rows="5" class="form-control" name="comment"></textarea>
                                                                          취소하시겠습니까?
                                                                  </div>
                                                                  <div class="modal-footer">
                                                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                                                      <button id="cancelConfirmButton" class="btn btn-success" type="submit">확인</button>
                                                                  </div>
                                                                  </form>

                                                              </div>
                                                          </div>
                                                      </div>--%>


                                                <c:if test="${order.status == '승인요청'}">
                                                    <div class="btn-group" style="width: 100%">
                                                        <button type="button" class="btn btn-outline-primary btn-sm" data-bs-toggle="modal" data-bs-target="#approvalModal${order.num}">승인완료</button>
                                                        <button type="button" class="btn btn-outline-danger btn-sm" data-bs-toggle="modal" data-bs-target="#returnModal${order.num}">승인반려</button>
                                                    </div>
                                                </c:if>
                                                <div class="modal fade" id="returnModal${order.num}" tabindex="-1" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5">승인 확인</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form id="returnForm" action="${pageContext.request.contextPath}/approval/returnModify" method="post">
                                                                    <input type="hidden" name="num" value="${order.num}">
                                                                    <label class="form-label">반려사유</label>
                                                                    <textarea rows="5" class="form-control" name="comment"></textarea>
                                                                    반려하시겠습니까?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                                                <button id="returnConfirmButton" class="btn btn-success" type="submit">확인</button>
                                                            </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="modal fade" id="approvalModal${order.num}" tabindex="-1" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5">승인 확인</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                <form id="approvalForm" action="${pageContext.request.contextPath}/approval/approvalModify" method="post">
                                                                    <input type="hidden" name="num" value="${order.num}">
                                                                    <label class="form-label">승인 Comment</label>
                                                                    <br>
                                                                    <textarea rows="5" class="form-control" name="comment"></textarea>
                                                                    승인하시겠습니까?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                                                <button id="approvalConfirmButton" class="btn btn-success" type="submit">확인</button>
                                                            </div>
                                                            </form>

                                                        </div>
                                                    </div>
                                                </div>


                                            </td>
                                            <td style="display:none;">${order.memo}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <c:if test="${total != null && total != ''}">
                                <div class="totalNum"><b>총 ${total}건</b></div>
                            </c:if>

                            <%--페이지네이션--%>
                            <div class="row justify-content-center">
                                <div class="col-3">
                                    <nav aria-label="Page navigation example">
                                        <ul class="pagination pagination-sm">
                                            <li class="page-item">
                                                <c:url value="/approval/approvalList" var="pageLink">
                                                    <c:param name="orderCode" value="${param.orderCode }" />
                                                    <c:param name="buyerCode" value="${param.buyerCode }" />
                                                    <c:param name="status" value="${param.status }" />
                                                    <c:param name="userId" value="${param.userId }" />
                                                </c:url>
                                                <a class="page-link" href="${pageLink}&page=1" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                </a>
                                            </li>
                                            <c:forEach begin="1" end="${pages}" varStatus="status" var="pageNumb">
                                                <li class="page-item  ${pageNum == pageNumb ? "active" : ""}">
                                                    <a class="page-link" href="${pageLink }&page=${pageNumb}">${pageNumb }</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item">
                                                <a class="page-link" href="${pageLink }&page=${pages}" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-9">
                    <div id="items" class="contents bottom">
                        <div id="item-list" class="page-background">
                            <h5>주문 상품 목록</h5>
                            <div class="itemtableDiv">
                                <table class="table table-hover" id="itemList-table">
                                    <thead>
                                    <tr style="background-color: #e0e0e0; border-bottom: black;">
                                        <th class="fixedHeader">#</th>
                                        <th class="fixedHeader">상품번호</th>
                                        <th class="fixedHeader">상품명</th>
                                        <th class="fixedHeader">수량</th>
                                        <th class="fixedHeader">단가</th>
                                        <th class="fixedHeader">총금액</th>
                                        <th class="fixedHeader">기존단가</th>
                                        <th class="fixedHeader">등록자</th>
                                        <th class="fixedHeader">수정자</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                            <div id="totalInfo"></div>
                        </div>
                    </div>
                </div>
                <div class="col-3">
                    <div id="commentDiv" class="page-background">
                        <h6><b>주문 메모</b></h6>
                        <textarea rows="10" id="memo" class="form-control orderInfo" name="memo" readonly>

                    </textarea>
                    </div>
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
    $('#order-table tr').dblclick(function() {
        let tr = $(this);
        let td = tr.children();
        let orderCode = td.eq(0).text();
        let requestDate = td.eq(3).text();
        itemListByOrderCode(orderCode, requestDate.replaceAll("-", ""));

        // 승인/반려 메모
        let memo = td.eq(10).text();
        $('#memo').empty();
        $('#memo').append(memo);

        // 선택한 주문 정보 폰트 두껍게
        $('#order-table tbody tr').attr("style", "font-weight: regular;");
        tr.attr("style", "font-weight: bold;");
    });

    /* 검색 초기화 */
    $('#reset-btn').click(function() {
        $('#orderCode').val("");
        $('#buyerCode').val("");
        $('#buyerName').val("");
        $('#status').val("");
        $('#userId').val("");
        $('#search-btn').click();
    });

    /* 주문번호별 상품 조회 */
    function itemListByOrderCode(orderCode, requestDate) {
        let tbody = $('#itemList-table tbody');
        tbody.empty(); //초기화
        tbody.append("");

        setTimeout(function () {
            $.ajax({
                type: 'POST',
                url: '${pageContext.request.contextPath}/approval/itemList',
                data: {
                    "orderCode": orderCode,
                    "requestDate": requestDate
                },
                dataType : 'json',
                traditional: true,
                success: function (result) {
                    console.log(result);
                    let totalPrice = 0;
                    let totalNum = 0;
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
                        totalPrice += parseInt(total_price);
                        totalNum++;

                        if (upduser == null) upduser = "";

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

                    $('#totalInfo').empty();
                    $('#totalInfo').append("총 " + totalNum + "건  /  총 " + totalPrice.toLocaleString() + "원");
                }
            });
        }, 100);
    }

</script>
</body>
</html>