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
    }

  </style>
</head>
<body>
  <div class="flexbox1">
    <div><my:sidebar></my:sidebar></div>
    <div>
      <h1 class="tit">회원 목록</h1>
      <table class="table" style="width: 1200px;">
        <thead>
          <tr>
            <th>이름</th>
            <th>아이디</th>
            <th>연락처</th>
            <th>등록일</th>
          </tr>
        </thead>
        <tbody>
      <c:forEach items="${memberList}" var="mem">
            <tr>
              <td>${mem.name}</td>
              <td>${mem.user_id}</td>
              <td>${mem.phone}</td>
              <td>${mem.adddate}</td>
            </tr>
      </c:forEach>
        </tbody>
      </table>

    </div>
  </div>
</body>
</html>
