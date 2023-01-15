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

        body { background-color: #e0e0e0; }
        .page-background {
            background-color: white;
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
        }

        .tit {
            margin-left: 50px;
            margin-top: 50px;

        }

        .getAuthoBtn {
            background-color: #5e5e5e;
            border-style: none;
            border-radius: 5px;
            color: white;
        }

        .modifyBtn {
            background-color: #f39c12;
            border-style: none;
            border-radius: 5px;
            color: white;
            width: 50px;
            height: 25px;
            text-align: center;
        }

        .deleteBtn {
            background-color: #ff3e51;
            border-style: none;
            border-radius: 5px;
            color: white;
            width: 50px;
            height: 25px;
        }

        .addMemberbtn {
            background-color: green;
            border-style: none;
            border-radius: 5px;
            color: white;
            margin-left: 50px;
            height: 30px;
        }

        .dupliCheckBtn {
            background-color: white;
            border-color: black;
            border-radius: 8px;
            color: black;
        }

        .search {
            margin-left: 50px;
            margin-top: 50px;
            margin-right: 50px;
        }

        .searchBtn {
            background-color: white;
            border-color: white;
        }
    </style>
</head>
<body>
<div class="container-fluid" style="padding: 0">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>

        <div class="col">
            <div class="search page-background">
                <form action="/member/list" method="get">
                <select name="" id="">
                    <option value="">전체</option>
                    <option value="이름">이름</option>
                    <option value="아이디">아이디</option>
                    <option value="연락처">연락처</option>
                    <option value="등록일">등록일</option>
                    <option value=권한">권한</option>
                </select>
                <input type="text" name="q" value="${param.q}">
                <button class="searchBtn">검색</button>
                </form>
            </div>
            <div class="col page-background" style="margin-left: 50px; margin-right: 50px">
                <div style="display: flex; justify-content: space-between">
                <h5>회원 목록</h5>
                <button style="margin-right: 30px;" class="addMemberbtn" data-bs-toggle="modal" data-bs-target="#addMemberModal">회원등록</button>
                </div>
                <table class="table" style="text-align: center">
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
                        <div hidden="hidden" id="pwpw">${mem.password}</div>
                        <tr>
                            <td>${mem.name}</td>
                            <td>${mem.user_id}</td>
                            <td>${mem.phone}</td>
                            <td>${mem.adddate}</td>
                            <td>${mem.auth}</td>
                            <td>
                                <button onclick="asd('${mem.user_id}','${mem.name}','${mem.phone}','${mem.auth}')"
                                        class="getAuthoBtn" data-bs-toggle="modal" data-bs-target="#getAuthoModal">권한변경
                                </button>
                                <button onclick="modi('${mem.user_id}','${mem.name}','${mem.phone}','${mem.password}')" class="modifyBtn"
                                        data-bs-toggle="modal" data-bs-target="#modifyModal">수정
                                </button>
                                <button onclick="dele('${mem.user_id}')" class="deleteBtn" data-bs-toggle="modal"
                                        data-bs-target="#deleteModal">삭제
                                </button>
                            </td>
                        </tr>

                    </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="row justify-content-center">
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
                                    <a class="page-link" href="${pageLink }?page=${pageNumb}&q=${param.q}">${pageNumb }</a>
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
                    회원명:&nbsp;&nbsp;&nbsp; <input type="text" name="name" id="nnName"> <br>
                    <br>
                    아이디:&nbsp;&nbsp;&nbsp; <input type="text" name="user_id" id="nnId">
                    <button type="button" class="dupliCheckBtn">아이디중복확인</button>
                    <div id="dupliMessage" class="form-text">아이디 중복을 확인해주세요</div>
                    <br>
                    비밀번호: <input type="password" name="password" id="nnPassword"> <br>
                    <br>
                    연락처:&nbsp;&nbsp;&nbsp; <input type="text" name="phone" id="nnPhone"> <br>
                    <input type="hidden" name="adduser" value="admin">
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
                        <th>권한</th>
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
                <div style="font-weight: bold; display: flex">부여할 권한
                <form method="post" id="setAuthoForm">
                    <select style="margin-left: 10px;" name="auth">
                        <option value="팀원">팀원</option>
                        <option value="팀장">팀장</option>
                        <option value="관리자">관리자</option>
                        <input id="userIdInput" type="hidden" name="user_id" value="">
                    </select>
                </div>
                    <br>
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <input id="authoChangeBtn" type="submit" class="btn btn-primary" value="권한추가" formaction="/member/setAutho"></input>
                <input id="authoDeleteBtn" type="submit" class="btn btn-danger" value="권한삭제" formaction="/member/deleteAutho"></input>
                </form>
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
                    <input id="modiPassword" type="hidden" name="password" value="">
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
    const ctx = "${pageContext.request.contextPath}";

    document.querySelector(".memberInsertBtn").addEventListener("click", function () {
        const memInsertForm = document.forms.memberInsertForm;
        if  ($('#nnName').val() == "" ||
            ($('#nnId').val() == "" ||
            ($('#nnPassword').val() == "" ||
            ($('#nnPhone').val() == "")))) {
            alert("입력되지 않은 정보가 있습니다.")
        } else{
        memInsertForm.submit();
        }
    });

    function asd(id, name, phone, auth) {
        $('#copyId').text(id);
        $('#copyName').text(name);
        $('#copyPhone').text(phone);
        $('#copyAutho').text(auth);
    }

    $('#authoChangeBtn').click(function () {
        $('#userIdInput').val($('#copyId').text());
    })

    const result = '${result}';
    if (result == "success") {
        alert("권한이 추가되었습니다.")
    } else if(result == "exist") {
        alert("이미 존재하는 권한입니다.")
    } else if(result == "error") {
        alert("알 수 없는 에러")
    };

    $('#authoDeleteBtn').click(function () {
        $('#userIdInput').val($('#copyId').text());
        const authMessage = '${authMustHaveOne}';
        if (authMessage == 1){
            alert("1개 남은 권한은 삭제가 불가합니다")
        } else {

        }
    })

    const deleteResult = '${deleteResult}';
    if (deleteResult == "success") {
        alert("권한이 삭제되었습니다.")
    } else if(deleteResult == "not exist") {
        alert("존재하지 않는 권한입니다")
    } else if(deleteResult == "error") {
        alert("알 수 없는 에러")
    };

    function modi(id, name, phone, password) {
        $('#modiId').val(id);
        $('#modiName').val(name);
        $('#modiPhone').val(phone);
        $('#modiPassword').val(password);
    }

    $('#modiBtn').click(function () {
        $('#modiForm').submit();
    })

    function dele(id) {
        $('#deleId').val(id);
    }

    $('#delBtn').click(function () {
        $('#delForm').submit();
    })

    $('.dupliCheckBtn').click(function(){
        const userId = $('#nnId').val();
        fetch("/member/existId/" + userId)
            .then(res => res.json())
            .then(data => {
                $('#dupliMessage').text(data.message);
            });
    });

</script>
</body>
</html>
