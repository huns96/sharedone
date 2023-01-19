
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container-fluid">
  <div class="row flex-nowrap">
    <my:Sidebar></my:Sidebar>
    <div class="col" style="">
      <div class="p-3 mb-3" style="background-color: white; margin: 40px 40px 0px 40px; border-radius: 5px">
        <table style="align-content: end;">
          <tr>
            <td style="float:end;">
              <form class="d-flex" action="${pageContext.request.contextPath}/product/listSearch" style="height: 40px" method="get"> <!--action="{pageContext.request.contextPath}/product/listSearch"  -->
                <select name="search" id="optionId" class="form-select" style="width: 210px">
<%--                  <option value="all">통합검색</option>--%>
                  <option value="product_code" <c:if test="${type == 'product_code'}">selected</c:if> >제품 코드</option>
                  <option value="name"<c:if test="${type == 'name'}">selected</c:if> >이름</option>
                </select>

                <input type="text" placeholder="search" name="keyword" class="form-control" id="searchId" value="${keyword}">
                <button class="btn btn-dark" style="width: 100px; margin-right: 5px">검색</button>
                <a type="button" class="btn btn-dark" style="width: 140px" href="/product/list">초기화</a>
              </form>
              </td>
          </tr>
          <tr>
            <td>
              <form action="${pageContext.request.contextPath}/product/listSearchCategory" method="get" class="d-flex" style="height: 40px">
                <select class="form-select" name="categoryId">
                  <option disabled="disabled" selected="selected">Select</option>
                    <optgroup label="모바일">
                    <option value="1">스마트폰</option>
                    <option value="2">태블릿</option>
                  </optgroup>
                  </optgroup>
                  <optgroup label="PC">
                    <option value="3">데스크탑</option>
                    <option value="4">노트북</option>
                  </optgroup>
                  <optgroup label="가전">
                    <option value="5">냉장고</option>
                    <option value="6">세탁기</option>
                  </optgroup>
                </select>
                <button class="btn btn-dark" style="width: 100px">검색</button>
              </form>
            </td>
          </tr>
        </table>
      </div>
      <div style="background-color: white; margin: 40px 40px 0px 40px; border-radius: 5px">
        <div class="row p-2 justify-content-between">
          <div class="col-4 mt-3"><h4 style="font-weight: bold;">제품 목록</h4></div>
          <div class="col-2 mt-3" style="text-align: right;">
            <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#registerModal">등록</button>
            <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" id="deleteCheck">삭제</button>
          </div>
        </div>
      <!-- remove modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5">삭제 확인</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                  삭제하시겠습니까?
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button class="btn btn-danger" onclick="deleteCheck()">확인</button>
              </div>

            </div>
          </div>
        </div>

    <div class="col py-3 mt-5" style="margin: 60px;">
      <h1 style="margin-bottom: 50px;">제품 리스트</h1>
      <div class="col-2 mt-3" style="text-align: right;">
        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#registerModal">등록</button>
        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" onclick="deleteCheck()" id="deleteCheck">삭제</button>
      </div>


      <!-- register Modal -->
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
                  <input type="text" class="form-control" name="name" required="required" id="productName">
                </div>

                <div class="mb-3">
                  <label for="registerForm" class="col-form-label">단위:</label>
                  <input type="text" class="form-control" name="ea" required="required" id="productEa">
                </div>

                <div class="mb-3">
                  <label for="registerForm" class="col-form-label">카테고리:</label>
                  <select name="category" id="sel1" onchange="addSel2()" class="form-select mb-1">
                    <option selected="selected" value="null" disabled>SELECTED</option>
                    <option value="88">모바일</option>
                    <option value="89">TV</option>
                    <option value="90">가전</option>
                  </select>
                  <select name="" id="sel2" onchange="addSel3()" class="form-select mb-1">
                    <option selected="selected" value="null" disabled>SELECTED</option>
                  </select>
                  <select name="category_id" id="sel3" class="form-select mb-1">
                    <option selected="selected" value="null" disabled>SELECTED</option>
                  </select>
                </div>

              </form>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-primary" onclick="submit()">등록</button>
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
            </div>
          </div>
        </div>
      </div>

      <!-- deleteModal -->
      <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하시겠습니까?</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Save changes</button>
            </div>
          </div>
        </div>
      </div>

      <div>
        <table class="table table-bordered border border-5">
          <thead>
          <tr>
            <th scope="col" class="table-head">전체<input class="form-check-input" id="productAll" type="checkbox" name="productCodeAll" style="margin-left: 5px" onclick="checkAll(this)"></th>
            <th scope="col" class="table-head">상품코드</th>
            <th scope="col" class="table-head">상품명</th>
            <th scope="col" class="table-head">단위</th>
            <th scope="col" class="table-head">카테고리</th>
            <th scope="col" class="table-head">작성자</th>
            <th scope="col" class="table-head">작성일</th>
            <th scope="col" class="table-head">수정자</th>
            <th scope="col" class="table-head">수정일</th>
            <th scope="col" class="table-head" style="width: 5%;"></th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var="item" items="${products}" varStatus="status">
            <tr>
              <th scope="row" class="row-head">
                <form action="${pageContext.request.contextPath}/product/delete" method="post" id="deleteForm">
                  <input class="form-check-input checkProduct" type="checkbox" value="${item.product_code}" name="productCode" id="flexCheckDefault" onclick="changeStatus(this)">
                </form>
                <label class="form-check-label" for="flexCheckDefault">

                </label>
              </th>
              <td class="td-body">${item.product_code}</td>
              <td class="td-body">${item.name}</td>
              <td class="td-body">${item.ea}</td>
              <td class="td-body">${item.main_cat} >> ${item.middle_cat} >> ${item.sub_cat}</td>
              <td class="td-body">${item.adduser}</td>
              <td class="td-body">${item.adddate}</td>
              <td class="td-body">${item.upduser}</td>
              <td class="td-body">${item.upddate}</td>
              <td>
                <div class="d-flex justify-content-center" style="margin: 0;">
                  <button class="btn btn-warning btn-sm" style="color: white;" id=`modify${item.product_code}` data-product-code="${item.product_code}" data-product-category="${item.category_id}" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</button>
                </div>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        <!-- Pagination -->
        <div class="row justify-content-center" style="margin-left: 110px;">
          <div class="col-3">
            <nav aria-label="Page navigation example">
              <ul class="pagination">
                <li class="page-item">
                  <c:url value="/product/list" var="pageLink"></c:url>
                  <a class="page-link" href="${pageLink }?page=1" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <c:forEach begin="1" end="${pages }" varStatus="status" var="pageNumb">
                  <li class="page-item ${pageNum == pageNumb ? "active" : ""}">
                    <a class="page-link" href="${pageLink }?page=${pageNumb}">${pageNumb }</a>
                  </li>
                </c:forEach>
                <li class="page-item">
                  <a class="page-link" href="${pageLink }?page=${pages}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- 수정 모달 -->
        <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modalModify" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="modalModify">}정보 수정</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="${pageContext.request.contextPath}/product/modify" method="post" id="modifyForm">
                  <label for="" class="col-form-label">제품코드:</label>
                  <input type="text" class="form-control" value="" readonly="readonly" style="background-color: lightgrey;" required="required">
                  <input type="hidden" class="form-control" name="product_code" value="" required="required" id="productCode">
                  <div class="mb-3">
                    <label for="" class="col-form-label">제품명:</label>
                    <input type="text" class="form-control" name="name" required="required" id="productName2">
                  </div>
                  <div class="mb-3">
                    <label for="" class="col-form-label">단위:</label>
                    <input type="text" class="form-control" name="ea" required="required" id="productEa2">
                  </div>
                  <div class="mb-3">
                    <label for="" class="col-form-label">카테고리:</label>
                    <input type="text" class="form-control" value="" readonly="readonly" style="background-color: lightgrey;" required="required">
                    <input type="text" class="form-control" name="category" required="required" id="category2">
                  </div>
                </form>

              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-primary" onclick="submitModifyForm()">수정</button>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
              </div>
            </div>
          </div>
        </div>

      </div>
      </div>
    </div>
  </div>
</div>

<script>

  const ctx = "${pageContext.request.contextPath}";


  const productName = document.querySelector("#productName");
  const productEa = document.querySelector("#productEa");

  let categoryMiddle =''; //중분류 카테고리
  let categorySub = '';
  let sel1 = document.querySelector('#sel1');
  let sel2 = document.querySelector('#sel2');
  let sel3 = document.querySelector('#sel3');

  const productName2 = document.querySelector("#productName2");
  const productEa2 = document.querySelector("#productEa2");
  const category2 = document.querySelector("#category2");



  function addSel2(){
    let selOne = document.querySelector('#sel1').value;
    let main_id = parseInt(selOne);
    fetch(ctx + "/product/categoryListMid/" + main_id)
            .then(res => res.json())
            .then(data =>{
              for(let key in data){
                categoryMiddle += `<option value="\${key }">\${data[key] }</option>`
               // console.log(key + " " + data[key]);
              }
              sel2.innerHTML= `\${categoryMiddle}`
              categoryMiddle="";
              sel3.innerHTML="";
            })
  }  // 버그 있을거같은데 유의해야될부분 ------------------

  function addSel3(){
    let sel2Value = sel2.value;
    let middle_id = parseInt(sel2Value);

    fetch(ctx + "/product/categoryListSub/" + middle_id)
            .then(res => res.json())
            .then(data =>{
              for(let key in data){
                categorySub += `<option value="\${key }">\${data[key] }</option>`
               // console.log(key + " " + data[key]);
              }
              sel3.innerHTML=`\${categorySub}`
              categorySub="";
            })
  }



  function submit(){ //product_register function
    const registerForm = document.querySelector('#registerForm');
    this.event.preventDefault();
    if(productName.value ==='' || productEa.value ==='' || sel1.value ==='null'|| sel2.value ==='null' || sel3.value ==='null'
    || sel1.value ==='' || sel2.value ==='' || sel3.value ===''){
      alert("유효성 검사 해야됨!!");
    }else{
      registerForm.submit();
    }
  }


  var  checkedList = [];
  const myModal = document.getElementById('deleteModal');

  function deleteCheck(){
    var checked = document.querySelectorAll("input[name='productCode']:checked");

    if(checked.length!==0){
      checked.forEach((e) =>{
        checkedList.push(e.value);
      })
      alert(checkedList);
      executeDelete(checkedList);
      checkedList=[];
    }
  }

  function executeDelete(checkedList){
    $.post(ctx+'/product/delete',"checkedList="+checkedList.join(','), function () {
              location.reload();
            }
    )
  }

  function checkAll(selectAll){
    const productAll = document.querySelector("#productAll");
    const checkboxes = document.getElementsByName("productCode");
    productAll.toggleAttribute("checked");
    checkboxes.forEach((checkbox) =>{
      checkbox.setAttribute("checked","checked");
      checkbox.checked = selectAll.checked;
    })
  }

  function deleteProduct(){
    document.querySelector("#deleteForm").submit();
  }

  function changeStatus(box){
    box.toggleAttribute("checked");
  }

  function submitModifyForm(){
    this.event.preventDefault();
    if(productName2.value ===''){
      alert("제품명 입력");
    }if(productEa2.value ===''){
      alert("단위 입력");
    }
    else{
      document.querySelector("#modifyForm").submit()
              .then(

              );
    }
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

</script>
</body>
</html>
