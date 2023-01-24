<%--
  Created by IntelliJ IDEA.
  User: hs
  Date: 2023-01-23
  Time: 오후 2:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
          integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js"
            integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <style>
        .dupliCheckBtn {
            background-color: #6c757d;
            border-style: none;
            border-radius: 8px;
            color: white;
        }

        .inputInfo{
            width: 300px;
        }

        span {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div style="margin-left: 20px; margin-top: 20px;">
    <form>
        <span>회원명</span>
        <input style="margin-bottom: 15px;" class="form-control inputInfo" type="text" name="name" id="nnName">

        <span>아이디</span>
        <div style="display: flex">
            <input class="form-control inputInfo" type="text" name="user_id" id="nnId">
            <button style="margin-left: 10px" type="button" class="dupliCheckBtn">중복확인</button>
        </div>
        <div style="margin-bottom: 15px;" id="dupliMessage" class="form-text">아이디 중복을 확인해주세요</div>

        <span>비밀번호</span>
        <input style="margin-bottom: 15px;" class="form-control inputInfo" type="password" name="password" id="nnPassword">

        <span>연락처</span>
        <input style="margin-bottom: 15px;" class="form-control inputInfo" type="text" name="phone" id="nnPhone">


        <button id="addListBtn" type="button" class="btn btn-primary" disabled>추가</button>
        <hr>
        <div style="margin-top: 15px; font-weight: bold;"> - 등록할 회원 목록 -</div>
        <table class="table" id="addMemberTable" style="text-align: center;">
            <thead>
                <tr>
                    <th width="10%">#</th>
                    <th width="15%">회원명</th>
                    <th width="15%">아이디</th>
                    <th width="20%">비밀번호</th>
                    <th width="20%">연락처</th>
                    <th width="10%">삭제</th>
                </tr>
            </thead>
            <tbody></tbody>
    </table>
    </form>
    <button class="btn btn-secondary" onclick="window.close()">취소</button>
    <button onclick="addNewMember()" type="button" class="btn btn-success">등록</button>
</div>
<script
        src="https://code.jquery.com/jquery-3.6.3.js"
        integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
        crossorigin="anonymous">
</script>
<script>
    let availableId = false;
    const memberItemList = [];




    /*아이디 중복 확인*/
    $('.dupliCheckBtn').click(function () {
        availableId = false;
        const userId = $('#nnId').val();
        fetch("/member/existId/" + userId)
            .then(res => res.json())
            .then(data => {
                $('#dupliMessage').text(data.message);
                if (data.status == "not exist") {
                    availableId = true;
                    enableSubmitButton();
                }
            });
    });

    /*빈칸이 있는지 유효성 검사*/
    document.querySelector("#addListBtn").addEventListener("click", function () {
        if ($('#nnName').val() == "" ||
           ($('#nnId').val() == "" ||
           ($('#nnPassword').val() == "" ||
           ($('#nnPhone').val() == "")))) {
            alert("입력되지 않은 정보가 있습니다.")
        } else {
            addListItem()
        }
    });

    /*아이디 중복 확인 후 등록 버튼 활성화*/
    function enableSubmitButton() {
        const button = $('#addListBtn');
        if (availableId == true) {
            button.removeAttr('disabled');
        } else {
            button.setAttribute('disabled', "");
        }
    }

    /*input의 값들을 List로 만듦*/
    function addListItem(){
        let name = $('#nnName').val();
        let user_id = $('#nnId').val();
        let password = $('#nnPassword').val();
        let phone = $('#nnPhone').val();

        const itemList = [name, user_id, password, phone];
        memberItemList.push(itemList);
        insertAddList(itemList, memberItemList)
    };

    /*만들어진 List를 불러와서 tbody에 입력*/
    function insertAddList(itemList, memberItemList) {
        let tbody = $('#addMemberTable tbody');
        tbody.append("");
        tbody.append(
            "<tr>"
            + "<td >" + memberItemList.length + "</td>"
            + "<td>" + itemList[0] + "</td>"
            + "<td>" + itemList[1] + "</td>"
            + "<td>" + itemList[2] + "</td>"
            + "<td>" + itemList[3] + "</td>"
            + "<td width='10%'>"
            +    "<button type='button' class='btn btn-outline-danger btn-sm' onclick='removeItem(" + memberItemList.length + ")'>삭제</button>"
            + "</td>"
            + "</tr>"
        );
    }

    /*추가 회원 목록 삭제되고 남은 목록 출력*/
    function getItemList(memberItemList) {
        let tbody = $('#addMemberTable tbody');
        tbody.empty(); //초기화
        for (var i = 0; i < memberItemList.length; i++) {
            let index = i + 1;
        tbody.append(
            "<tr>"
            + "<td>" + index + "</td>"
            + "<td>" + memberItemList[i][0] + "</td>"
            + "<td>" + memberItemList[i][1] + "</td>"
            + "<td>" + memberItemList[i][2] + "</td>"
            + "<td>" + memberItemList[i][3] + "</td>"
            + "<td width='10%'>"
            +    "<button type='button' class='btn btn-outline-danger btn-sm' onclick='removeItem(" + memberItemList.length + ")'>삭제</button>"
            + "</td>"
            + "</tr>"
            );
        }
    }

    /*추가 할 회원 목록에서 삭제*/
    function removeItem(index) {
        memberItemList.splice(index-1, 1);
        getItemList(memberItemList);
    };

    function addNewMember() {
        //let memberData = memberItemList.serialize();
        $.ajax({
            type: 'POST',
            url: '/member/addMember',
            data: memberItemList,
            success: function (data) {
            }
        })
        console.log(memberItemList)
    };

</script>
</body>
</html>
