
<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-01-04
  Time: 오후 1:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
  <title>asdf</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/css/bootstrap.min.css" integrity="sha512-N415hCJJdJx+1UBfULt+i+ihvOn42V/kOjOpp1UTh4CZ70Hx5bDlKryWaqEKfY/8EYOu/C2MuyaluJryK1Lb5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js" integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container-fluid">
  <div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
    <div class="col py-3 mt-5" style="margin: 60px;">
      <h1 style="margin-bottom: 50px;">제품 리스트</h1>
      <button type="button" class="btn btn-outline-primary btn-sm mb-3" data-bs-toggle="modal" data-bs-target="#registerModal">제품 등록</button>

      <!-- Modal -->
      <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">제품 등록</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form action="${pageContext.request.contextPath}/product/register" method="post" id="registerForm">
                <div class="mb-3">
                  <label for="registerForm" class="col-form-label">제품명:</label>
                  <input type="text" class="form-control" name="name" required="required">
                </div>

                <div class="mb-3">
                  <label for="registerForm" class="col-form-label">단위:</label>
                  <input type="text" class="form-control" name="ea" required="required">
                </div>

                <div class="mb-3">
                  <label for="registerForm" class="col-form-label">카테고리:</label>
                  <select name="" id="sel1" onchange="addSel2()" class="form-select mb-1">
                    <option value="88">모바일</option>
                    <option value="89">TV</option>
                    <option value="90">가전</option>
                  </select>
<%--                  <select name="" id="sel2" onchange="addSel3()" class="form-select mb-1">--%>
<%--                    <option value="1">스마트폰</option>--%>
<%--                  </select>--%>
<%--                  <select name="" id="sel3" class="form-select mb-3">--%>
<%--                    <option value="1">갤럭시S</option>--%>
<%--                  </select>--%>
                </div>

              </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" onclick="document.querySelector('#registerForm').submit()">등록</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
            </div>
          </div>
        </div>
      </div>

      <div>
        <table class="table table-bordered">
          <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">상품코드</th>
            <th scope="col">상품명</th>
            <th scope="col">단위</th>
            <th scope="col">카테고리</th>
            <th scope="col">등록일</th>
            <th scope="col">수정일</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${products}" varStatus="status">
            <tr>
              <th scope="row">${status.index}</th>
              <td>${item.product_code}</td>
              <td>${item.name}</td>
              <td>${item.ea}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>

<script>

  const ctx = "${pageContext.request.contextPath}";

  function addSel2(){
    let sel1 = document.querySelector("#sel1").value;
    let main_id = parseInt(sel1);
    fetch(ctx + "/product/categoryList/" + main_id)
            .then(res => res.json())
            .then(data =>{
              alert(data);
            })
  }

  //
  //   if(sel1 == 1){
  //
  //
  //
  //     sel2.innerHTML =
  //             `
  //               <option value="1" selected>스마트폰</option>
  //               <option value="2">테블릿</option>
  //               <option value="3">스마트워치</option>
  //
  //           `;
  //
  //     sel3.innerHTML =
  //             `
  //               <option value="1" selected>갤럭시S</option>
  //               <option value="2">갤럭시K</option>
  //               <option value="3">갤럭시A</option>
  //           `;
  //   }
  //   else if(sel1 ==2){
  //     sel2.innerHTML =
  //             `
  //               <option value="4" selected>QLED</option>
  //               <option value="5">LCD</option>
  //               <option value="6">UHD</option>
  //           `;
  //
  //     sel3.innerHTML =
  //             `
  //               <option value="1" selected>aTV</option>
  //               <option value="2">bTV</option>
  //               <option value="3">cTV</option>
  //           `;
  //   }
  //   else{
  //     sel2.innerHTML =
  //             `
  //               <option value="1" selected>청소기</option>
  //               <option value="2">세탁기</option>
  //               <option value="3">냉장고</option>
  //           `;
  //
  //     sel3.innerHTML =
  //             `
  //               <option value="1" selected>비스포크</option>
  //               <option value="2">트롬</option>
  //               <option value="3">다이슨</option>
  //           `;
  //   }
  // }
  //
  // function addSel3(){
  //   var sel2 = document.querySelector("#sel2").value;
  //   if(sel2 == 1){
  //     sel3.innerHTML =
  //             `
  //               <option value="1" selected>갤럭시S</option>
  //               <option value="2">갤럭시K</option>
  //               <option value="3">갤럭시A</option>
  //           `;
  //   }
  // }

  function submit(){
    console.log(document.querySelector("#sel3").value);
    document.querySelector("#hidden").value = document.querySelector("#sel3").value;
    document.querySelector("#hidden").innerHTML = document.querySelector("#sel3").value;
  }

</script>
</body>
</html>
