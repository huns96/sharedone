<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>REPORT-전체조회</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%--    <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">--%>
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

        .btn-outline-secondary {

        }
    </style>
</head>
<body>
<%--<div class="container-fluid">--%>
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="container-md" style="width: 80%;">

            <div id="search" class="page-background">
                <form action="work">
            <div class="row">
                <div class="col">




                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px" >
<%--                                <label for="newBuyerCode" class="form-label">주문번호</label>--%>
                                <div class="input-group">
                                    <input name="order_code"  id="orderCode" type="text" size="10" class="form-control orderInfo" placeholder="주문번호" />
                                    <a id="orderCodePopupButton" class="btn btn-outline-secondary">검색</a>
                                </div>
                            </div>


                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px" >
<%--                                <label for="newBuyerCode" class="form-label">바이어코드</label>--%>
                                <div class="input-group">
                                    <input id="newBuyerCode" type="text" size="10" class="form-control orderInfo" name="buyer_code" placeholder="바이어" />
                                    <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                                </div>
                            </div>


                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px" >
                                <%--                                <label for="newBuyerCode" class="form-label">주문번호</label>--%>
                                <div class="input-group">
                                    <input name="adduser"  type="text" size="10" class="form-control orderInfo" placeholder="작성자" />
                                    <a id="adduserPopupButton" class="btn btn-outline-secondary">검색</a>
                                </div>
                            </div>


                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px" >
                                <%--                                <label for="newBuyerCode" class="form-label">주문번호</label>--%>
                                주문상태
                                    <select class="form-select search-input" aria-label="Disabled select example" name="status" id="">
                                        <option value="" selected></option>
                                        <option value="승인대기">승인대기</option>
                                        <option value="승인완료">승인완료</option>
                                        <option value="반려">반려</option>
                                    </select>
                            </div>
                    </div>
            </div>

                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px">
                                <label class="form-label">납품요청일</label>
                                <input id="newRequestDate1" type="date" class="form-control orderInfo" name="request_date" >
                            </div>~
<%--                            <div class="col-md-6 mb-3" style="width:200px !important; float: left; margin-right: 13px">--%>
                                <label class="form-label">    &nbsp;  </label>
                                <input id="newRequestDate2" type="date" class="form-control orderInfo" name="request_date" >
<%--                            </div>--%>



                            <div class="row">
                                <div class="col">

                                    <div  class="page-background">
                                        <form action="" role="search" style="display: flex; height: 40px">
                                            <label class="form-label" style="width: 100px;  margin-top:8px; text-align:center">주문번호</label>
                                            <input class="form-control" type="text" placeholder="10자리" style="width: 240px; text-align:center">

                                            <label class="form-label" style="width: 100px;  margin-top:8px; text-align:center">주문상태</label>
                                            <select class="form-select" style="width: 240px; vertical-align:bottom" aria-label="Disabled select example">
                                                <option selected="" value="승인요청">승인요청</option>
                                                <option value="승인완료">승인완료</option>
                                            </select>
                                            <br>
                                            <button type="submit" style="width: 100px; height: 40px; position: absolute; right:2%; border-radius: 7px;">조회</button>
                                        </form>
                                    </div>
                                </div>
                            </div>








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
                </div>
            </div>


            <div class="row">
                <div class="col">
                    <div id="items" class="contents bottom">
                        <div  class="page-background">
<%--                            <h4>주문현황</h4>--%>
                            <table class="table table-hover" id="ordersTable">
                                <thead>
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
                </div>
            </div>
        </div>
    </div>
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

<%--모달    --%>
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




</div>

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


</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
</body>
</html>
