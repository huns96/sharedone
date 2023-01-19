<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2023-01-03
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" media="screen" href="../css/price.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="modal fade" id="registerModal" tabindex="-1" aria-hidden="true">--%>
    <div class="modal-dialog modal-xl" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModal" style="left: 10px">판매가 등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close" style="right: 10px"></button>
            </div>
            <div class="modal-body">
                <form class="registerForm" id="registerForm" action="" method="post" enctype="multipart/form-data" style="margin: auto;  height: 664px;" >
                    <div style="margin: 20px;">
                        <div class="mb-3 mx-4 row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">바이어코드</label>
                                <input class="form-control"  id="buyerCodeInput" required="required" type="text" name="buyer_code" placeholder="바이어 코드" <%--data-bs-toggle="modal" data-bs-target="#buyerModal"--%> onclick="buyerPopup()" style="text-align: center">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">바이어명</label>
                                <input  id="buyerNameInput" class="form-control" required="required" type="text" name="buyer_name" placeholder="바이어 명" <%--data-bs-toggle="modal" data-bs-target="#buyerModal"--%> style="text-align: center; background-color: #e0e0e0" readonly>
                            </div>
                        </div>
                        <div class="mb-3 mx-4 row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label">제품코드</label>
                                <input class="form-control" id="productCodeInput" required="required" type="text" name="product_code" <%--data-bs-toggle="modal" data-bs-target="#productModal"--%> onclick="productPopup()" placeholder="제품 코드" style="text-align: center">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label">제품명</label>
                                <input class="form-control" id="productNameInput" required="required" type="text" name="product_name" <%--data-bs-toggle="modal" data-bs-target="#productModal"--%> placeholder="제품 명" style="text-align: center ;background-color: #e0e0e0" readonly>
                            </div>
                        </div>
                        <div class="mb-3 mx-4 row">
                            <div class="col">
                                <label class="form-label">판매가</label>
                                <input class="form-control" id="priceInput" onkeyup="inputNumberFormat(this);" required="required" type="text" style="text-align: center" placeholder="-">
                                <input type="hidden" id="price" name="price">
                            </div>
                        </div>
                        <div class="mb-3 mx-4 row">
                            <div class="col">
                                <label class="form-label">시작일</label>
                                <input class="form-control datepicker" id="startDateInput" required="required" type="date" name="start_date" style="text-align: center">
                            </div>
                        </div>
                        <div class="mb-3 mx-4 row">
                            <div class="col">
                                <label class="form-label">종료일</label>
                                <input class="form-control datepicker" id="endDateInput" required="required" type="date" name="end_date" style="text-align: center">
                            </div>
                        </div>
                        <div class="mb-3 mx-4 row">
                            <div class="col">
                                <label class="form-label">화폐단위</label><br>
                                <select class="form-control" id="currencySelect" type="text" name="currency" style="text-align: center" required="required">
                                    <option value="">화폐 단위를 선택하세요</option>
                                    <option value="원(₩)">원(₩)</option>
                                    <option value="달러($)">달러($)</option>
                                    <option value="앤(¥)">앤(¥)</option>
                                    <option value="위안(元)">위안(元)</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 mx-4">

                        <input class="form-control" type="hidden" name="adduser" value="user">
                        <%--                <input class="btn btn-primary" type="submit" value="등록">--%>
                    </div>
            </div>
            <div class="modal-footer">
                <button id="registerConfirmButton"
                        class="btn btn-primary">등록</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">취소</button>
            </div>
            </form>




        </div>
    </div>
</div>



<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>

    function buyerPopup() {
        let url = "/price/sub/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    function productPopup() {
        let url = "/price/sub/productPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY= (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
        window.open(url,"",popupOption);
    }

    $("#registerConfirmButton").click(function(){

        let price = $("#priceInput").val();
        let intPrice = parseInt(price.replace(/,/g,""));

        $("#price").val(intPrice);
        $("input[name='price']").val(intPrice);

        for(let i=1; i<${pageInfo.countAll} ; i++) {
            let money = document.getElementById(i).innerText;
            let money2 = money.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
            document.getElementById(i).innerText=money2;
            // var money = '';
            // var money2 = '';
        }


        if(document.getElementById('startDateInput').value > document.getElementById('endDateInput').value){
            alert("종료일이 시작일보다 먼저일 수 없습니다.")
            return false;
        }



    })

</script>
</body>
</html>