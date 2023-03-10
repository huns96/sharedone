<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>MEMBER LIST</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js"
            integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>

        body {
            background-color: #e0e0e0;
        }

        .page-background {
            background-color: white;
            padding: 10px 0px 10px 0px;
            margin: 5px;
            border-radius: 5px;
        }


        .modifyBtn {
            width: 60px;
        }

        .deleteBtn {
            width: 60px;

        }

        .search {
            margin: 40px 40px 10px;
        }

        .getAuthoBtn{
            width: 90px;
        }

        .tableName {
            margin-left: 10px;
            font-weight: bold;
            margin-bottom: 0px;
            margin-top: 5px;
        }

    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>

        <div class="col">
            <div class="search page-background" >
                <form action="${pageContext.request.contextPath}/member/list" method="get" style="margin: 0;">
                <input class="form-control" type="text" name="q" value="${param.q}" style="width: 200px; display: inline; margin-left: 16px;" placeholder="????????????">
                <button class="btn btn-dark" style="margin-bottom: 4px;">??????</button>
                </form>
            </div>
            <div class="col page-background" style="margin-left: 40px; margin-right: 40px">
                <div style="display: flex; justify-content: space-between">
                    <h4 class="tableName">?????? ??????</h4>
                    <button style="margin-right: 30px; margin-bottom: 10px;" class="addMemberbtn btn btn-success">
                        ????????????
                    </button>
                </div>
                <table class="table table-hover" style="text-align: center; table-layout: fixed;">
                    <thead>
                    <tr style="background-color:  #e0e0e0; border-bottom: black;">
                        <th>??????</th>
                        <th>?????????</th>
                        <th>?????????</th>
                        <th>?????????</th>
                        <th width="10%">??????</th>
                        <th></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${memberList}" var="mem" varStatus="sts">

                        <tr style="vertical-align: middle;">
                            <td>${mem.name}</td>
                            <td>${mem.user_id}</td>
                            <td>${mem.phone}</td>
                            <td>${mem.adddate}</td>
                            <td>${mem.auth}</td>
                            <td style="display: none">${mem.password}</td>
                            <td>
                                <button onclick="asd('${mem.user_id}','${mem.name}','${mem.phone}','${mem.auth}')"
                                        class="getAuthoBtn btn btn-secondary" data-bs-toggle="modal" data-bs-target="#getAuthoModal">????????????
                                </button>
                                <button onclick="modi('${mem.user_id}','${mem.name}','${mem.phone}','${mem.password}')"
                                        class="modifyBtn btn btn-warning"
                                        data-bs-toggle="modal" data-bs-target="#modifyModal">??????
                                </button>
                                <button onclick="dele('${mem.user_id}')" class="deleteBtn btn btn-danger" data-bs-toggle="modal"
                                        data-bs-target="#deleteModal">??????
                                </button>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            <div class="row justify-content-center" style="margin-left: 110px;">
                <div class="col-3">
                    <nav aria-label="Page navigation example">
                        <ul class="pagination">
                            <li class="page-item">
                                <c:url value="/member/list" var="pageLink"></c:url>
                                <a class="page-link" href="${pageLink }?page=1&q=${param.q}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                            <c:forEach begin="1" end="${pages }" varStatus="status" var="pageNumb">
                                <li class="page-item ${pageNum == pageNumb ? "active" : ""}">
                                    <a class="page-link"
                                       href="${pageLink }?page=${pageNumb}&q=${param.q}">${pageNumb }</a>
                                </li>
                            </c:forEach>
                            <li class="page-item">
                                <a class="page-link" href="${pageLink }?page=${pages}&q=${param.q}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            </div>

        </div>
    </div>
</div>

<%--<!-- ?????? ?????? Modal -->
<div class="modal fade" id="addMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">?????? ??????</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/member/addMember" method="post" id="memberInsertForm">
                    <table class="table">
                        <tr>
                            <th>?????????</th>
                        </tr>
                        <tr>
                            <td><input type="text" name="name" id="nnName"></td>
                        </tr>
                        <tr>
                            <th>?????????</th>
                        </tr>
                        <tr>
                            <td><input type="text" name="user_id" id="nnId">
                                <button type="button" class="dupliCheckBtn">????????????</button>
                                <div id="dupliMessage" class="form-text">????????? ????????? ??????????????????</div>
                            </td>
                        </tr>
                        <tr>
                            <th>????????????</th>
                        </tr>
                        <tr>
                            <td>
                                <input type="password" name="password" id="nnPassword">
                            </td>
                        </tr>
                        <tr>
                            <th>?????????</th>
                        </tr>
                        <tr>
                            <td><input type="text" name="phone" id="nnPhone"></td>
                        </tr>
                    </table>
                    <input type="hidden" name="adduser" value="admin">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                <button type="button" class="btn btn-primary memberInsertBtn" disabled>??????</button>
            </div>
        </div>
    </div>
</div>--%>


<!-- ?????? ?????? Modal -->
<div class="modal fade" id="getAuthoModal" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel2">?????? ??????</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table" style="text-align: center">
                    <thead>
                    <tr>
                        <th>?????????</th>
                        <th>?????????</th>
                        <th>?????????</th>
                        <th>??????</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><span id="copyName"></span></td>
                        <td><span id="copyId"></span></td>
                        <td><span id="copyPhone"></span></td>
                        <td><span id="copyAutho"></span></td>
                    </tr>
                    </tbody>
                </table>
                <div style="font-weight: bold; display: flex">????????? ??????
                    <form method="post" id="setAuthoForm">
                        <select style="margin-left: 10px;" name="auth">
                            <option value="??????">??????</option>
                            <option value="??????">??????</option>
                            <option value="?????????">?????????</option>
                            <input id="userIdInput" type="hidden" name="user_id" value="">
                        </select>
                </div>
                <br>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                <input id="authoChangeBtn" type="submit" class="btn btn-primary" value="????????????"
                       formaction="${pageContext.request.contextPath}/member/setAutho"></input>
                <input id="authoDeleteBtn" type="submit" class="btn btn-danger" value="????????????"
                       formaction="${pageContext.request.contextPath}/member/deleteAutho"></input>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- ?????? Modal -->
<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">?????? ?????? ??????</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="${pageContext.request.contextPath}/member/modifyMember" method="post" id="modiForm">
                    <table class="table">
                        <thead>
                        <tr>
                            <th>?????????</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input id="modiName" type="text" name="name" value=""></td>
                        </tr>
                        </tbody>
                        <thead>
                        <tr>
                            <th>?????????</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input id="modiId" type="text" name="user_id" value="" readonly></td>
                        </tr>
                        </tbody>
                        <thead>
                        <tr>
                            <th>?????????</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input id="modiPhone" type="text" name="phone" value=""></td>
                        </tr>
                        </tbody>
                    </table>
                    <input id="modiPassword" type="hidden" name="password" value="">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                <button id="modiBtn" type="button" class="btn btn-warning" style="color: white">??????</button>
            </div>
        </div>
    </div>
</div>

<!-- ?????? Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">?????? ??????</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ?????? ????????? ?????????????????????????
                <form action="${pageContext.request.contextPath}/member/deleteMember" method="post" id="delForm">
                    <input id="deleId" type="hidden" name="user_id">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">??????</button>
                <button id="delBtn" type="button" class="btn btn-danger">??????</button>
            </div>
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
    const ctx = "${pageContext.request.contextPath}";
    let availableId = false;


    /*?????? ????????? ?????? ????????? ?????????*/
    function asd(id, name, phone, auth) {
        $('#copyId').text(id);
        $('#copyName').text(name);
        $('#copyPhone').text(phone);
        $('#copyAutho').text(auth);
    }

    /*????????? ????????? user_id ?????? form??? ??????*/
    $('#authoChangeBtn').click(function () {
        $('#userIdInput').val($('#copyId').text());
    })

    /*?????? ????????? ????????? ??????*/
    const result = '${result}';
    if (result == "success") {
        alert("????????? ?????????????????????.")
    } else if (result == "exist") {
        alert("?????? ???????????? ???????????????.")
    } else if (result == "error") {
        alert("??? ??? ?????? ??????")
    };

    /*????????? ????????? user_id ?????? form??? ??????*/
    $('#authoDeleteBtn').click(function () {
        $('#userIdInput').val($('#copyId').text());
    })

    /*????????? ????????? ????????? ??? ?????? ??????????????? ????????? ??????*/
    const authMessage = '${authMustHaveOne}';
    if (authMessage == 1) {
        alert("1??? ?????? ????????? ????????? ???????????????")
    } else {
    };

    /*?????? ????????? ????????? ??????*/
    const deleteResult = '${deleteResult}';
    if (deleteResult == "success") {
        alert("????????? ?????????????????????.")
    } else if (deleteResult == "not exist") {
        alert("???????????? ?????? ???????????????")
    } else if (deleteResult == "error") {
        alert("??? ??? ?????? ??????")
    };

    /*???????????? ????????? ?????? ?????? ?????????*/
    function modi(id, name, phone, password) {
        $('#modiId').val(id);
        $('#modiName').val(name);
        $('#modiPhone').val(phone);
        $('#modiPassword').val(password);
    }

    /*???????????? ????????? ????????? ????????? ??????*/
    $('#modiBtn').click(function () {
        if ($('#modiId').val() == "" ||
            ($('#modiName').val() == "" ||
                ($('#modiPhone').val() == "" ||
                    ($('#modiPassword').val() == "")))) {
            alert("???????????? ?????? ????????? ????????????.")
        } else {
            $('#modiForm').submit();
        }})

    /*?????? ????????? form??? ?????? user_id ??? ??????*/
    function dele(id) {
        $('#deleId').val(id);
    }

    /*???????????? ???????????? ????????? ?????? form ??????*/
    $('#delBtn').click(function () {
        $('#delForm').submit();
    })


    /*???????????? ?????? ????????? ?????????*/
    $('.addMemberbtn').click(function() {
        let url = "${pageContext.request.contextPath}/member/addMembers";
        let popupWidth = 800;
        let popupHeight = 800;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    });


</script>
</body>
</html>
