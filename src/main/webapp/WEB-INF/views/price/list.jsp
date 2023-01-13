<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-01-03
  Time: 오후 2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="user-scalable=no, width=device-width, initial-scale=1.0">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.23/css/jquery.dataTables.min.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>


<div class="content-wrapper">
    <div class="page-header">
        <h1 class="page-title"> Price </h1>
        <div class="btn-group" style="left: 93%; margin-bottom: 4px">
            <button type="button" class="btn btn-success btn-sm">등록 </button>
        </div>
    </div>
    <div class="row">
        <div class="card">
            <div class="card-body">
                <table class="table table-hover table-striped dataTable mt-0" id="deviceTable">
                    <thead class="bg-secondary">
                    <tr style="text-align: center">
                        <th>No.</th>
                        <th>바이어코드</th>
                        <th>바이어명</th>
                        <th>제품코드</th>
                        <th>제품명</th>
                        <th>판매가</th>
                        <th>화폐단위</th>
                        <th>만료일</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>수정자</th>
                        <th>수정일</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${priceList}" var="price">
                        <tr style="text-align: center">
                            <td>${price.num}</td>
                            <td>${price.buyer_code}</td>
                            <td>${price.buyer_name}</td>
                            <td>${price.product_code}</td>
                            <td>${price.product_name}</td>
                            <td>${price.price}</td>
                            <td>${price.current}</td>
                            <td>${price.expiration}</td>
                            <td>${price.adduser}</td>
                            <td>${price.adddate}</td>
                            <td>${price.upduser}</td>
                            <td>${price.upddate}</td>
                            <td>
                                <span style="text-decoration: underline;" type="submit"data-bs-toggle="modal" data-bs-target="#modifyModal">수정</span>

                        </tr><span style="text-decoration: underline;" type="submit"data-bs-toggle="modal" data-bs-target="#removeModal">삭제</span>
                        </td>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script>


    $(document).ready(function() {
        $("#deviceTable").DataTable({
            "pageLength": 10,
            "serverSide": true,
            "processing": true,
            ajax: {
                url: "./price/list",
                method: "GET",
                dataType : "JSON",
                contentType: "application/json",
                dataSrc: ''
            },
            columns: [
                {data: "num"},
                {data: "buyer_code"},
                {data: "buyer_name"},
                {data: "product_code"},
                {data: "product_name"},
                {data: "price"},
                {data: "current"},
                {data: "expiration"},
                {data: "adduser"},
                {data: "adddate"},
                {data: "upduser"},
                {data: "upddate"}


            ]

        });
    });



</script>


</body>
</html>
