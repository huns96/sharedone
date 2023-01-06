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
    .flexbox1{
      display: flex;
    }
    .tit{
      margin-left: 50px;
      margin-top: 50px;
    }
    .getAuthoBtn{
      background-color: white;
      border-color: orange;
      border-radius: 8px;
    }
    .modifyBtn{
      background-color: white;
      border-color: green;
      border-radius: 8px;
    }
    .deleteBtn{
      background-color: white;
      border-color: red;
      border-radius: 8px;
    }

    .addMemberbtn{
      background-color: green;
      border-color: green;
      border-radius: 8px;
      color: white;
      margin-left: 50px;
    }

    .search{
      text-align: right;
    }
    .searchBtn{
      background-color: white;
      border-color: white;
    }


  </style>
</head>
<body>
  <div class="flexbox1">
    <div><my:sidebar></my:sidebar></div>
    <div>
      <h1 class="tit">회원 목록</h1>
      <div class="search">
        <select name="" id="">
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
      <table class="table" style="width: 1200px; margin-left: 50px;">
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
                <button onclick="updateAutho(item)" class="getAuthoBtn" data-bs-toggle="modal" data-bs-target="#getAuthoModal">권한부여</button>
                <button class="modifyBtn" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</button>
                <button class="deleteBtn" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제</button></td>
            </tr>
      </c:forEach>
        </tbody>
      </table>
      <button class="addMemberbtn" data-bs-toggle="modal" data-bs-target="#addMemberModal">회원등록</button>
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
          회원명&nbsp;&nbsp;&nbsp; <input type="text" name="name"> <br>
          <br>
          아이디&nbsp;&nbsp;&nbsp; <input type="text" name="user_id">
          <button>아이디중복확인</button> <br>
          <br>
          비밀번호 <input type="text" name="password"> <br>
          <br>
          연락처&nbsp;&nbsp;&nbsp; <input type="text" name="phone">
            <br>
          작성자 <input type="text" name="adduser">
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
  <div class="modal fade" id="getAuthoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">권한 부여</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          아이디 : <br>
          회원명 : <br>
          회원권한 : <br>
          권한 <select name="" id="">
            <option value="">팀원</option>
            <option value="">팀장</option>
            <option value="">관리자</option>
          </select> <br>
          <br>

        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">권한부여</button>
        </div>
      </div>
    </div>
  </div>

  <!-- 수정 Modal -->
  <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">회원 정보 <수정></수정></h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          아이디&nbsp;:&nbsp;<input readonly type="text" name="user_id" value="userID"> <br>
          <br>
          회원명 : <input type="text" name="name"> <br>
          <br>
          연락처 : <input type="text" name="phone"> <br>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">수정</button>
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
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary">삭제</button>
        </div>
      </div>
    </div>
  </div>
  <script>
    document.querySelector(".memberInsertBtn").addEventListener("click", function () {
      const memInsertForm = document.forms.memberInsertForm;
      memInsertForm.submit();
    });

    function updateAutho(item) {
      this.memberList = item;
      console.log(item);
    }

  </script>
</body>
</html>
