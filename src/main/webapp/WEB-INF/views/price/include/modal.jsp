<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-01-03
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/price.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<form class="registerForm" action="" method="post" enctype="multipart/form-data" style="margin: auto;  height: 664px;">
    <div style="margin: 20px;">
        <div class="mb-3 mx-4" style="position: relative">
            <label class="form-label">바이어코드</label>
            <input class="form-control" type="text" name="buyer_code" data-bs-toggle="modal" data-bs-target="#buyerModal" placeholder="바이어 코드" value="${buyer_code}" style="text-align: center" readonly>
            <i class="fa-solid fa-magnifying-glass" type="button" style="position: absolute; top: 62%; right: 1%" data-bs-toggle="modal" data-bs-target="#buyerModal"></i>
        </div>
        <div class="mb-3 mx-4">
            <label class="form-label">제품코드</label>
            <input class="form-control" type="text" value="${product_code}" name="product_code" data-bs-toggle="modal" data-bs-target="#productModal" placeholder="제품 코드" style="text-align: center">
        </div>
        <div class="mb-3 mx-4">
            <label class="form-label">판매가</label>
            <input class="form-control" type="text" value="${price}" name="price">
        </div>
        <div class="mb-3 mx-4">
            <label class="form-label">시작일</label>
            <input class="form-control" type="date" value="${date}" name="start_date">
        </div>
        <div class="mb-3 mx-4">
            <label class="form-label">종료일</label>
            <input class="form-control" type="date" name="end_date">
        </div>
        <div class="mb-3 mx-4">
            <label class="form-label">화폐단위</label><br>
            <select class="form-control" type="text" name="currency">
                <option value=""></option>
                <option value="원(₩)">원(₩)</option>
                <option value="달러($)">달러($)</option>
                <option value="앤(¥)">앤(¥)</option>
                <option value="위안(元)">위안(元)</option>
            </select>
        </div>
        <input class="form-control" type="hidden" name="adduser" value="user">
    </div>
    <input class="btn btn-primary" type="submit" value="등록">
</form>

<!-- Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel" style="left: 10px">바이어</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close" style="right: 10px"></button>
            </div>
            <div class="modal-body" style="float: left">
                <%--                <form action="">--%>
                <%--                    <select name="" id="">--%>
                <%--                        <option value=""></option>--%>
                <%--                    </select>--%>
                <%--                    <div class="search">--%>
                <%--                        <input type="text">--%>
                <%--                        <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="">--%>
                <%--                    </div>--%>
                <%--                </form>--%>

                <form class="d-flex" role="search" action="">
                    <select name="t" class="form-select" style="width: 100px ; font-size: 12px ">
                        <option value="product_code" ${param.t == 'product_code' ? 'selected' : ''}>제품코드</option>
                        <option value="product_name" ${param.t == 'product_name' ? 'selected' : ''}>제품명</option>
                    </select>
                    <input value="${param.q }" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="q" style="font-size: 14px;" >
                    <button class="btn btn-outline-success" type="submit">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </button>
                </form>
            </div>
            <div class="modal-footer">
                <button id="modifyConfirmButton" type="button"
                        class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                <button type="button" class="btn btn-primary"
                        data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="buyerModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="ModalLabel">삭제</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">삭제하시겠습니까?</div>
            <div class="modal-footer">
                <button id="removeConfirmButton" type="button"
                        class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
                <button type="button" class="btn btn-primary"
                        data-bs-dismiss="modal">취소</button>
            </div>
        </div>
    </div>
</div>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>

</script>
</body>
</html>
