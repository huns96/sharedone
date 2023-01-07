
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.js" integrity="sha512-nO7wgHUoWPYGCNriyGzcFwPSF+bPDOR+NvtOYy2wMcWkrnCNPKBcFEkU80XIN14UVja0Gdnff9EmydyLlOL7mQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">

  <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

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
                  <select name="category_id" id="" class="form-select">
                    <option value="67">모바일</option>
                    <option value="68">TV</option>
                    <option value="69">가전</option>
                  </select>
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

      <table id="userList" class="table table-striped">
        <thead>
        <tr>
          <th>상품코드</th>
          <th>상품명</th>
          <th>단위</th>
        </tr>
        </thead>
        <tbody>
        <tfoot>
        <tr>
          <th>상품코드</th>
          <th>상품명</th>
          <th>단위</th>
        </tr>
        </tfoot>
      </table>
      <button id="buttonDelete" class="btn btn-outline-primary btn-sm">선택 삭제</button>
      <button id="buttonRelease" class="btn btn-outline-primary btn-sm">전체 해제</button>
    </div>
  </div>
</div>

<script>

  var lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 명)",
    "infoEmpty" : "0명",
    "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "통합 검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
      "first" : "첫 페이지",
      "last" : "마지막 페이지",
      "next" : "다음",
      "previous" : "이전"
    },
    "aria" : {
      "sortAscending" : " :  오름차순 정렬",
      "sortDescending" : " :  내림차순 정렬"
    }
  };

  $(document).ready(function(){
    $('#userList tfoot th').each(function() {
      var title = $(this).text();
      $(this).html('<input type="text" class="form-control" placeholder="Search ' + title + '" />');
    })
  });

  var table = $("#userList").DataTable({
    language : lang_kor,
    lengthChange:true,
    lengthMenu : [[10,15,20,-1],["10개씩 보기","15개씩 보기","20개씩 보기","전체 보기"]],
    initComplete: function () {
      // Apply the search
      this.api()
              .columns()
              .every(function () {
                var that = this;

                $('input', this.footer()).on('keyup change clear', function () {
                  if (that.search() !== this.value) {
                    that.search(this.value).draw();
                  }
                });
              });
    },
    ajax:{
      'url':'/shared/product/list.json',
      'type':'get',
      dataType:'JSON',
    },complete: function(data){
      /*console.log(data);*/
    },error: function (error){
      console.log(error);
    },
    columns:[
      {data: 'code'},
      {data: 'name'},
      {data: 'ea'},
    ]
  });

  $('#userList tbody').on('click','tr',function(){
    $(this).toggleClass('selected');
  })

  $('#buttonDelete').click(function(){
    for(var i=0;i<table.rows('.selected').data().toArray().length;i++){
      console.log(table.rows('.selected').data()[i].code);
    }
  })

  $('#buttonRelease').click(function(){
    $('#userList tbody').removeClass('selected');
    location.reload();
  })

</script>
</body>
</html>
