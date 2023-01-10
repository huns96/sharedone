<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MEMBER LIST</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js" integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <style>

    .tit{
      margin-left: 50px;
      margin-top: 50px;

    }
    .getAuthoBtn{
      background-color: #5e5e5e;
      border-style: none;
      border-radius: 5px;
      color: white;
    }
    .modifyBtn{
      background-color: #f39c12;
      border-style: none;
      border-radius: 5px;
      color: white;
      width: 50px;
      height: 25px;
      text-align: center;
    }
    .deleteBtn{
      background-color: #ff3e51;
      border-style: none;
      border-radius: 5px;
      color: white;
      width: 50px;
      height: 25px;
    }

    .addMemberbtn{
      background-color: green;
      border-style: none;
      border-radius: 5px;
      color: white;
      margin-left: 50px;
      height: 30px;
    }

    .dupliCheckBtn{
      background-color: white;
      border-color: black;
      border-radius: 8px;
      color: black;
    }

    .search{
      text-align: right;
      width: 1000px;
    }
    .searchBtn{
      background-color: white;
      border-color: white;
    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class= "row" style="display: flex">
      <my:Sidebar></my:Sidebar>

      <div style="width: 1000px">
        <h1 class="tit">회원 목록</h1>
        <div class="search">
          <select name="q" id="">
            <option value="">전체</option>
            <option value="">이름</option>
            <option value="">아이디</option>
            <option value="">연락처</option>
            <option value="">등록일</option>
            <option value="">권한</option>
          </select>
          <input type="text" name="q">
          <button class="searchBtn">검색</button>
        </div>
        <table class="table" style="width: 1000px; margin-left: 50px;">
          <thead>
            <tr>
              <th>이름</th>
              <th>아이디</th>
              <th>연락처</th>
              <th>등록일</th>
              <th>권한</th>

            </tr>
          </thead>
          <tbody>
        <c:forEach items="${memberList}" var="mem" varStatus="sts">
              <tr>
                <td>${mem.name}</td>
                <td>${mem.user_id}</td>
                <td>${mem.phone}</td>
                <td>${mem.adddate}</td>
                <td>${mem.auth}</td>
                <td>
                  <button onclick="asd('${mem.user_id}','${mem.name}','${mem.phone}','${mem.auth}')" class="getAuthoBtn" data-bs-toggle="modal" data-bs-target="#getAuthoModal">권한부여</button>
                  <button onclick="modi('${mem.user_id}','${mem.name}','${mem.phone}')" class="modifyBtn" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</button>
                  <button onclick="dele('${mem.user_id}')" class="deleteBtn" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button></td>
              </tr>
        </c:forEach>
          </tbody>
        </table>
        <button class="addMemberbtn" data-bs-toggle="modal" data-bs-target="#addMemberModal">회원등록</button>
      </div>
    </div>
  </div>

  <!-- 회원 등록 Modal -->
  <div class="modal fade" id="addMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">회원 등록</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="/member/addMember" method="post" id="memberInsertForm">
            회원명:&nbsp;&nbsp;&nbsp;  <input type="text" name="name"> <br>
            <br>
            아이디:&nbsp;&nbsp;&nbsp; <input type="text" name="user_id">
            <button class="dupliCheckBtn">아이디중복확인</button> <br>
            <br>
            비밀번호: <input type="text" name="password"> <br>
            <br>
            연락처:&nbsp;&nbsp;&nbsp;  <input type="text" name="phone"> <br>
            <br>
            작성자:&nbsp;&nbsp;&nbsp; <input type="text" name="adduser">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary memberInsertBtn">등록</button>
        </div>
      </div>
    </div>
  </div>


  <!-- 권한 부여 Modal -->
  <div class="modal fade" id="getAuthoModal" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel2">권한 부여</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <table class="table" style="text-align: center">
            <thead>
              <tr>
                <th>회원명</th>
                <th>아이디</th>
                <th>연락처</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><span id="copyName"></span></td>
                <td><span id="copyId"></span></td>
                <td><span id="copyPhone"></span></td>
              </tr>
            </tbody>
          </table>
          부여할 권한
          <form action="/member/setAutho" method="post" id="setAuthoForm">
            <select name="auth">
              <option value="팀원">팀원</option>
              <option value="팀장">팀장</option>
              <option value="관리자">관리자</option>
              <input id="userIdInput" type="hidden" name="user_id" value="">
            </select>
          </form>
          <br>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button id="authoChangeBtn" type="button" class="btn btn-primary">권한부여</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 수정 Modal -->
  <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">회원 정보 수정</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <form action="/member/modifyMember" method="post" id="modiForm">
            아이디&nbsp;:&nbsp;<input id="modiId" type="text" name="user_id" value="" readonly> <br>
            <br>
            회원명 : <input id="modiName" type="text" name="name" value=""> <br>
            <br>
            연락처 : <input id="modiPhone" type="text" name="phone" value=""> <br>
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button id="modiBtn" type="button" class="btn btn-primary">수정</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 삭제 Modal -->
  <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">회원 삭제</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          회원 정보를 삭제하시겠습니까?
          <form action="/member/deleteMember" method="post" id="delForm">
            <input id="deleId" type="hidden" name="user_id">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button id="delBtn" type="button" class="btn btn-primary">삭제</button>
        </div>
      </div>
    </div>
  </div>
  </div>

  <script
          src="https://code.jquery.com/jquery-3.6.3.js"
          integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
          crossorigin="anonymous"></script>
  <script>
    document.querySelector(".memberInsertBtn").addEventListener("click", function () {
      const memInsertForm = document.forms.memberInsertForm;
      memInsertForm.submit();
    });

    function asd(id, name, phone, auth){
      $('#copyId').text(id);
      $('#copyName').text(name);
      $('#copyPhone').text(phone);
      $('#copyAutho').text(auth);
    }

    $('#authoChangeBtn').click(function () {
      $('#userIdInput').val($('#copyId').text());
      //alert( $('#userIdInput').val());
      $('#setAuthoForm').submit();
    })

    function modi(id, name, phone){
      $('#modiId').val(id);
      $('#modiName').val(name);
      $('#modiPhone').val(phone);
    }

    $('#modiBtn').click(function () {
      $('#modiForm').submit();
    })

    function dele(id){
      $('#deleId').val(id);
    }

    $('#delBtn').click(function () {
      $('#delForm').submit();
    })

  </script>
</body>
</html>
