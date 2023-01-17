<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주문 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body { padding: 20px; }
        table { text-align: center }
        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }
        h4 { margin-bottom: 20px; }
        input:read-only {
            background-color: #e0e0e0;
        }
        #item-button {
            padding-top: 32px;
            padding-left: 70px;
        }
        #tableDiv { margin: 10px; }
    </style>
</head>
<body>
<header>
    <h4><b>주문 수정</b></h4>
</header>
<form id="newOrderForm" class="form-horizontal">
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="newOrderCode" class="form-label">주문 코드</label>
            <input id="newOrderCode" type="text" class="form-control orderInfo" name="order_code" value="${order.order_code}" readonly/>
        </div>
        <div class="col-md-6 mb-3">
            <label for="newStatus" class="form-label">상태</label>
            <input id="newStatus" type="text"  class="form-control orderInfo" name="status" value="작성중" readonly />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="buyerCode" class="form-label">바이어코드</label>
            <div class="input-group">
                <input id="buyerCode" type="text" class="form-control orderInfo" name="buyer_code" value="${order.buyer_code}" placeholder="바이어코드를 검색해주세요." readonly/>
                <a id="buyerPopupButton" class="btn btn-outline-secondary" style="pointer-events:none;">검색</a>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="buyerName" class="form-label">바이어명</label>
            <input id="buyerName" type="text" class="form-control orderInfo" name="buyer_name" value="${order.buyer_name}" readonly/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="requestDate" class="form-label">납품요청일</label>
            <input id="requestDate" type="text" class="form-control orderInfo" name="request_date" value="${order.request_date}" readonly/>
        </div>
        <div class="col-md-6 mb-3">
            <label for="orderDate" class="form-label">주문일</label>
            <input id="orderDate" type="date" class="form-control orderInfo" name="order_date" value="${order.order_date}" readonly/>
        </div>
    </div>
    <div class="row">
        <div class="col mb-3">
            <label for="memo" class="form-label">주문메모</label>
            <textarea rows="3" id="memo" class="form-control orderInfo" name="memo">${order.memo}</textarea>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-6 mb-3">
            <label for="productCode" class="form-label">상품코드</label>
            <div class="input-group">
                <input id="productCode" type="text" class="form-control" name="product_code" required="required" placeholder="상품코드를 검색해주세요." readonly/>
                <button id="productPopupButton" class="btn btn-outline-secondary" type="button">검색</button>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <label for="productName" class="form-label">상품명</label>
            <input id="productName" type="text" class="form-control" name="product_name" readonly/>
        </div>
    </div>
    <div class="row">
        <div class="col-md-4 mb-3">
            <label for="price" class="form-label">단가</label>
            <input id="price" type="number" min="1" class="form-control" name="price" required="required" />
        </div>
        <div class="col-md-4 mb-3">
            <label for="quantity" class="form-label">수량</label>
            <input id="quantity" type="number" min="1" class="form-control" name="quantity" required="required" />
        </div>
        <div id="item-button" class="col-md-4 mb-3">
            <label class="form-label"></label>
            <button type="button" id="resetItemButton" class="btn btn-secondary">초기화</button>
            <button type="button" id="addNewItemButton" class="btn btn-success">상품추가</button>
        </div>
    </div>
    <div id="tableDiv" class="row">
        <table class="table table-hover" id="item-table">
            <thead>
            <tr>
                <th>#</th>
                <th>상품번호</th>
                <th>상품명</th>
                <th>수량</th>
                <th>단가</th>
                <th>총금액</th>
                <th>수정</th>
                <th>삭제</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${itemList}" var="item" varStatus="status">
                <tr>
                    <td>${status.count}</td>
                    <td>${item.product_code}</td>
                    <td>${item.product_name}</td>
                    <td>${item.quantity}</td>
                    <td><fmt:formatNumber value="${item.price}" pattern="#,###"/></td>
                    <%--<td>${item.price}</td>--%>
                    <td><fmt:formatNumber value="${item.total_price}" pattern="#,###"/></td>
                    <%--<td>${item.total_price}</td>--%>
                    <td>
                        <button type="button" class="btn btn-outline-warning btn-sm" onclick="modifyItem(${status.count})">수정</button>
                    </td>
                    <td>
                        <button type="button" class="btn btn-outline-danger btn-sm" onclick="removeItem(${status.count})">삭제</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</form>

<footer style="float: right; justify-content: flex-end; margin-bottom: 20px;">
    <button type="button" id="modifyOrderSubmitButton" class="btn btn-primary">주문수정</button>
    <button type="button" class="btn btn-secondary" onclick="window.close();">취소</button>
</footer>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript">

    let orderItemList = [];
    let oldItemList = []; // 기존 상품 리스트
    let list;
    <c:forEach items="${itemList}" var="item">
        list = [];
        list.push("${item.product_code}");
        list.push("${item.product_name}");
        list.push("${item.quantity}");
        list.push("${item.price}");
        list.push("${item.total_price}");
        oldItemList.push(list);
        orderItemList.push(list);
    </c:forEach>
    let addItemList = []; // 추가된 상품 리스트
    let removeItemList = []; // 삭제된 상품 리스트
    let modifyItemList = []; // 수정된 상품 리스트
    let modifyFlag = false; // 수정 여부
    let modifyIndex; // 수정할 상품의 index

    //setItemList();

    $(function() {
        /* 상품 검색 팝업창 */
        $('#productPopupButton').click(function() {
            let requestDate = $.trim($('#requestDate').val());

            if (requestDate == "") $('#requestDate').focus();
            else {
                // [TODO] 상품코드를 직접 검색하는 경우 팝업창으로 상품코드 전달 - 팝업창 검색 기능 작업 이후
                // if ($('#newProductCode').val().trim() != "")
                itemPopup();
            }
        });

        /* 상품 추가 버튼 */
        $('#addNewItemButton').click(function() {
            let requestDate = $.trim($('#requestDate').val());
            let productCode = $.trim($('#productCode').val());
            let productName = $.trim($('#productName').val());
            let price = $.trim($('#price').val());
            let quantity = $.trim($('#quantity').val());

            if (requestDate == "") $('#requestDate').focus();
            else {
                if (productCode != "" && productName != "" && price != "" && quantity != "") {
                    addOrderItem();
                }
                if (productCode == "" || productName == "")  itemPopup();
                if (price == "") $('#price').focus();
                if (quantity == "") $('#quantity').focus();
            }
        });

        /* 상품 초기화 버튼 */
        $('#resetItemButton').click(function() {
            resetItemInfo();
        });

        /* 주문 수정 전송 버튼 */
        $('#modifyOrderSubmitButton').click(function() {
            modifyOrder();
        });

    });

    /* 상품 검색 팝업창 */
    function itemPopup() {
        resetItemInfo();
        let url = "/search/productPopup?buyer_code=" + $('#buyerCode').val()
            + "&request_date=" + $('#requestDate').val().replaceAll("-", "");
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }
    // 상품 정보 추가
    window.setItemInfo = function (itemCode, itemName, category, price) {
        $('#productCode').val(itemCode);
        $('#productName').val(itemName);
        // $('#newCategory').val(category);
        $('#price').val(price);
    }

    /* 주문 상품 추가 */
    function addOrderItem() {
        let productCode = $('#productCode').val();
        let productName = $('#productName').val();
        let quantity = $('#quantity').val();
        let price = $('#price').val();
        let totalPrice = quantity * price;

        // 상품 수정인 경우 해당 상품 삭제 후 변경사항 추가
        if (modifyFlag) {
            orderItemList.splice(modifyIndex,1);
            getItemList(orderItemList);
        }

        // 상품 중복 확인
        let dupli = false;
        for(var i = 0; i<orderItemList.length; i++) {
            if (orderItemList[i][0] == productCode) {
                dupli = true;
                break;
            }
        }
        if (dupli == false) {
            const itemList = [productCode, productName, quantity, price, totalPrice];
            orderItemList.push(itemList);

            let existListflag = "false";
            for (var i = 0; i<oldItemList.length; i++) {
                if (oldItemList[i][0] == itemList[0]) {
                    existListflag = "true";
                    if (oldItemList[i][2] == itemList[2] && oldItemList[i][3] == itemList[3]) {
                        existListflag = "-";
                    }
                    break;
                }
            }
            console.log(existListflag);
            if (existListflag == "true") {
                for(var i = 0; i<modifyItemList.length; i++) {
                    if (modifyItemList[i][0] == itemList[0]) {
                        modifyItemList.splice(i,1);
                        break;
                    }
                }
                modifyItemList.push(itemList); // 수정한 상품
            } else if (existListflag == "false") {
                for(var i = 0; i<addItemList.length; i++) {
                    if (addItemList[i][0] == itemList[0]) {
                        addItemList.splice(i,1);
                        break;
                    }
                }
                addItemList.push(itemList); // 새로 추가한 상품
            } else {
                for(var i = 0; i<modifyItemList.length; i++) {
                    if (modifyItemList[i][0] == itemList[0]) {
                        modifyItemList.splice(i,1);
                        break;
                    }
                }
                for(var i = 0; i<addItemList.length; i++) {
                    if (addItemList[i][0] == itemList[0]) {
                        addItemList.splice(i,1);
                        break;
                    }
                }
            }

            for (var i = 0; i<removeItemList.length; i++) {
                if (removeItemList[i][0] == itemList[0]) {
                    removeItemList.splice(i, 1);
                    break;
                }
            }
            itemListInPopup(itemList, orderItemList);

        } else {
            alert("상품번호 " + productCode + "가 중복됩니다.");
        }
        resetItemInfo();
        modifyFlag = false;
    }

    /* 주문상품 리스트 추가 */
    function itemListInPopup(itemList, orderItemList) {
        let tbody = $('#item-table tbody');
        tbody.append("");
        tbody.append(
            "<tr>"
            + "<td>" + orderItemList.length + "</td>"
            + "<td>" + itemList[0] + "</td>"
            + "<td>" + itemList[1] + "</td>"
            + "<td>" + parseInt(itemList[2]).toLocaleString() + "</td>"
            + "<td>" + parseInt(itemList[3]).toLocaleString() + "</td>"
            + "<td>" + parseInt(itemList[4]).toLocaleString() + "</td>"
            + "<td style='width: 80px;'>"
            +    "<button type='button' class='btn btn-outline-warning btn-sm' onclick='modifyItem(" + orderItemList.length + ")'>수정</button>"
            + "</td>"
            + "<td style='width: 80px;'>"
            +    "<button type='button' class='btn btn-outline-danger btn-sm' onclick='removeItem(" + orderItemList.length + ")'>삭제</button>"
            + "</td>"
            + "</tr>"
        );
    }

    /* 주문상품 리스트 조회 */
    function getItemList(orderItemList) {
        let tbody = $('#item-table tbody');
        tbody.empty(); //초기화
        tbody.append("");
        for (var i = 0; i < orderItemList.length; i++) {
            tbody.append(
                "<tr>"
                + "<td>" + orderItemList.length + "</td>"
                + "<td>" + orderItemList[i][0] + "</td>"
                + "<td>" + orderItemList[i][1] + "</td>"
                + "<td>" + parseInt(orderItemList[i][2]).toLocaleString() + "</td>"
                + "<td>" + parseInt(orderItemList[i][3]).toLocaleString() + "</td>"
                + "<td>" + parseInt(orderItemList[i][4]).toLocaleString() + "</td>"
                + "<td style='width: 80px;'>"
                +    "<button type='button' class='btn btn-outline-warning btn-sm' onclick='modifyItem(" + orderItemList.length + ")'>수정</button>"
                + "</td>"
                + "<td style='width: 80px;'>"
                +    "<button type='button' class='btn btn-outline-danger btn-sm' onclick='removeItem(" + orderItemList.length + ")'>삭제</button>"
                + "</td>"
                + "</tr>"
            );
        }

    }

    /* 상품 삭제 */
    function removeItem(index) {
        //let existListflag = false;
        let removeList = orderItemList[index-1];
        for (var i = 0; i<oldItemList.length; i++) {
            if (oldItemList[i][0] == removeList[0]) {
                removeItemList.push(removeList); // 삭제한 상품 리스트
                break;
            }
        }

        // 상품 삭제일 경우에는 addItemList와 modifyItemList에서 삭제
        for (var i = 0; i<addItemList.length; i++) {
            if (addItemList[i][0] == removeList[0]) {
                addItemList.splice(i, 1);
                break;
            }
        }
        for (var i = 0; i<modifyItemList.length; i++) {
            if (modifyItemList[i][0] == removeList[0]) {
                modifyItemList.splice(i, 1);
                break;
            }
        }
        orderItemList.splice(index-1, 1);
        getItemList(orderItemList);
    }

    /* 상품 수정 정보 가져오기*/
    function modifyItem(index) {
        index = index-1;
        let list = orderItemList[index];
        $('#productCode').val(list[0]);
        $('#productName').val(list[1]);
        $('#quantity').val(list[2]);
        $('#price').val(list[3]);
        $('#productPopupButton').attr('style','pointer-events:none;');
        modifyIndex = index;
        modifyFlag = true;
    }


    /* 상품입력창 초기화 */
    function resetItemInfo() {
        $('#productPopupButton').removeAttr('style');
        $('#productCode').val("");
        $('#productName').val("");
        $('#quantity').val("");
        $('#price').val("");
    }

    /* 주문 수정 */
    function modifyOrder() {
        let queryString = $(".orderInfo").serialize();
        /*console.log('orderItemList');
        console.log(orderItemList);
        console.log('oldItemList');
        console.log(oldItemList);
        console.log('addItemList');
        console.log(addItemList);
        console.log('removeItemList');
        console.log(removeItemList);
        console.log('modifyItemList');
        console.log(modifyItemList);*/
        $.ajax({
            type: 'POST',
            url: '/order/modify',
            data: queryString,
            success: function (data) {
                console.log(data);
                var objParams = {
                    "addItems" : addItemList,
                    "removeItems" : removeItemList,
                    "modifyItems" : modifyItemList,
                    "orderCode" : data
                };
                $.ajax({
                    type: 'POST',
                    url: '/order/modifyItem',
                    data: objParams,
                    dataType : 'json',
                    traditional: true,
                    success: function (result) {
                        console.log(result);

                    }
                });
            }
        });

        setTimeout(function () {
            opener.parent.location.reload();
            window.close();
        }, 1000);
    }

</script>
</body>
</html>
