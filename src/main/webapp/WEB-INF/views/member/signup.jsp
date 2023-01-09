<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>회원등록</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous">

</head>
<body>
    <div style="display: flex; height: 100%">
        <div><my:sideba111r></my:sideba111r></div>
        <div style="margin-left: 10px; width: 1200px">
            <div class="container-md" style="margin-top: 100px; margin-left: 150px;">
                <div class="row">
                    <div class="col">
                        <h1>회원등록</h1>

                        <form action="" method="post">
                            <div class="mb-3">
                                <label for="" class="form-label">
                                    이름
                                </label>

                                <div class="input-group">
                                    <input id="nameInput" class="form-control" type="text" name="name">
                                </div>

                            </div>

                            <div class="mb-3">
                                <label for="" class="form-label">
                                    아이디
                                </label>

                                <div class="input-group">
                                    <input id="userIdInput" class="form-control" type="text" name="id">
                                    <button id="userIdExistButton" class="btn btn-outline-secondary" type="button">중복확인</button>
                                </div>

                                <div id="userIdText" class="form-text">아이디 중복확인을 해주세요.</div>

                            </div>


                            <div class="mb-3">
                                <label for="" class="form-label">
                                    암호
                                </label>
                                <input id="passwordInput1" class="form-control" type="text" name="password">
                                <div id="passwordText1" class="form-text"></div>
                            </div>

                            <div class="mb-3">
                                <label for="" class="form-label">
                                    암호 확인
                                </label>
                                <input id="passwordInput2" class="form-control" type="text">
                            </div>

                            <div class="mb-3">
                                <label for="" class="form-label">
                                    연락처
                                </label>
                                <div class="input-group">
                                    <input id="phoneInput" class="form-control" type="text" name="phone">
                                </div>
                            </div>

                            <input <%--disabled--%> id="submitButton" class="btn btn-primary" type="submit" value="가입">

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
