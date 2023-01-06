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
  <link rel="stylesheet" type="text/css" media="screen" href="../css/price.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
<div class="content-wrapper">
  <div class="page-header">
    <h1 class="page-title"> Price </h1>
    <div class="btn-group" style="left: 93%; margin-bottom: 4px">
      <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal" data-bs-target="#registerModal">등록 </button>
    </div>
  </div>

  <div class="row">
    <div class="card">
      <div class="card-body">
        <table class="table table-hover table-striped dataTable mt-0" id="deviceTable">
        <thead>
          <tr style="text-align: center">
            <th>No.</th>
            <th>바이어코드</th>
            <th>바이어명</th>
            <th>제품코드</th>
            <th>제품명</th>
            <th>판매가</th>
            <th>시작일</th>
            <th>종료일</th>
            <th>화폐단위</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>수정자</th>
            <th>수정일</th>
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
              <td>${price.start_date}</td>
              <td>${price.end_date}</td>
              <td>${price.currency}</td>
              <td>${price.adduser}</td>
              <td>${price.adddate}</td>
              <td>${price.upduser}</td>
              <td>${price.upddate}</td>
              <td>
                <span style="text-decoration: underline;" type="submit"data-bs-toggle="modal" data-bs-target="#modifyModal">수정</span>
                <span style="text-decoration: underline;" type="submit"data-bs-toggle="modal" data-bs-target="#removeModal">삭제</span>
             </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="registerModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-xl" role="document">
    <div class="modal-content">

      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel" style="left: 10px">판매가 등록</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close" style="right: 10px"></button>
      </div>
      <div class="modal-body">
        <form class="registerForm" id="registerForm" action="" method="post" enctype="multipart/form-data" style="margin: auto;  height: 664px;">
          <div style="margin: 20px;">
            <div class="mb-3 mx-4">
              <div>
                <label class="form-label">바이어코드</label>
                <input class="form-control" type="text" name="buyer_code" id="buyer_code" data-bs-toggle="modal" data-bs-target="#buyerModal">
              </div>
            </div>
            <div class="mb-3 mx-4">
              <label class="form-label">제품코드</label>
              <input class="form-control" type="text" name="product_code" id="product_code" data-bs-toggle="modal" data-bs-target="#productModal">
            </div>
            <div class="mb-3 mx-4">
              <label class="form-label">판매가</label>
              <input class="form-control" type="text" name="price" id="price">
            </div>
            <div class="mb-3 mx-4">
              <label class="form-label">시작일</label>
              <input class="form-control" type="date" name="start_date" id="start_date">
            </div>
            <div class="mb-3 mx-4">
              <label class="form-label">종료일</label>
              <input class="form-control" type="date" name="end_date" id="end_date">
            </div>
            <div class="mb-3 mx-4">
              <label class="form-label">화폐단위</label><br>
              <select class="form-control" type="text" name="currency" id="currency">
                <option value=""></option>
                <option value="원(₩)">원(₩)</option>
                <option value="달러($)">달러($)</option>
                <option value="앤(¥)">앤(¥)</option>
                <option value="위안(元)">위안(元)</option>
              </select>
            </div>
            <input class="form-control" type="hidden" name="adduser" id="adduser" value="user">
          </div>
<%--          <input class="btn btn-primary" type="submit" value="등록">--%>
        </form>

      </div>
      <div class="modal-footer">
        <button id="registerConfirmButton"
                class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-secondary"
                data-bs-dismiss="modal">취소</button>
      </div>

    </div>
  </div>
</div>
<jsp:include page="include/modal.jsp" />

<script type="text/javascript" src="../js/jquery.js"></script>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>

  document.querySelector("#registerConfirmButton").addEventListener("click", function() {
    document.querySelector("#registerForm").submit();
  });


  // document.querySelector("#registerModal").addEventListener("click", function() {
  //   $('#registerModal>.modal-dialog').load("register", function() {
  //     $("#registerModal").modal("show");
  //   });
  // });

  <%--const ctx = "${pageContext.request.contextPath}";--%>
  <%--var buyer_code = document.getElementById("buyer_code").value;--%>
  <%--var product_code = document.getElementById("product_code").value;--%>
  <%--var price = document.getElementById("price").value;--%>
  <%--var start_date = document.getElementById("start_date").value;--%>
  <%--var end_date = document.getElementById("end_date").value;--%>
  <%--var currency = document.getElementById("currency").value;--%>
  <%--var adduser = document.getElementById("adduser").value;--%>

  <%--const register = () => {--%>
  <%--  fetch('\${ctx}/price/pricelist', {--%>
  <%--    method: 'POST',--%>
  <%--    body: JSON.stringify({--%>
  <%--      "buyer_code":buyer_code,--%>
  <%--      "product_code":buyer_code,--%>
  <%--      "price":price,--%>
  <%--      "start_date":start_date,--%>
  <%--      "end_date":end_date,--%>
  <%--      "currency":currency,--%>
  <%--      "adduesr":adduser--%>
  <%--    }),--%>
  <%--  })--%>
  <%--          .then(response => response.json())--%>
  <%--          .then(result => {--%>
  <%--            if (result.message === 'SUCCESS') {--%>
  <%--              alert('등록 완료되었습니다.');--%>
  <%--              setModal(false);--%>
  <%--            }--%>
  <%--          });--%>
  <%--};--%>
</script>


</body>
</html>
