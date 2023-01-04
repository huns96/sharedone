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
      <h3 class="mb-5">제품</h3>

      <div class="mb-5">
        <button type="button" class="btn btn-outline-primary ">등록</button>
        <button type="button" class="btn btn-outline-danger ">삭제</button>
      </div>

      <div>
        <table id="myTable">
          <thead>
          <tr>
            <th>컬럼1</th>
            <th>컬럼2</th>
            <th>컬럼3</th>
          </tr>
          
          </thead>
        </table>
      </div>
    </div>
  </div>
</div>

<script>


</script>
</body>
</html>
