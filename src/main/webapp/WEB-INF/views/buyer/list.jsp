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
    <title>Buyer</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/css/bootstrap.min.css" integrity="sha512-N415hCJJdJx+1UBfULt+i+ihvOn42V/kOjOpp1UTh4CZ70Hx5bDlKryWaqEKfY/8EYOu/C2MuyaluJryK1Lb5Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.0.0-beta3/js/bootstrap.min.js" integrity="sha512-mp3VeMpuFKbgxm/XMUU4QQUcJX4AZfV5esgX72JQr7H7zWusV6lLP1S78wZnX2z9dwvywil1VHkHZAqfGOW7Nw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js" integrity="sha512-STof4xm1wgkfm7heWqFJVn58Hm3EtS31XFaagaa8VMReCXAkQnJZ+jEy8PCC/iT18dFy95WcExNHFTqLyp72eQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
</head>
<style>
    body{
        background-color: #e0e0e0;
    }

    tr > .table-head{
        text-align: center;
        background-color:#e0e0e0;
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
<c:if test="${not empty message }">
    <div class="alert alert-success" id="messageModal" role="alert">
           <h4 class="alert-heading" style="text-align: center"> ${message } </h4>
    </div>
</c:if>
<div class="container-fluid">
    <div class="row flex-nowrap">
        <my:Sidebar></my:Sidebar>
        <div class="col" style="">
            <div class="p-3 mb-3" style="background-color: white; border-radius: 5px; margin-left: 40px; margin-top: 40px; margin-right: 40px;">
                <table style="  align-content: end;">
                    <tr>
                        <td style="float: end;">
                            <form action="${pageContext.request.contextPath}/buyer/listSearch" method="get" class="d-flex" style="height: 40px">
                                <select name="search" id="" class="form-select" style="width: 200px">
                                    <option value="all">통합검색</option>
                                    <option value="buyer_code" <c:if test="${type == 'buyer_code'}">selected</c:if> >바이어 코드</option>
                                    <option value="name" <c:if test="${type == 'name'}">selected</c:if> >이름</option>
                                </select>

                                <input type="text" placeholder="search" name="keyword" class="form-control" value="${keyword}">
                                <button class="btn btn-dark" style="width: 100px; margin-right: 5px">검색</button>
                                <a type="button" class="btn btn-dark" style="width: 140px" href="${pageContext.request.contextPath}/buyer/list">초기화</a>
                            </form>
                        </td>
                    </tr>
                </table>

<%--                        <select name="t" id="searchTypeSelect" class="form-select">--%>
<%--                            <option value="all">전체</option>--%>
<%--                            <option value="buyer_code">바이어 코드</option>--%>
<%--                            <option value="name">바이어 명</option>--%>
<%--                        </select>--%>

<%--                        <input value="" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="q">--%>
<%--                        <button class="btn col col-2" type="submit">--%>
<%--                            <i class="fa-solid fa-magnifying-glass"></i>--%>
<%--                        </button>--%>
            </div>




            <div style="background-color: white; border-radius: 5px; margin: 0px 40px 0px 40px;" class="mb-5">
                <div class="row p-2 justify-content-between">
                    <div class="col-4 mt-3 mb-1"><h4 style="font-weight: bold;">바이어 목록</h4></div>
                    <div class="col-2 mt-3" style="text-align: right;">
                        <button onclick="regiBuyer()" class="btn btn-success" <%--data-bs-toggle="modal" data-bs-target="#registerModal"--%>>등록</button>
                        <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal" id="deleteCheck">삭제</button>
                    </div>
                </div>


                <!-- remove modal -->
                <div class="modal fade" id="deleteModal" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5">삭제 확인</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                삭제하시겠습니까?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                                <button class="btn btn-danger" onclick="deleteCheck()">확인</button>
                            </div>

                        </div>
                    </div>
                </div>


                <!-- Register Modal -->
                <%--<div class="modal" id="registerModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
&lt;%&ndash;                                        <input type="text" class="form-control" name="country" required id="country">&ndash;%&gt;
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">사업자 번호:</label>
                                        <input type="text" class="form-control" name="license" required id="license" placeholder="사업자번호 ex)111-22-33333">
                                    </div>

                                    <div class="mb-3">
                                        <label class="col-form-label">전화 번호:</label>
                                        <input type="text" class="form-control" name="contact" required id="contact" placeholder="전화번호 ex)02-123-4567">
                                    </div>

                                </form>
                            </div>
                            <div class="modal-footer">
                                <button id="registerConfirm" type="submit" class="btn btn-success" onclick="registerBuyer()">등록</button>
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            </div>
                        </div>
                    </div>
                </div>--%>

                <!-- deleteModal -->
<%--                <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--                    <div class="modal-dialog">--%>
<%--                        <div class="modal-content">--%>
<%--                            <div class="modal-header">--%>
<%--                                <h1 class="modal-title fs-5" id="exampleModalLabel">삭제하시겠습니까?</h1>--%>
<%--                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--                            </div>--%>
<%--                            <div class="modal-body">--%>

<%--                            </div>--%>
<%--                            <div class="modal-footer">--%>
<%--                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>--%>
<%--                                <button type="button" class="btn btn-primary">Save changes</button>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>



                <div>
                    <table class="table table-hover">
                        <thead><!-- table 기호에 맞게 -->
                        <tr> <!-- 데이터 받으면 그때 for문 -->
                            <th scope="col" class="table-head">전체<input class="form-check-input" id="buyerAll" type="checkbox" name="buyerCodeAll" style="margin-left: 5px" onclick="checkAll(this)"></th>
                            <th scope="col" class="table-head">바이어코드</th>
                            <th scope="col" class="table-head">이름</th>
                            <th scope="col" class="table-head">주소</th>
                            <th scope="col" class="table-head">국적</th>
                            <th scope="col" class="table-head">사업자번호</th>
                            <th scope="col" class="table-head">전화번호</th>
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
                                    <form action="${pageContext.request.contextPath}/buyer/delete" method="post" id="deleteForm">
                                    <input class="form-check-input checkBuyer" type="checkbox" value="${item.buyer_code}" name="buyerCode" id="flexCheckDefault" onclick="changeStatus(this)">
                                    </form>
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
                                        <button class="btn btn-warning btn-sm" style="color: white;" id=`modify${item.buyer_code}` data-buyer-code="${item.buyer_code}" data-buyer-country="${item.country}"
                                                data-buyer-name="${item.name}" data-buyer-address="${item.address}" data-buyer-license="${item.license}" data-buyer-contact="${item.contact}" data-bs-toggle="modal" data-bs-target="#modifyModal">수정</button>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <!-- Pagination -->
                    <div class="row justify-content-center" style="margin-left: 110px">
                        <div class="col-3">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination">
                                    <li class="page-item">
                                        <c:url value="/buyer/list" var="pageLink"></c:url>
                                        <a class="page-link" href="${pageLink }?page=1" aria-label="Previous">
                                            <span aria-hidden="true">&laquo;</span>
                                        </a>
                                    </li>
                                    <c:forEach begin="1" end="${pages }" varStatus="status" var="pageNumb">
                                        <li class="page-item  ${pageNum == pageNumb ? "active" : ""}">
                                            <a class="page-link" href="${pageLink }?page=${pageNumb}">${pageNumb }</a>
                                        </li>
                                    </c:forEach>
                                    <li class="page-item">
                                        <a class="page-link" href="${pageLink }?page=${pages}" aria-label="Next">
                                            <span aria-hidden="true">&raquo;</span>
                                        </a>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                    <!-- 수정 모달 -->
                    <div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="modalModify" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="modalModify">정보 수정</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath}/buyer/modify" method="post" id="modifyForm">
                                        <label for="" class="col-form-label">바이어코드:</label>
                                        <input type="text" class="form-control" value="" readonly="readonly" style="background-color: lightgrey;" required="required">
                                        <input type="hidden" class="form-control" name="buyer_code" value="" required="required" id="buyerCode">
                                        <div class="mb-3">
                                            <label for="" class="col-form-label">이름:</label>
                                            <input type="text" class="form-control" name="name" required="required" id="buyerName" placeholder="한글/영문">
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="col-form-label">주소:</label>
                                            <input type="text" class="form-control" name="address" required="required" id="buyerAddress" placeholder="한글/영문">
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="col-form-label">국적:</label>
                                            <input type="text" class="form-control country" value="" readonly="readonly" style="background-color: lightgrey;" required="required">
                                            <input type="hidden" class="form-control" name="country" required="required" id="buyerCountry">
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="col-form-label">사업자번호:</label>
                                            <input type="text" class="form-control" name="license" required="required" id="buyerLicense" placeholder="사업자번호(정확히)">
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="col-form-label">전화번호:</label>
                                            <input type="text" class="form-control" name="contact" required="required" id="buyerContact" placeholder="전화번호(정확히)">
                                        </div>
                                    </form>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="submitModifyForm()">수정</button>
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">나가기</button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>

</div>
    <script>
        const ctx = "${pageContext.request.contextPath}";
        const deleteMod = document.querySelector("#deleteMod");
        const name = document.querySelector("#name");
        const address = document.querySelector("#address");
        const country = document.querySelector("#country");
        const license = document.querySelector("#license");
        const contact = document.querySelector("#contact");


        const buyerName = document.querySelector("#buyerName");
        const buyerAddress = document.querySelector("#buyerAddress");
        const buyerCountry = document.querySelector("#buyerCountry");
        const buyerLicense = document.querySelector("#buyerLicense");
        const buyerContact = document.querySelector("#buyerContact");



        setTimeout(function(){
            if("${message}" != "")
            document.querySelector("#messageModal").style.display='none';
        },2000);


        function telValidator(args) {

            if (/^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}/.test(args)) {
                return true;
            }
            // alert(msg);
            return false;
        }

        function licenseValidator(args){
            if(/^[0-9]{3}-[0-9]{2}-[0-9]{5}$/.test(args)){
                return true;
            }
            return false;
        }

    function registerBuyer(){
            this.event.preventDefault();
            if(name.value ===''){
                alert("아이디 입력");
            }
            if(address.value===''){
                alert("주소 입력")
            }
            if(country.value ==='' || country.value.length<2){
                alert("나라 입력")
            }
            if(!licenseValidator(license.value)){
                alert("사업자 번호 확인")
            }
            if(!telValidator(contact.value)){
                alert("전화번호 확인")
            }
            else{
                document.querySelector("#registerForm").submit();
            }
    }



    function modifyFunc(id){
        alert(id);
    }

    var checkedList =[];
    const myModal = document.getElementById('deleteModal')

    function deleteCheck(){
        var checked = document.querySelectorAll("input[name='buyerCode']:checked");

        if(checked.length !== 0){
            // document.querySelector("#deleteCheck").setAttribute("data-bs-target","#deleteModal");
            checked.forEach((e) =>{
                checkedList.push(e.value);
            })
            // 삭제 하시겠습니까? 모달 띠우고 확인 누르면 삭제쿼리 실행.
            executeDelete(checkedList);
            checkedList =[];
        }
        else{
            $('#deleteModal').hide();
            alert("바이어 선택");
            location.reload();
        }
        // checked.forEach((e) =>{
        //     alert(e.value);
        // })
    }

    function executeDelete(checkedList) {
        // alert(typeof checkedList);
        // console.log(JSON.stringify(checkedList));
         $.post(ctx+'/buyer/delete',"checkedList="+checkedList.join(','), function () {
             location.reload();
            }
         )
    }
    //     fetch(ctx + "/buyer/delete",{
    //         method : "post",
    //         headers :{
    //             "Content-Type" : "Application/json"
    //         },
    //         body : JSON.stringify(checkedList)
    //     }).then((res) => res.json())
    //         .then((data) => console.log(data));
    //
    // }

    function checkAll(selectAll){
        const buyerAll = document.querySelector("#buyerAll");
        const checkboxes = document.getElementsByName('buyerCode');

        // checkboxes.forEach((checkbox) =>{
        //     if(checkbox.hasAttribute("checked")){
        //         checkbox.removeAttribute("checked");
        //         checkbox.checked = null;
        //     }else {
        //         checkbox.setAttribute("checked", "checked");
        //         checkbox.checked = selectAll.checked;
        //     }
        // })
        buyerAll.toggleAttribute("checked");
        checkboxes.forEach((checkbox) =>{
            checkbox.setAttribute("checked","checked");
            checkbox.checked = selectAll.checked;
        })
    }

    function changeStatus(box){
        box.toggleAttribute("checked");
    }

    function deleteBuyer(){
        document.querySelector("#deleteForm").submit();
    }

        const exampleModal = document.getElementById('modifyModal')
        exampleModal.addEventListener('show.bs.modal', event => {

            const button = event.relatedTarget
            const recipient = button.getAttribute('data-buyer-code')
            const buyerCountry = button.getAttribute('data-buyer-country');
            const buyerCode = button.getAttribute('data-buyer-code');
            const buyerName = button.getAttribute('data-buyer-name');
            const buyerAddress = button.getAttribute('data-buyer-address');
            const buyerLicense = button.getAttribute('data-buyer-license');
            const buyerContact = button.getAttribute('data-buyer-contact');
            const modalBodyInput = exampleModal.querySelector('.modal-body input')
            const modalbuyerInput = exampleModal.querySelector('.modal-body .country')
            modalBodyInput.value = recipient
            modalbuyerInput.value = buyerCountry
            document.querySelector("#buyerCode").value = buyerCode;
            document.querySelector("#buyerCountry").value = buyerCountry;
            document.querySelector("#buyerName").value = buyerName;
            document.querySelector("#buyerAddress").value = buyerAddress;
            document.querySelector("#buyerLicense").value = buyerLicense;
            document.querySelector("#buyerContact").value = buyerContact;
        });

        function submitModifyForm(){
            this.event.preventDefault();
            if(buyerName.value ===''){
                alert("아이디 확인");
            }
            if(buyerAddress.value ===''){
                alert("주소 확인");
            }
            if(!licenseValidator(buyerLicense.value)){
                alert("사업자 번호 확인")
            }
            if(!telValidator(buyerContact.value)){
                alert("전화 번호 확인")
            }

            else{
                document.querySelector("#modifyForm").submit()
                    .then(
                    );
            }
        }

        function regiBuyer(){
            let url = "${pageContext.request.contextPath}/buyer/registerBuyer";
            let popupWidth = 700;
            let popupHeight = 800;
            let popupX = (window.screen.width / 2) - (popupWidth / 2);
            let popupY= (window.screen.height / 2) - (popupHeight / 2);
            let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
            window.open(url,"",popupOption);
        }

    </script>
</body>
</html>
