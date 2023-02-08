<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>판매가 수정</title>
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/content/css/date.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/content/css/price.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body { padding: 20px; }
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
            padding-left: 30px;
        }
        #tableDiv { margin: 10px; }

        input[type="date"]::-webkit-calendar-picker-indicator { display: none; -webkit-appearance: none; appearance: none; }
    </style>
</head>
<body>
<header>
    <h4><b>판매가 수정</b></h4>
</header>

<form class="modifyForm" id="modifyForm" action="${pageContext.request.contextPath}/price/modify" method="post" enctype="multipart/form-data" style="margin: auto;  height: 664px;" >
    <div style="margin: 20px;">
        <div class="mb-3 mx-4 row">
            <div class="col-md-6 mb-3">
                <label class="form-label">바이어코드</label>
                <input class="form-control"  id="buyerCodeInput" required="required" type="text" name="buyer_code" placeholder="바이어 코드" <%--data-bs-toggle="modal" data-bs-target="#buyerModal"--%>value="${price.buyer_code}" disabled style="text-align: center; background-color:#e0e0e0 ">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">바이어명</label>
                <input  id="buyerNameInput" class="form-control" required="required" type="text" name="buyer_name" placeholder="바이어 명"<%--data-bs-toggle="modal" data-bs-target="#buyerModal"--%> value="${price.buyer_name}" style="text-align: center; background-color: #e0e0e0" readonly>
            </div>
        </div>
        <div class="mb-3 mx-4 row">
            <div class="col">
                <label class="form-label">화폐단위</label><br>
                <select class="form-control" id="currencySelect" type="text" name="currency" value="${price.currency}" style="text-align: center" required="required">
                    <option value="">화폐 단위를 선택하세요</option>
                    <option value="원(₩)" <c:if test="${price.currency == '원(₩)' }">selected="selected"</c:if>>원(₩)</option>
                    <option value="달러($)" <c:if test="${price.currency == '달러($)' }">selected="selected"</c:if>>달러($)</option>
                    <option value="앤(¥)" <c:if test="${price.currency == '앤(¥)' }">selected="selected"</c:if>>앤(¥)</option>
                    <option value="위안(元)" <c:if test="${price.currency == '위안(元)' }">selected="selected"</c:if>>위안(元)</option>
                </select>
            </div>
        </div>
        <br>
        <hr>
        <br>
        <h5 style="font-weight:550; color:rgba(0,0,0,0.83); margin-left: 20px">- 바이어 제품별 판매가 수정 -</h5>
        <br>
        <div class="mb-3 mx-4 row">
            <div class="col-md-6 mb-3">
                <label class="form-label">제품코드</label>
                <input class="form-control" id="productCodeInput" required="required" type="text" name="product_code" onclick="productPopup()" placeholder="제품 코드" style="text-align: center">
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">제품명</label>
                <input class="form-control" id="productNameInput" required="required" type="text" name="product_name" <%--data-bs-toggle="modal" data-bs-target="#productModal"--%> placeholder="제품 명" style="text-align: center ;background-color: #e0e0e0" readonly>
            </div>
        </div>
        <div class="mb-3 mx-4 row">
            <div class="col">
                <label class="form-label">시작일</label>
                <input class="form-control datepicker" id="startDateInput" required="required" type="date" name="start_date" onchange="startDate()" value="${price.start_date}" onchange="startDate()" style="text-align: center">
            </div>
        </div>
        <div class="mb-3 mx-4 row">
            <div class="col">
                <label class="form-label">종료일</label>
                <input class="form-control datepicker" id="endDateInput" required="required" type="date" name="end_date" onchange="endDate()" value="${price.end_date}" style="text-align: center">
            </div>
        </div>
        <div class="mb-3 mx-4 row">
            <div class="col-md-8 mb-3">
                <label class="form-label">판매가</label>
                <input class="form-control" id="priceInput" onkeyup="inputNumberFormat(this);" required="required" type="text" style="text-align: center" placeholder="-">
            </div>
            <input hidden type="number" id="num" name="num">
            <div id="item-button" class="col-md-4 mb-3" style="position: absolute; right: 50px">
                <label class="form-label"></label>
                <button type="button" id="resetProductButton" class="btn btn-secondary">초기화</button>
                <button type="button" id="addNewProductButton" class="btn btn-success">제품판매가추가</button>
            </div>
        </div>
        <input id="removeNum" type="hidden" name="removePrices">
        <div id="tableDiv" class="row" style="float: contour">
            <table class="table table-hover" id="newPrice-table" style="text-align:center">
                <thead>
                <tr>
                    <th>#</th>
                    <th>제품번호</th>
                    <th>제품명</th>
                    <th>가격</th>
                    <th>시작일</th>
                    <th>종료일</th>
                    <th style="width:207px"></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${itemList}" var="item" varStatus="status">
                    <tr>
                        <td id="cnt">${status.count}</td>
                        <td id="product${status.count}">${item.product_code}</td>
                        <td>${item.product_name}</td>
                            <%--                        <td content="priceToString(${item.price})"></td>--%>
                        <td id="prices${status.count}"><fmt:formatNumber value="${item.price}" pattern="#,###"/></td>
                        <td id="start${status.count}">${item.start_date}</td>
                        <td id="end${status.count}">${item.end_date}</td>
                        <td style='width:160px;' class='btn-group'>
                            <button type='button' class='btn btn-outline-warning btn-sm' style='border-radius: 7px; margin-right: 4px' onclick="modifyPrice(${status.count})">수정</button>
                            <button type='button' class='btn btn-outline-danger btn-sm' style='border-radius: 7px; margin-right: 4px' onclick="removePrice(${status.count})">삭제</button>
                        </td>
                        <td hidden id="num${status.count}">${item.num}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <div class="mb-3 mx-4">

        <input class="form-control" type="hidden" name="adduser" value="user">
        <%--                <input class="btn btn-primary" type="submit" value="등록">--%>
    </div>

    <footer style="float: right; justify-content: flex-end; margin-top:30px; position: relative; bottom: 10px; right: 32px">
        <button type="button" id="modifySubmitButton" class="btn btn-primary">판매가 수정</button>
        <button type="button" class="btn btn-secondary" onclick="window.close();">취소</button>
    </footer>
</form>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript">

    //
    // function dateCheck(){
    //     $.ajax({
    //         url : "/price/dateCheck",
    //         type : "post",
    //         data : JSON.stringify(data),
    //         dataType : 'json',
    //         contentType: "application/json",
    //         success : function(data) {
    //
    //             if(){
    //
    //             }
    //             else if(data.check == "fail"){
    //                 document.querySelector("#startDateInput").value=null;
    //                 $('#startDateInput').attr('style','text-align : center');
    //                 document.querySelector("#endDateInput").value=null;
    //                 $('#endDateInput').attr('style','text-align : center');
    //                 alert(data.message);
    //             }else{
    //                 addProduct();
    //             }
    //
    //             console.log(data);
    //         },
    //         error : function() {
    //             alert("error");
    //         }
    //     });
    // }

    function startDate() {
        console.log(document.getElementById('endDateInput').value);
        if(document.getElementById('endDateInput').value != 0 && document.getElementById('startDateInput').value > document.getElementById('endDateInput').value){
            alert("종료일이 시작일보다 먼저일 수 없습니다.");
            // document.getElementById('start_date'+s).value = document.getElementById('oldStart'+s).value;
            document.getElementById('startDateInput').value = null;
            return false;
        }


    }

    function endDate() {
        if(document.getElementById('startDateInput').value != 0 && document.getElementById('startDateInput').value > document.getElementById('endDateInput').value){
            alert("종료일이 시작일보다 먼저일 수 없습니다.");
            document.getElementById('endDateInput').value = null;
            return false;
        }
    }

    function comma(str) {
        str = String(str);
        return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
    }

    function uncomma(str) {
        str = String(str);
        return str.replace(/[^\d]+/g, '');
    }


    function inputNumberFormat(obj) {
        obj.value = comma(uncomma(obj.value));
    }


    function priceToString(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
    }

    $(function() {
        $( ".datepicker" ).datepicker();
    });

    $(".datepicker").datepicker({
        dateFormat: "yy-mm-dd"
    });

    function buyerPopup() {
        let url = "${pageContext.request.contextPath}/price/sub/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    function productPopup() {
        let url = "${pageContext.request.contextPath}/price/sub/productPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    $("#modifyConfirmButton").click(function(){

        let price = $("#priceInput").val();
        let intPrice = parseInt(price.replace(/,/g,""));

        $("#price").val(intPrice);
        $("input[name='price']").val(intPrice);

        <%--for(let i=1; i<${pageInfo.countAll} ; i++) {--%>
        <%--    let money = document.getElementById(i).innerText;--%>
        <%--    let money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");--%>
        <%--    document.getElementById(i).innerText=money2;--%>
        <%--    // var money = '';--%>
        <%--    // var money2 = '';--%>
        <%--}--%>


        if(document.getElementById('startDateInput').value > document.getElementById('endDateInput').value){
            alert("종료일이 시작일보다 먼저일 수 없습니다.")
            return false;
        }



    })

    let productPriceList = []; //등록 모달창의 제품(표) 리스트
    let oldPriceList = []; // 기존 상품 가격 리스트
    let list;
    <c:forEach items="${itemList}" var="item">
    list = [];
    list.push("${item.product_code}");
    list.push("${item.product_name}");
    list.push("${item.price}");
    list.push("${item.num}")
    list.push("${item.start_date}")
    list.push("${item.end_date}")
    oldPriceList.push(list);
    productPriceList.push(list);
    </c:forEach>
    let addItemList = []; // 추가된 상품 리스트
    let removeItemList = []; // 삭제된 상품 리스트
    let modifyItemList = []; // 수정된 상품 리스트
    let removeList = [];
    let modifyFlag = false;
    let modifyIndex; // 수정할 제품의 index



    //
    // $(function() {
    //
    //


    <%--const ctx = "${pageContext.request.contextPath}";--%>

    /* 제품 가격 추가 버튼 */
    $('#addNewProductButton').click(function() {
        let buyerCode = $.trim($('#buyerCodeInput').val());
        $('#buyerCodeInput').attr('style','background-color: #e0e0e0; text-align : center');
        // $('#buyerCodeInput').attr('disabled','disabled');
        let startDate = $.trim($('#startDateInput').val());
        // $('#startDateInput').attr('style','background-color: #e0e0e0; text-align : center');
        // $('#startDateInput').attr('disabled','disabled');
        let endDate = $.trim($('#endDateInput').val());
        // $('#endDateInput').attr('style','background-color: #e0e0e0; text-align : center');
        // $('#startDateInput').attr('disabled','disabled');
        let currency = $.trim($('#currencySelect').val());
        $('#currencySelect').attr('style','background-color: #e0e0e0; text-align : center');

        let productCode = $.trim($('#productCodeInput').val());
        /*let productName = $.trim($('#productNameInput').val());*/
        let price = $.trim($('#priceInput').val());



        if (buyerCode !== "" && currency != "") {
            if (productCode != "" /*&& productName != ""*/ && price != "" && startDate !== "" && endDate !== "") {

                const num = document.querySelector("#num").value;
                const buyer_code = document.querySelector("#buyerCodeInput").value;
                const product_code = document.querySelector("#productCodeInput").value;
                const start_date = document.querySelector("#startDateInput").value;
                const end_date = document.querySelector("#endDateInput").value;

                const data = {
                    "num" : num,
                    "buyer_code" : buyer_code,
                    "product_code" : product_code,
                    "start_date" : start_date,
                    "end_date" : end_date
                };

                $.ajax({
                    url : "${pageContext.request.contextPath}/price/dateCheck",
                    type : "post",
                    data : JSON.stringify(data),
                    dataType : 'json',
                    contentType: "application/json",
                    success : function(data) {
                        if(data.check == "fail"){
                            if(/*$('#cnt').length &&*/ !modifyFlag){
                                alert(data.message);
                                document.querySelector("#startDateInput").value = null;
                                document.querySelector("#endDateInput").value = null;
                            } else {
                                addProduct();
                                modifyFlag = false;
                            }
                        }
                        else{
                            addProduct();
                            modifyFlag = false;
                        }
                        console.log(data);
                    },
                    error : function() {
                        alert("error");
                    }
                });

            }

            if (productCode == "" /*|| productName == ""*/)  productPopup();
            if (endDate == "") $('#endDateInput').focus();
            if (startDate == "") $('#startDateInput').focus();
            if (price == "") $('#priceInput').focus();

        }
        if (buyerCode == "")  buyerPopup();
        if (currency == "") $('#currencySelect').focus();

    });

    /* 제품 가격 초기화 버튼 */
    $('#resetProductButton').click(function() {
        resetPriceInfo();
    });

    /* 가격 수정 전송 버튼 */
    $('#modifySubmitButton').click(function() {
        let buyerCode = $.trim($('#buyerCodeInput').val());
        let currency = $.trim($('#currencySelect').val());

        let startDate = $.trim($('#startDateInput').val());
        let endDate = $.trim($('#endDateInput').val());

        let productCode = $.trim($('#productCodeInput').val());
        /*let productName = $.trim($('#productNameInput').val());*/
        let price = $.trim($('#price').val());


        var productCodeId;
        var priceId;
        var numId;
        var startId;
        var endId;
        if (buyerCode !== ""/* && startDate !== "" && endDate !== "" */&& currency != "") {
            console.log(productPriceList.length);
            $("#removeNum").val(removeList);
            let removePrices = $('#removeNum').val();
            const remove = {"removePrices" : removeList};
            console.log(removeList);
            console.log("remove"+remove);
            $.ajax({
                url : "${pageContext.request.contextPath}/price/delete",
                type : "post",
                // data : {"removePrices" : removeList},
                data : remove,
                // dataType : 'json',
                // contentType: "application/json",
                traditional: true,
                success : function(result) {
                    console.log(result);

                },
                error: function( request, status, error){
                    alert(JSON.stringify(remove));
                    console.log(remove);
                    alert("status : " + request.status + ", message : " + request.responseText + ", error : " + error);

                }
            });

            if ($('#cnt').length) {
                for(let i=1; i<=productPriceList.length; i++){
                    productCodeId = "product" + i;
                    priceId = "prices" + i;
                    numId = "num" + i;
                    startId = "start" + i;
                    endId = "end" + i;
                    // let price = parseInt(document.getElementById(priceId).innerText.replace(/,/g,""))
                    // console.log(price);
                    // document.querySelector("#productCodeInput").value = document.getElementById(productCodeId).innerText;
                    //
                    // console.log(document.querySelector("#price"));
                    // document.querySelector("#price").value = price;

                    const buyer_code = document.getElementById("buyerCodeInput").value;
                    // const start_date = document.getElementById("startDateInput").value;
                    // const end_date = document.getElementById("endDateInput").value;
                    const currency = document.getElementById("currencySelect").value;

                    const start_date = document.getElementById(startId).innerText;
                    const end_date = document.getElementById(endId).innerText;

                    const product_code = document.getElementById(productCodeId).innerText;
                    const price = parseInt(document.getElementById(priceId).innerText.replace(/,/g,""))
                    // const num = document.getElementById(numId).value;

                    if (document.getElementById(numId).innerText == ""){
                        const add = {
                            "buyer_code" : buyer_code,
                            "product_code" : product_code,
                            "start_date" : start_date,
                            "end_date" : end_date,
                            "currency" : currency,
                            "price" : price
                        };

                        console.log(add);

                        $.ajax({
                            url : "${pageContext.request.contextPath}/price/add",
                            type : "post",
                            data : JSON.stringify(add),
                            dataType : 'json',
                            contentType: "application/json",
                            success : function(result) {
                                console.log(result);

                            },
                            error : (error) => {
                                console.log(JSON.stringify(error));
                            }
                        });
                    } else {
                        const num = document.getElementById(numId).innerText;
                        const data = {
                            "num" : num,
                            "buyer_code" : buyer_code,
                            "product_code" : product_code,
                            "start_date" : start_date,
                            "end_date" : end_date,
                            "currency" : currency,
                            "price" : price
                        };

                        console.log(data);


                        $.ajax({
                            url : "${pageContext.request.contextPath}/price/modify",
                            type : "post",
                            data : JSON.stringify(data),
                            dataType : 'json',
                            contentType: "application/json",
                            success : function(result) {
                                console.log(result);
                            },
                            error : (error) => {
                                console.log(JSON.stringify(error));
                            }
                        });


                    }






                    // document.querySelector("#modifyForm").submit();
                    // alert(i);
                }

                // document.querySelector("#modifyForm").submit();
            }
            // if (productCode == "" /*|| productName == ""*/)  productPopup();
            // if (price == "") $('#priceInput').focus();
            setTimeout(function () {
                alert("수정이 완료되었습니다");
                opener.parent.location.reload();
                window.close();
            }, 100);
            // opener.parent.location.reload();
            // window.close();
        }
        if (buyerCode == "")  buyerPopup();
        if (currency == "") $('#currencySelect').focus();
        if (endDate == "") $('#endDateInput').focus();
        if (startDate == "") $('#startDateInput').focus();

    });

    //
    // // 바이어 정보 추가
    // window.setBuyerInfo = function (buyerCode, buyerName) {
    //     $('#buyerCode').val(buyerCode);
    //     $('#buyerName').val(buyerName);
    // }

    // 제품 정보 추가
    window.setProductInfo = function (productCode, productName, price, num, startDate, endDate) {
        $('#productCodeInput').val(productCode);
        $('#productNameInput').val(productName);
        $('#priceInput').val(price);
        $('#num').val(num);
        $('#startDateInput').val(startDate);
        $('#endDateInput').val(endDate);
    }



    /* 제품 가격 추가 */
    function addProduct() {
        let productCode = $('#productCodeInput').val();
        let productName = $('#productNameInput').val();
        // let price = $('#priceInput').val();
        let price = parseInt($('#priceInput').val().replace(/,/g,""));
        let num = $('#num').val();
        let startDate = $('#startDateInput').val();
        let endDate = $('#endDateInput').val();

        // 제품 수정인 경우 해당 제품 삭제 후 변경사항 추가
        if (modifyFlag) {
            productPriceList.splice(modifyIndex,1);
            getProductList(productPriceList);
        }

        // 제품 중복 확인
        let dupli = false;
        for(var i = 0; i<productPriceList.length; i++) {
            if (productPriceList[i][0] == productCode) {
                dupli = true;
                break;
            }
        }
        if (dupli == false) {
            const productList = [productCode, productName, price, num, startDate, endDate];
            productPriceList.push(productList);
            let existListflag = "false";
            for (var i = 0; i<oldPriceList.length; i++) {
                if (oldPriceList[i][0] == productList[0]) {
                    existListflag = "true";
                    if (oldPriceList[i][2] == productList[2]) {
                        existListflag = "-";
                    }
                    break;
                }
            }
            console.log(existListflag);
            if (existListflag == "true") {
                for(var i = 0; i<modifyItemList.length; i++) {
                    if (modifyItemList[i][0] == productList[0]) {
                        modifyItemList.splice(i,1);
                        break;
                    }
                }
                modifyItemList.push(productList); // 수정한 상품
            } else if (existListflag == "false") {
                for(var i = 0; i<addItemList.length; i++) {
                    if (addItemList[i][0] == productList[0]) {
                        addItemList.splice(i,1);
                        break;
                    }
                }
                addItemList.push(productList); // 새로 추가한 상품
            } else {
                for(var i = 0; i<modifyItemList.length; i++) {
                    if (modifyItemList[i][0] == productList[0]) {
                        modifyItemList.splice(i,1);
                        break;
                    }
                }
                for(var i = 0; i<addItemList.length; i++) {
                    if (addItemList[i][0] == productList[0]) {
                        addItemList.splice(i,1);
                        break;
                    }
                }
            }

            for (var i = 0; i<removeItemList.length; i++) {
                if (removeItemList[i][0] == productList[0]) {
                    removeItemList.splice(i, 1);
                    break;
                }
            }
            productListInPopup(productList, productPriceList);

            $('#buyerPopup').attr('style','background-color: #e0e0e0');
            /*$('#startDateInput').datepicker('disable').removeAttr('disabled')
            $('#endDateInput').datepicker('disable').removeAttr('disabled')
*/
        } else {
            alert("제품번호 " + productCode + "가 중복됩니다.");
        }
        $('#productPopup').removeAttr('style','pointer-events:none;');
        $('#productCodeInput').val("");
        $('#productNameInput').val("");
        $('#priceInput').val("");
        $('#num').val("");
    }

    /* 제품 가격 리스트 추가 */
    function productListInPopup(productList, productPriceList) {
        let tbody = $('#newPrice-table tbody');
        var num = productPriceList.length;

        tbody.append("");
        tbody.append(
            "<tr>"
            + "<td id='cnt'>" + productPriceList.length + "</td>"
            + "<td id='product"+num+"'>" + productList[0] + "</td>"
            + "<td>" + productList[1] + "</td>"
            + "<td id='prices"+num+"'>" + priceToString(productList[2]) + "</td>"
            + "<td hidden id='num"+num+"'>"+productList[3]+"</td>"
            + "<td id='start"+num+"'>" + productList[4] + "</td>"
            + "<td id='end"+num+"'>" + productList[5] + "</td>"
            + "<td style='width:160px;' class='btn-group'>"
            +    "<button type='button' class='btn btn-outline-warning btn-sm' style='border-radius: 7px; margin-right: 4px' onclick='modifyPrice(" + num + ")'>수정</button>"
            +    "<button type='button' class='btn btn-outline-danger btn-sm' style='border-radius: 7px;' onclick='removePrice(" + num + ")'>삭제</button>"
            + "</td>"
            + "</tr>"
        );
    }




    /* 제품 가격 리스트 조회 */
    function getProductList(productPriceList) {
        let tbody = $('#newPrice-table tbody');

        tbody.empty(); //초기화
        tbody.append("");
        console.log(productPriceList);
        for (var i = 0; i < productPriceList.length; i++) {
            let index = i + 1;
            tbody.append(
                "<tr>"
                + "<td id='cnt'>" + index + "</td>"
                + "<td id='product"+index+"'>" + productPriceList[i][0] + "</td>"
                + "<td>" + productPriceList[i][1] + "</td>"
                + "<td id='prices"+index+"'>" + priceToString(productPriceList[i][2]) + "</td>"
                + "<td hidden id='num"+index+"'>"+productPriceList[i][3]+"</td>"
                + "<td id='start"+index+"'>" + productPriceList[i][4] + "</td>"
                + "<td id='end"+index+"'>" + productPriceList[i][5] + "</td>"
                + "<td style='width: 160px;' class='btn-group'>"
                +    "<button type='button' class='btn btn-outline-warning btn-sm' style='border-radius: 7px; margin-right: 4px' onclick='modifyPrice(" + index + ")'>수정</button>"
                +    "<button type='button' class='btn btn-outline-danger btn-sm' style='border-radius: 7px; margin-right: 4px' onclick='removePrice(" + index + ")'>삭제</button>"
                + "</td>"
                + "</tr>"
            );
        }
    }




    /* 제품 삭제 */
    function removePrice(index) {
        let nums = parseInt(productPriceList[index-1][3]);
        removeList.push(nums);

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

        productPriceList.splice(index-1, 1);
        getProductList(productPriceList);
        console.log("removeButton:"+removeList);
        console.log("removeButton2"+productPriceList);
    }

    /* 제품 삭제 */
    function remove(num) {
        removeList.push(num);

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

        productPriceList.splice(productPriceList.length-1, 1);
        getProductList(productPriceList);
        // alert(removeList);
    }


    /* 제품 수정 정보 가져오기*/
    function modifyPrice(index) {
        $('#addNewProductButton').text('제품판매가수정');
        index = index-1;
        let list = productPriceList[index];

        $('#productCodeInput').val(list[0]);
        $('#productNameInput').val(list[1]);
        $('#priceInput').val(priceToString(list[2]));
        $('#num').val(list[3]);
        $('#startDateInput').val(list[4]);
        $('#endDateInput').val(list[5]);

        $('#productPopup').attr('style','background-color: #e0e0e0');
        modifyIndex = index;
        modifyFlag = true;
    }





    /* 제품입력창 초기화 */
    function resetPriceInfo() {
        $('#productPopup').removeAttr('style','pointer-events:none;');
        $('#productCodeInput').val("");
        $('#productNameInput').val("");
        $('#priceInput').val("");
        $('#num').val("");
        $('#startDateInput').val("");
        $('#endDateInput').val("");
    }

    // })




</script>
</body>
</html>