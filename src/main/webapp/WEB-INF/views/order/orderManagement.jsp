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
    <%--<script type="text/javascript" src="order.js" ></script>--%>

</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
    <div class="container-md">
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
                        <button class="btn btn-danger" style="float: right"
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
                        <table class="table table-hover" id="itemlist-table">
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
    <div class="modal fade" id="newOrder" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
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
                                    <button id="buyerPopup" class="btn btn-outline-secondary" type="button">검색</button>
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
                                <button class="btn btn-danger">초기화</button>
                                <button class="btn btn-danger">상품등록</button>
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
                    <button type="button" class="btn btn-danger">주문등록</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">바이어 검색</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    ...
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary">확인</button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                </div>
            </div>
        </div>
    </div>

    </div></div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script type="text/javascript">
        $(function () {
            /* 주문 상품 조회 */
            $('#order-table tr').dblclick(function () {
                // [TODO] 테이블 초기화

                $('#itemlist-table tbody').append("");
                let tr = $(this);
                let td = tr.children();
                let orderCode = td.eq(1).text();
                console.log(orderCode);

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

                            $('#itemlist-table tbody').append(
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
            });

            $('#newOrderDate').set(new Date());
            $('#newRequestDate')
                .datepicker({
                    format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                    startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
                    endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
                    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                    calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
                    clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                    //datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
                    //daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
                    //daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
                    //disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                    immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
                    multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
                    multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
                    templates: {
                        leftArrow: '&laquo;',
                        rightArrow: '&raquo;',
                    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                    showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
                    title: '테스트', //캘린더 상단에 보여주는 타이틀
                    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                    toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
                    weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
                    language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                })
                .on('changeDate', function (e) {
                    /* 이벤트의 종류 */
                    //show : datePicker가 보이는 순간 호출
                    //hide : datePicker가 숨겨지는 순간 호출
                    //clearDate: clear 버튼 누르면 호출
                    //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                    //changeMonth : 월이 변경되면 호출
                    //changeYear : 년이 변경되는 호출
                    //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

                    console.log(e);
                    // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
                });
        });

        /* 새 주문 등록 */
        function addNewOrder() {
            // $.ajax({
            //     type: 'POST',
            //     url: '/order/register',
            //     data: {"orderCode": orderCode},
            //     success: function (result) {
            //         console.log(result);
            //         for (var i = 0; i < result.length; i++) {
            //             let index = i + 1;
            //             let product_code = result[i].product_code;
            //             let product_name = result[i].product_name;
            //             let quantity = result[i].quantity;
            //             let price = result[i].price;
            //             let total_price = result[i].total_price;
            //             let old_price = result[i].old_price;
            //             let adduser = result[i].adduser;
            //             let upduser = result[i].upduser;
            //             let order_code = result[i].order_code;
            //             let buyer_name = result[i].buyer_name;
            //             //let updateButton = updateButton;
            //
            //             $('#itemlist-table tbody').append(
            //                 "<tr>"
            //                 + "<td>" + index + "</td>"
            //                 + "<td>" + product_code + "</td>"
            //                 + "<td>" + product_name + "</td>"
            //                 + "<td>" + quantity + "</td>"
            //                 + "<td>" + price + "</td>"
            //                 + "<td>" + total_price + "</td>"
            //                 + "<td>" + old_price + "</td>"
            //                 + "<td>" + adduser + "</td>"
            //                 + "<td>" + upduser + "</td>"
            //                 + "<td>" + order_code + "</td>"
            //                 + "<td>" + buyer_name + "</td>"
            //                 + "<td>수정버튼</td>"
            //                 + "</tr>"
            //             );
            //         }
            //     }
            // });

        }


    </script>
</body>
</html>
