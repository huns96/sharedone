<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-01-07
  Time: 오후 3:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/css/bootstrap.min.css" integrity="sha512-N415hCJJdJx+1UBfULt+i+ihvOn42V/kOjOpp1UTh4CZ70Hx5bDlKryWaqEKfY/8EYOu/C2MuyaluJryK1Lb5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js" integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
    body{
        background-color: lightgray;
    }

    tr > .table-head{
        text-align: center;
        background-color:lightgray;
    }

    tbody .row-head{
        text-align:center;
        vertical-align: middle;
    }

    tr > .td-body{
        text-align: center;
    }
</style>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="col py-3 mt-5" style="margin: 60px;">
            <div class="p-3 mt-3 mb-3" style="background-color: white;">
                서치바
            </div>

            <div class="toast align-items-center text-white bg-primary border-0" role="alert" aria-live="assertive" aria-atomic="true">
                <div class="d-flex">
                    <div class="toast-body" id="toastMsg">
                        ${message}
                    </div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
            </div>

            <div style="height: 500px; background-color:white;" class="mb-5">
                <div class="row p-2 justify-content-between">
                    <div class="col-4 mt-3"><h5 style="font-weight: bold;">주문 목록</h5></div>
                    <div class="col-2 mt-3" style="text-align: right;">
                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#registerModal">등록</button>
                        <button class="btn btn-danger">삭제</button>
                    </div>
                </div>
                <!-- Modal -->
                <div class="modal" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">바이어 등록</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/buyer/register" method="post" id="registerForm">
                                    <div class="mb-3">
                                        <label class="col-form-label">바이어 명:</label>
                                        <input type="text" class="form-control" name="name" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">바이어 주소:</label>
                                        <input type="text" class="form-control" name="address" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">바이어 국적:</label>
                                        <input type="text" class="form-control" name="country" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">사업자 번호:</label>
                                        <input type="text" class="form-control" name="license" required>
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">CONTACT?:</label>
                                        <input type="text" class="form-control" name="contact" required>
                                    </div>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button id="registerConfirm" type="button" class="btn btn-primary" onclick="registerBuyer()">등록</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <table class="table table-bordered border border-5">
                        <thead><!-- table 기호에 맞게 -->
                        <tr> <!-- 데이터 받으면 그때 for문 -->
                            <th scope="col" class="table-head">#</th>
                            <th scope="col" class="table-head">바이어코드</th>
                            <th scope="col" class="table-head">이름</th>
                            <th scope="col" class="table-head">주소</th>
                            <th scope="col" class="table-head">국적</th>
                            <th scope="col" class="table-head">사업자번호</th>
                            <th scope="col" class="table-head">CONTACT</th>
                            <th scope="col" class="table-head">작성자</th>
                            <th scope="col" class="table-head">작성일</th>
                            <th scope="col" class="table-head">수정자</th>
                            <th scope="col" class="table-head">수정일</th>
                            <th scope="col" class="table-head" style="width: 5%;"></th>
                        </tr>
                        </thead>
                        <tbody>

                        <c:forEach var="item" items="${buyerList}" varStatus="status">
                            <tr>
                                <th scope="row" class="row-head">
                                    <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                    <label class="form-check-label" for="flexCheckDefault">

                                    </label>
                                </th>
                                <td class="td-body">${item.buyer_code}</td>
                                <td class="td-body">${item.name}</td>
                                <td class="td-body">${item.address}</td>
                                <td class="td-body">${item.country}</td>
                                <td class="td-body">${item.license}</td>
                                <td class="td-body">${item.contact}</td>
                                <td class="td-body">${item.adduser}</td>
                                <td class="td-body">${item.adddate}</td>
                                <td class="td-body">${item.upduser}</td>
                                <td class="td-body">${item.upddate}</td>
                                <td>
                                    <div class="d-flex justify-content-center" style="margin: 0;">
                                        <button class="btn btn-warning btn-sm" style="color: white;" id=`modify${item.buyer_code}` onclick="modifyFunc(id)">수정</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

</div>
    <script>
    function registerBuyer(){
        document.querySelector("#registerForm").submit();
    }

    function modifyFunc(id){
        alert(id);
    }


    </script>
</body>
</html>
