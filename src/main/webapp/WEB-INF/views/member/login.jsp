<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>메인페이지(로그인)</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js"
            integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div style="display: flex;">
        <my:Sidebar></my:Sidebar>
        <sec:authorize access="isAuthenticated()" var="login"></sec:authorize>
        <c:if test="${not login}">
        <div class="container">
            <div class="">
                <div class="col-12" style="text-align: center; width: 30%; margin: 250px auto 0;">
                    <h1><i class="fa-solid fa-umbrella"></i></h1>

                    <form method="post">

                        <div class="input-group mb-3">
					<span class="input-group-text">
						<i class="fa-solid fa-user"></i>
					</span>
                            <input type="text" name="username" class="form-control" placeholder="아이디">
                        </div>

                        <div class="input-group mb-3">
					<span class="input-group-text">
						<i class="fa-solid fa-key"></i>
					</span>
                            <input type="password" name="password" class="form-control" placeholder="암호">
                        </div>

                        <%--<div class="form-check form-switch mb-3">
                            <input class="form-check-input" name="remember-me" type="checkbox" role="switch"
                                   id="flexSwitchCheckChecked" checked>
                            <label class="form-check-label" for="flexSwitchCheckChecked">자동 로그인</label>
                        </div>--%>
                        <div class="d-grid gap-2 col-6 mx-auto">
                            <button class="btn btn-primary" type="submit">로그인</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${login}">
            <img src="${pageContext.request.contextPath}/content/img/bg2.jpg" alt="" style="width: 1500px; height: 937px; padding: 0">
        </c:if>
    </div>
</div>
<script
        src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
        crossorigin="anonymous"></script>
</body>
</html>
