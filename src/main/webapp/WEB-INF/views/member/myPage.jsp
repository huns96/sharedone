<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마이페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js"
            integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <style>
        body { background-color: #e0e0e0; }
        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }

        #myPageModiBtn {
            margin-right: 10px;
            margin-bottom: 10px;
        }

        .form-control {
            width: 20%;
        }

    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row flex-nowrap">
            <my:Sidebar></my:Sidebar>
            <div class="col" style="margin-top: 40px; margin-right: 40px; margin-left: 40px;">
                <div class="page-background">
                    <div style="display: flex; justify-content: space-between">
                    <h4 style="font-weight: bold; margin-left: 10px; margin-top: 5px;">회원정보 수정</h4>
                        <div style="text-align: right;">
                            <input id="myPageModiBtn" class="btn btn-warning" type= "button" value="수정"/>
                        </div>
                    </div>
                    <form action="${pageContext.request.contextPath}/member/modifyMyPage" method="post" id="myPageModiForm">
                        <table class="table table-bordered" style="vertical-align: middle;">
                            <tbody>
                                <tr>
                                    <th style="width: 25%">회원명</th>
                                    <td><input class="form-control" id="myName" type="text" name="name" value="${userInfo.name}"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td style="display: flex; align-items: center;"><input class="form-control" id="myId" type="text" name="user_id" readonly value="${userInfo.user_id}"> <span style="margin-left: 10px">*변경불가</span></td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><input class="form-control" id="myPassword" type="password" name="password"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input class="form-control" id="myPhone" type="text" name="phone" value="${userInfo.phone}"></td>
                                </tr>
                                <tr>
                                    <th>권한</th>
                                    <td>${userInfo.auth}</td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script
            src="https://code.jquery.com/jquery-3.6.3.js"
            integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
            crossorigin="anonymous"></script>

    <script>
         $('#myPageModiBtn').click(function (){
            const form = document.forms.myPageModiForm
            if  ($('#myId').val() == "" ||
                ($('#myName').val() == "" ||
                ($('#myPassword').val() == "" ||
                ($('#myPhone').val() == "")))) {
                alert("입력되지 않은 정보가 있습니다.")
            } else {
                form.submit();
                alert("수정이 완료되었습니다");
            }

        });


    </script>
</body>
</html>
