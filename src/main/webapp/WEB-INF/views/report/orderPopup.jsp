<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주문번호 검색</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body { padding: 20px; }
        .footer { float: right; }
    </style>
</head>
<body>
<div id="orderPopup">
    <form action="/report/search/orderCodes">
        <div class="input-group" style="width: 300px">
    <input type="text" class="form-control">
        <input type="submit" class="form-control" value="검색">
        </div>
    </form>

    <h4><b>주문번호 목록</b></h4>
    <table class="table" id="buyer-table">
        <thead>
        <tr>
            <th></th>
            <th>#</th>
            <th>주문번호</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${orderCodes}" var="dorderCode" varStatus="status">
            <tr>
                <td><input type="checkbox" id="checkbox"></td>
                <td>${status.count}</td>
                <td>${dorderCode.order_code}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="footer">
        <button type="button" id="confirm" class="btn btn-danger">확인</button>
        <button type="button" class="btn btn-secondary" onclick="window.close()">취소</button>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">

    $(function() {
        // 체크박스 하나만 선택
        $("input[type='checkbox']").click(function() {
            if(this.checked) {
                const checkboxes = $("input[type='checkbox']");
                for(let ind = 0; ind < checkboxes.length; ind++){
                    checkboxes[ind].checked = false;
                }
                this.checked = true;
            } else {
                this.checked = false;
            }
        });

        /* 확인 버튼 */
        $('#confirm').click(function() {
            const checkbox = $('input[id=checkbox]:checked');
            const tr = checkbox.parent().parent();
            const td = tr.children();
            const orderCode = td.eq(2).text();
            // const buyerName = td.eq(3).text();

            // orderRegister의 setBuyerInfo()에 값 전달
            opener.setOrderCode(orderCode);
            window.close();
        });

    })

</script>
</body>
</html>
