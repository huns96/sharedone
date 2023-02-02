<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>바이어 등록</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/css/bootstrap.min.css" integrity="sha512-N415hCJJdJx+1UBfULt+i+ihvOn42V/kOjOpp1UTh4CZ70Hx5bDlKryWaqEKfY/8EYOu/C2MuyaluJryK1Lb5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js" integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<body>
<form action="${pageContext.request.contextPath}/buyer/register" method="post" id="registerForm">
    <div class="mb-3">
        <label class="col-form-label">바이어 명:</label>
        <input type="text" class="form-control" name="name" required id="name" placeholder="한글/영문">
    </div>

    <div class="mb-3">
        <label class="col-form-label">바이어 주소:</label>
        <input type="text" class="form-control" name="address" required id="address" placeholder="한글/영문">
    </div>

    <div class="mb-3">
        <label class="col-form-label">바이어 국적:</label>
        <select name="country" id="country" class="form-select">
            <option selected="selected" value="" disabled>SELECTED</option>
            <option value="AU">Australia</option>
            <option value="CA">Canada</option>
            <option value="EN">England</option>
            <option value="KO">Korea</option>
            <option value="FR">France</option>
            <option value="GE">Germany</option>
        </select>
        <%--                                        <input type="text" class="form-control" name="country" required id="country">--%>
    </div>

    <div class="mb-3">
        <label class="col-form-label">사업자 번호:</label>
        <input type="text" class="form-control" name="license" required id="license"
               placeholder="사업자번호 ex)111-22-33333">
    </div>

    <div class="mb-3">
        <label class="col-form-label">전화 번호:</label>
        <input type="text" class="form-control" name="contact" required id="contact" placeholder="전화번호 ex)02-123-4567">
    </div>

</form>
<button id="buyerAddBtn" class="btn btn-primary" type="button">추가</button>
<hr>

<h1>등록 예정 목록</h1>
<table class="table">
    <thead>
        <tr>
            <th>바이어 명</th>
            <th>바이어 주소</th>
            <th>바이어 국적</th>
            <th>사업자 번호</th>
            <th>전화 번호</th>
            <th>삭제</th>
        </tr>
    </thead>
    <tbody id="buyerBody"></tbody>
</table>

<button onclick="submitAddBuyer()" class="btn btn-success">등록</button>
<button onclick="window.close();" class="btn btn-secondary">취소</button>

<script>

    const buyerItemList = [];

    $('#buyerAddBtn').click(function() {
        let name = $('#name').val()
        let address = $('#address').val()
        let country = $('#country').val()
        let license = $('#license').val()
        let contact = $('#contact').val()
        const itemList = [name, address, country, license, contact];
        buyerItemList.push(itemList);
        insertBuyerItem(itemList, buyerItemList);
    })

    function insertBuyerItem(itemList, buyerItemList) {
        $('#buyerBody').append(
            '<tr>' +
            '<td>' + itemList[0] + '</td>' +
            '<td>' + itemList[1] + '</td>' +
            '<td>' + itemList[2] + '</td>' +
            '<td>' + itemList[3] + '</td>' +
            '<td>' + itemList[4] + '</td>' +
            '<td>' + '<button class="btn btn-danger" onclick="addBuyerDelete(' + buyerItemList.length + ')">삭제</button>' + '</td>' +
            '</tr>'
        )
    }

    function addBuyerDelete(index) {
        buyerItemList.splice(index-1, 1);
        afterDelete(buyerItemList);
    }

    function afterDelete(buyerItemList) {
        $('#buyerBody').empty();
        for (let i = 0; i < buyerItemList.length; i++) {
            $('#buyerBody').append(
                '<tr>' +
                '<td>' + buyerItemList[i][0] + '</td>' +
                '<td>' + buyerItemList[i][1] + '</td>' +
                '<td>' + buyerItemList[i][2] + '</td>' +
                '<td>' + buyerItemList[i][3] + '</td>' +
                '<td>' + buyerItemList[i][4] + '</td>' +
                '<td>' + '<button class="btn btn-danger" onclick="addBuyerDelete(' + buyerItemList.length + ')">삭제</button>' + '</td>' +
                '</tr>'
            )
        }
    }

    function submitAddBuyer() {
        var objParams = {"param" : buyerItemList};
        $.ajax({
            type: 'POST',
            url: '${pageContext.request.contextPath}/buyer/register',
            data: objParams,
            traditional: true,
            data_type : 'JSON',
            success: function (data) {
                opener.parent.location.reload();
                window.close()
            }
        })
        console.log(buyerItemList);
    }


</script>
</body>
</html>
