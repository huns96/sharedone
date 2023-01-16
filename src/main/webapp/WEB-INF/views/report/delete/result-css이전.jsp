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
    <title>Insert title here</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
                                                                                                               integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <%--    <link rel="stylesheet" href="path-to/node_modules/perfect-scrollbar/dist/css/perfect-scrollbar.min.css" />--%>
    <%--    <script src="path-to/node_modules/chart.js/dist/Chart.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="style
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">


    <style>
        body {
            background-color: lightgray;
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

        /*body { background-color: #e0e0e0; }*/
        /*.page-background {*/
        /*    background-color: white;*/
        /*    padding: 10px;*/
        /*    margin: 5px;*/
        /*    border-radius: 5px;*/
        /*}*/

        .hidden_col {
            display: none
        }

        /*tfoot .my_table tfoot {padding-top:17px;padding-bottom:12px;word-spacing:9px;text-align:center;}*/
        /*.my_table tfoot a:link {font-size:12px;color:#4F5B65;}*/
        /*.my_table tfoot a:visited {font-size:12px;color:#4F5B65;}*/
        /*.my_table tfoot a:active {font-size:12px;color:#4F5B65;}*/
        /*.my_table tfoot a:hover {font-size:12px;color:#FA3333;}*/

        a {
            text-decoration: none;
            color: black;
        }
    </style>
</head>
<body>



<c:url value="/report/result" var="orderByUrl">
    <c:param name="order_code" value="${param.order_code }"/>
    <c:param name="buyer_code" value="${param.buyer_code }"/>
    <c:param name="status" value="${param.status }"/>
    <c:param name="adduser" value="${param.adduser }"/>
    <c:param name="from_add_date" value="${param.from_add_date }"/>
    <c:param name="to_add_date" value="${param.to_add_date }"/>
    <c:param name="product_code" value="${param.product_code }"/>
    <div id="orderByUrlParam">

    </div>
</c:url>


<a href="${orderByUrl }" id="orderByUrl">
</a>


<%--<li class="page-item">--%>
<%--    <a href="?order_code=${param.order_code}&buyer_code=${param.buyer_code}&--%>
<%--    status=${param.status}&adduser=${param.adduser}&--%>
<%--    from_add_date=${param.from_add_date}&to_add_date=${param.to_add_date}&product_code=${param.product_code}--%>
<%--              " class="page-link">--%>
<%--        <i class="fa-solid fa-angles-right"></i>--%>
<%--    </a>--%>
<%--</li>--%>

<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="col py-3">
            <h3><a href="result">Report</a></h3>
            <p style="display: none">리포트</p>

            <div class="p-3 mt-3 mb-3" style="background-color: white;">
                <%--                서치바 기호에 맞게--%>

                주문 코드 :
                <form action="work">
                    <input id="orderCodeInput" type="text" name="order_code">
                    <%--                <button id="searchOrderCodeButton"  onclick="searchOrderCode()">검색</button>--%>
                    <button type="button" class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#searchOrderCodeModal" id="modifyReplyButton58">
                        <i class="fa-solid fa-search"></i>
                    </button>
                    <div class="modal fade" id="searchOrderCodeModal" tabindex="-1" aria-labelledby="exampleModalLabel"
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
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    <button type="button" data-bs-dismiss="modal" id="modifyFormModalSubmitButton"
                                            class="btn btn-primary">확인
                                    </button>
                                    <br><br><br><br>

                                </div>
                            </div>
                        </div>
                    </div>

                    바이어:
                    <div class="col-md-6 mb-3">
                        <label for="newBuyerCode" class="form-label">바이어코드</label>
                        <div class="input-group">
                            <input id="newBuyerCode" type="text" size="10" class="form-control orderInfo" name="buyer_code" placeholder="" />
                            <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                        </div>
                    </div>
<%--                    <input type="" name="buyer_code">--%>
<%--                    <button type="button" class="btn btn-light"--%>
<%--                            data-bs-toggle="modal"--%>
<%--                          data-bs-target="#searchOrderCodeModal"--%>
<%--                            id="buyerPopupButton">--%>
<%--                        <i class="fa-solid fa-search"></i>--%>
<%--                    </button>--%>

                    승인여부 : <select name="status" id="">
                    <option value="" selected></option>
                    <option value="승인대기">승인대기</option>
                    <option value="승인완료">승인완료</option>
                    <option value="반려">반려</option>
                </select>
                    작성자 : <input type="text" name="adduser">
                    <button type="button" class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#searchOrderCodeModal" id="modifyReplyButton58">
                        <i class="fa-solid fa-search"></i>
                    </button>

                    <br>
                    요청일: <input type="date" name="from_request_date">~<input type="date" name="to_request_date">
                    작성일: <input type="date" name="from_add_date">~<input type="date" name="to_add_date">
                    제품코드: <input type="text" name="product_code">
                    <button type="button" class="btn btn-light" data-bs-toggle="modal"
                            data-bs-target="#searchOrderCodeModal" id="modifyReplyButton58">
                        <i class="fa-solid fa-search"></i>
                    </button>
                    <input class="btn btn-primary" type="submit" value="조회">

                    <br><br>
                    합계조건 :
                    <input type="radio" name="sumCondition" checked value="i.num"/> 선택안함
                    <input type="radio" name="sumCondition" value="month(h.request_date)"/> 월별
                    <input type="radio" name="sumCondition" value="h.buyer_code"/> 바이어별
                    <input type="radio" name="sumCondition" value="h.adduser"/> 담당자별
                    <input type="radio" name="sumCondition" value="h.status"/> 승인여부별
                    <%--                    <input type="radio" name="sumCondition" value="category" /> 카테고리별--%>


                    <br><br><br>

                    조회 항목 선택 :
                    <input type="checkbox" name="" value="1" id="1" checked>주문코드
                    <input type="checkbox" name="" value="2" id="2">바이어코드
                    <input type="checkbox" name="" value="2" id="3" checked>바이어명
                    <input type="checkbox" name="" value="3" id="4" checked>요청일
                    <input type="checkbox" name="" value="4" id="5" checked>승인여부
                    <input type="checkbox" name="" value="" id="6">승인일
                    <input type="checkbox" name="" value="" id="7">반려일
                    <input type="checkbox" name="" value="" id="8">메모
                    <input type="checkbox" name="" value="" id="9">작성자아이디
                    <input type="checkbox" name="" value="" id="10" checked>작성자명
                    <input type="checkbox" name="" value="" id="11" checked>작성일시
                    <input type="checkbox" name="" value="" id="12">제품코드
                    <input type="checkbox" name="" value="" id="13" checked>제품명
                    <input type="checkbox" name="" value="" id="14" checked>수량
                    <input type="checkbox" name="" value="" id="15" checked>통화
                    <input type="checkbox" name="" value="" id="16" checked>가격


                </form>


            </div>

            <div style=" background-color:white;" class="mb-5">
                <div class="row p-2 justify-content-between">


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
                    <table style="text-align: center" id="ordersTable" class="table table-bordered border border-5">
                        <thead class="table-dark">
                        <tr>
                            <%--                            <th></th>--%>
                            <th id="order_code">&nbsp;주문 코드</th>
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
                                <td>${order.user_name}</td>
                                <td>${order.adddate}</td>
                                <td style="display: none">${order.product_code}</td>
                                <td>${order.product_name}</td>
                                <td>${order.quantity}</td>
                                <td>${order.currency}</td>
                                <td class="row_value"><fmt:formatNumber value="${order.price}" pattern="#,###"/></td>

                            </tr>
                        </c:forEach>
                        </tbody>


                        <%--                    calcSum--%>
                        <tfoot class="my_table tfoot">
                        <tr>
                            <td>합계</td>
                            <%--                            <td>&nbsp;&nbsp;${order.order_code}</td>--%>
                            <td style="display: none">${order.buyer_code}</td>
                            <td></td>
                            <td>${order.request_date}</td>
                            <td>${order.status}</td>
                            <td style="display: none"></td>
                            <td style="display: none"></td>
                            <td style="display: none">${order.memo}</td>
                            <td style="display: none">${order.adduser}</td>
                            <td>${order.user_name}</td>
                            <td>${order.adddate}</td>
                            <td style="display: none">${order.product_code}</td>
                            <td>${order.product_name}</td>
                            <td>${sums.sumQuantity}</td>
                            <td>${order.currency}</td>
                            <%--                        <td class="row_sum"></td>--%>
                            <td class="row_value"><fmt:formatNumber value="${sums.sumPrice}" pattern="#,###"/></td>
                        </tr>
                        </tfoot>

                    </table>


                </div>
            </div>

            <!-- .row>.col -->
            <div class="row">
                <div class="col">
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


                                </c:url>
                                <li class="page-item

					    	<%-- 현재페이지에 active 클래스 추가 --%>
					    	${pageInfo.currentPageNumber eq pageNumber ? 'active' : '' }

					    "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
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
        <%--<table id="testTable">--%>
        <%--    <tbody>--%>
        <%--    <tr>--%>
        <%--        <td>1</td>--%>
        <%--    </tr>--%>
        <%--    <tr>--%>
        <%--        <td>1</td>--%>
        <%--    </tr>--%>
        <%--    </tbody>--%>
        <%--</table>--%>


        <%--<c:set var="orderByUrl" value="홍길동" />--%>


        <%--------------------------------------------------------------------------%>


        <script>


                /* 바이어 검색 팝업창 */
                $('#buyerPopupButton').click(function() {
                    buyerPopup();
                });

            function buyerPopup() {
                let url = "/search/buyerPopup";
                let popupWidth = 600;
                let popupHeight = 500;
                let popupX = (window.screen.width / 2) - (popupWidth / 2);
                let popupY= (window.screen.height / 2) - (popupHeight / 2);
                let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
                window.open(url,"",popupOption);
            }


            if ('${message}' != '')
                alert('${message}');


            // $(document).ready(function() {
            //     $("input[type='checkbox']").click(function() {
            //          let v1 =parseInt($(this).each(getCheckboxValue())) ;
            //         console.log($(this).id.val())
            //
            //         $('td:nth-child('+v1+'),th:nth-child('+v1+')').toggle();
            //     });
            // });
            //
            //


            //
            // $(document).ready(function () {
            //     $(".row_sum").each(function () {
            //         var $this = $(this);
            //         var sum_value = 0;
            //         $(".row_value",$(this).closest('tr')).each(function (e) {
            //             sum_value+=parseInt($(e).text());
            //         })
            //         $this.text(sum_value);
            //     })
            // })

            // $(document).ready(
            //     function calcSum() {
            //     // table element 찾기
            //     const table = document.getElementById('testTable');
            //     console.log(table)
            //     // 합계 계산
            //     let sumPrice = 0;
            //     for(let i = 0; i < table.rows.length; i++)  {
            //         sumPrice += parseInt(table.rows[i].cells[0].innerHTML);
            //     }
            //     document.querySelector('.row_sum').innerHTML=sumPrice.toString();
            //         console.log(sumPrice)}
            // )


            $(document).ready(function () {
                $('#1').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#2').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#3').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#4').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#5').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#6').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#7').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#8').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#9').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#10').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#11').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#12').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#13').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#14').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#15').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })
                $('#16').change(function () {
                    $('td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
                })

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


            // $("input[type='checkbox']").click(function() {
            //     var index = $(this).attr('name').substr(2);
            //     $('table tr').each(function() {
            //         $('td:eq(' + index + ')',this).toggle();
            //     });
            // });

            <%--$('th').click(function(){--%>
            <%--    const orderByClick=$(this).attr("id");--%>
            <%--     alert(orderByClick);--%>
            <%--     document.querySelector('#orderByUrlParam').innerHTML=`<c:param name="orderBy"  value="\${orderByClick}" />`;--%>
            <%--    // const orderBy= new URLSearchParams(orderByClick).toString();--%>

            <%--    &lt;%&ndash;$.get(${orderByUrl});&ndash;%&gt;--%>
            <%--    $('#orderByUrl').submit();--%>
            <%--});--%>


            // document.querySelector('#order_code_check').addEventListener()
            // function myFunction() {
            //     var checkedList = document.querySelector(addEventListener(getCheckboxValue()))
            //     var element = document.getElementById("checkedList");
            //     element.classList.add("hidden_col");
            // }


            // CheckBox 검사

            // function getNumber(Event){
            //     let result = '';
            //     if(Event.target.checked)  {
            //         result = Event.target.value;
            //         console.log(result)
            //         $('td:nth-child('+result+'),th:nth-child('+result+')').toggle();
            //     }}


            // $("input[type=checkbox]").click(getCheckboxValue(event));
            //
            //
            //  $("input[type='checkbox']").click().$('td:nth-child('+this.val()+'),th:nth-child('+this.val()+')').toggle();


            // $(window).load(function(){
            //     // 실행할 내용
            // });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
                crossorigin="anonymous"></script>
</body>
</html>









