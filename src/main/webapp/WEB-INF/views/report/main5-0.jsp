<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%--<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>--%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Insert title here</title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
            crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>


    <style>


    </style>
</head>


<body>


<br>
<br>
<br>

<div class="container-md">
    <div class="row">
        <div class="col">
            <h5>report</h5> <br>

            <form action="">
                주문일<input type="date">
                <input type="date">
                주문 코드 :
                <input id="orderCodeInput" type="text">
                <button id="searchOrderCodeButton"  onclick="searchOrderCode()">주문코드 검색</button>
                <div id="orderCodes"></div>
                <script>
                    function searchOrderCode() {
                        const orderCodePart=document.querySelector("#orderCodeInput")
                        const config = {
                            method: "get",
                            headers:{
                                "Content-Type":"application/json"
                            },
                            body:JSON.stringify(orderCodePart)
                        };

                        fetch("${pageContext.request.contextPath}/report/search/order_code", config)
                            .then(response => response.json())
                            .then(data => console.log(data))
                            .catch(error => console.log(error));
                    }
                </script>



                바이어 코드 : <input type="text"> <input type="button" value="검색"> <br>
               <input type="button" value=" 검색조건 추가"> <br>
                조회 항목 선택 :
                주문코드<input type="checkbox" name="" value="order_code" checked>
                바이어코드<input type="checkbox" name="" value="" checked>
                주문일<input type="checkbox" name="" value="" checked>
                승인여부 <input type="checkbox" name="" value="" checked>
                승인일 <input type="checkbox" name="" value="" checked>
                메모<input type="checkbox" name="" value="" checked>
                작성자 <input type="checkbox" name="" value="" checked>
                작성일 <input type="checkbox" name="" value="" checked>
                제품코드 <input type="checkbox" name="" value="" checked>
                수량<input type="checkbox" name="" value="" checked>
                통화 <input type="checkbox" name="" value="" checked>
                가격 <input type="checkbox" name="" value="" checked>


                <br>


                <input type="submit" value="조회">
            </form>
            <table class="table">
                <thead class="table-dark">
                <tr>

                    <th >선택</th>
                    <th id="order_c">주문 코드</th>
                    <th id="buyer_c">바이어 코드</th>
                    <th>주문일</th>
                    <th>승인여부</th>
                    <th>승인일</th>
                    <th>반려일</th>
                    <th>메모</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>제품 코드</th>
                    <th>수량</th>
                    <th>통화</th>
                    <th>가격</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${orders}" var="order">
                    <tr>

                        <td><input type="checkbox" name="" value="order_code"></td>
                        <td>${order.order_code}</td>
                        <td>${order.buyer_code}</td>
                        <td>${order.order_date}</td>
                        <td>${order.status}</td>
                        <td></td>
                        <td></td>
                        <td>${order.memo}</td>
                        <td>${order.adduser}</td>
                        <td>${order.adddate}</td>
                        <td>${order.product_code}</td>
                        <td>${order.quantity}</td>
                        <td>${order.currency}</td>
                        <td>${order.price}</td>

                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                <td colspan="14">합계</td>
                </tfoot>
            </table>

            <nav aria-label="...">
                <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item active"><a class="page-link" href="#">1</a></li>
                    <li class="page-item ">
                        <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                        <a class="page-link" href="#">Next</a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
</div>










<script>



</script>


<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>

</body>
</html>









