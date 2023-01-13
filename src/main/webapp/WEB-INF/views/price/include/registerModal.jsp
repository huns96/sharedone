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
    <div class="modal fade" id="registerModal" tabindex="-1" aria-hidden="true">--%>
      <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">

          <div class="modal-header">
            <h1 class="modal-title fs-5" id="exampleModal" style="left: 10px">판매가 등록</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close" style="right: 10px"></button>
          </div>
          <div class="modal-body">
            <form class="registerForm" id="registerForm" action="" method="post" enctype="multipart/form-data" style="margin: auto;  height: 664px;">
              <div style="margin: 20px;">
                <div class="mb-3 mx-4">
                  <div>
                    <label class="form-label">바이어코드</label>
                    <input class="form-control" id="buyerCodeInput" required="required" type="text" name="buyer_code" placeholder="바이어 코드" data-bs-toggle="modal" data-bs-target="#buyerModal" style="text-align: center">
                  </div>
                </div>
                <div class="mb-3 mx-4">
                  <label class="form-label">제품코드</label>
                  <input class="form-control" id="productCodeInput" required="required" type="text" name="product_code" data-bs-toggle="modal" data-bs-target="#productModal" placeholder="제품 코드" style="text-align: center">
                </div>
                <div class="mb-3 mx-4">
                  <label class="form-label">판매가</label>
                  <input class="form-control" id="priceInput" required="required" type="int" name="price" style="text-align: center" placeholder="-">
                </div>
                <div class="mb-3 mx-4">
                  <label class="form-label">시작일</label>
                  <input class="form-control" id="startDateInput" required="required" type="date" name="start_date" style="text-align: center">
                </div>
                <div class="mb-3 mx-4">
                  <label class="form-label">종료일</label>
                  <input class="form-control" id="endDateInput" required="required" type="date" name="end_date" style="text-align: center">
                </div>
                <div class="mb-3 mx-4">
                  <label class="form-label">화폐단위</label><br>
                  <select class="form-control" id="currencySelect" type="text" name="currency" style="text-align: center" required="required">
                    <option value="">화폐 단위를 선택하세요</option>
                    <option value="원(₩)">원(₩)</option>
                    <option value="달러($)">달러($)</option>
                    <option value="앤(¥)">앤(¥)</option>
                    <option value="위안(元)">위안(元)</option>
                  </select>
                </div>
                <input class="form-control" type="hidden" name="adduser" value="user">
<%--                <input class="btn btn-primary" type="submit" value="등록">--%>
              </div>
          </div>
                <div class="modal-footer">
                    <button id="registerConfirmButton"
                            class="btn btn-primary">등록</button>
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">취소</button>
                </div>
            </form>




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
