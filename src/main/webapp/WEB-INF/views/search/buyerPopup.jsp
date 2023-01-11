<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>바이어 검색</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div id="buyerPopup">
    <h4><b>바이어 목록</b></h4>
    <table class="table table-hover" id="buyer-table">
        <thead>
        <tr>
            <th>#</th>
            <th>바이어코드</th>
            <th>바이어명</th>
            <th>주소</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${buyerList}" var="buyer" varStatus="status">
            <tr>
                <td>${status.count}</td>
                <td>${buyer.buyer_code}</td>
                <td>${buyer.name}</td>
                <td>${buyer.address}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
