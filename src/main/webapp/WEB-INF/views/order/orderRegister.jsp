<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>새 주문 등록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="resources/css/plugin/datepicker/bootstrap-datepicker.css">
    <style>
        body { padding: 20px; }
        h3 { margin-bottom: 30px; }
    </style>
</head>
<body>
    <header>
        <h3><b>주문 등록</b></h3>
    </header>
    <form id="newOrderForm" class="form-horizontal">
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="newOrderCode" class="form-label">주문 코드</label>
                <input id="newOrderCode" type="text" class="form-control" name="order_code" disabled/>
            </div>
            <div class="col-md-6 mb-3">
                <label class="form-label">상태</label>
                <select class="form-select" disabled>
                    <option selected value="작성중">작성중</option>
                    <option value="승인요청">승인요청</option>
                    <option value="승인완료">승인완료</option>
                    <option value="승인취소">승인취소</option>
                    <option value="반려">반려</option>
                    <option value="종결">종결</option>
                </select>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="newBuyerCode" class="form-label">바이어코드</label>
                <div class="input-group">
                    <input id="newBuyerCode" type="text" class="form-control" name="buyer_code" disabled/>
                    <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="newBuyerName" class="form-label">바이어명</label>
                <input id="newBuyerName" type="text" class="form-control" name="buyer_name" disabled/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="newRequestDate" class="form-label">납품요청일</label>
                <input id="newRequestDate" type="date" class="form-control" name="request_date" />
            </div>
            <div class="col-md-6 mb-3">
                <label for="newOrderDate" class="form-label">주문일</label>
                <input id="newOrderDate" type="date" class="form-control" name="order_date" disabled/>
            </div>
        </div>
        <div class="row">
            <div class="col mb-3">
                <label for="newMemo" class="form-label">주문메모</label>
                <textarea rows="3" id="newMemo" class="form-control" name="memo"></textarea>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-md-6 mb-3">
                <label for="newProductCode" class="form-label">상품코드</label>
                <div class="input-group">
                    <input id="newProductCode" type="text" class="form-control" name="product_code" disabled/>
                    <button id="productPopup" class="btn btn-outline-secondary" type="button">검색</button>
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="newProductName" class="form-label">상품명</label>
                <input id="newProductName" type="text" class="form-control" name="product_name" disabled/>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-3">
                <label for="newPrice" class="form-label">단가</label>
                <input id="newPrice" type="text" class="form-control" name="price" />
            </div>
            <div class="col-md-4 mb-3">
                <label for="newQuantity" class="form-label">수량</label>
                <input id="newQuantity" type="text" class="form-control" name="quantity" />
            </div>
            <div class="col-md-4 mb-3">
                <label class="form-label"></label>
                <button id="resetItemButton" class="btn btn-danger">초기화</button>
                <button id="addNewItemButton" class="btn btn-danger">상품등록</button>
            </div>
        </div>
        <div class="row">
            <table class="table table-hover" id="newItem-table">
                <thead>
                <tr>
                    <th>#</th>
                    <th>상품번호</th>
                    <th>상품명</th>
                    <th>수량</th>
                    <th>단가</th>
                    <th>총금액</th>
                    <th>X</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </form>
    <footer style="float: right; justify-content: flex-end;">
        <button type="button" id="newOrderSubmitButton" class="btn btn-danger" data-bs-dismiss="modal">주문등록</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
    </footer>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script type="text/javascript">
        let orderItemList = {}; //주문 등록 모달창의 상품(표) 리스트

        $(function() {
            /* 바이어 검색 팝업창 */
            $('#buyerPopupButton').click(function() {
                buyerPopup();
            });

            /* 상품 검색 팝업창 */
            $('#itemPopupButton').click(function() {
                itemPopup();
            });

            /* 상품 추가 버튼 */
            $('#addNewItemButton').click(function() {
                addOrderItem();
            });

            /* 상품 초기화 버튼 */
            $('#resetItemButton').click(function() {
                $('#newProductCode').value = "";
                $('#newProductName').value = "";
                $('#newQuantity').value = "";
                $('#newPrice').value = "";
                console.log("reset 이후 orderItemList ===> " + orderItemList);
            });

            /* 주문 등록 전송 버튼 */
            $('#newOrderSubmitButton').click(function() {
                addNewOrder();
            });

            /* 날짜 */
            $('#newOrderDate').set(new Date());
            $('#newRequestDate')
                .datepicker({
                    format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
                    startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
                    endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
                    autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
                    calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
                    clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
                    //datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
                    //daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
                    //daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정
                    //disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
                    immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false
                    multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false
                    multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
                    templates: {
                        leftArrow: '&laquo;',
                        rightArrow: '&raquo;',
                    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징
                    showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true
                    title: '테스트', //캘린더 상단에 보여주는 타이틀
                    todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false
                    toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
                    weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일
                    language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
                })
                .on('changeDate', function (e) {
                    /* 이벤트의 종류 */
                    //show : datePicker가 보이는 순간 호출
                    //hide : datePicker가 숨겨지는 순간 호출
                    //clearDate: clear 버튼 누르면 호출
                    //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
                    //changeMonth : 월이 변경되면 호출
                    //changeYear : 년이 변경되는 호출
                    //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간

                    console.log(e);
                    // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
                });

        });

        /* 바이어 검색 팝업창 */
        function buyerPopup() {
            let url = "/search/buyerPopup";
            let popupWidth = 600;
            let popupHeight = 500;
            let popupX = (window.screen.width / 2) - (popupWidth / 2);
            let popupY= (window.screen.height / 2) - (popupHeight / 2);
            let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
            window.open(url,"",popupOption);
        }
        // 바이어 정보 추가
        window.setBuyerInfo = function (buyerCode, buyerName) {
            $('#newBuyerCode').val(buyerCode);
            $('#newBuyerName').val(buyerName);
        }

        /* 상품 검색 팝업창 */
        function itemPopup() {
            let url = "/search/buyerPopup";
            let popupWidth = 600;
            let popupHeight = 500;
            let popupX = (window.screen.width / 2) - (popupWidth / 2);
            let popupY= (window.screen.height / 2) - (popupHeight / 2);
            let popupOption = 'status=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY;
            window.open(url,"",popupOption);
        }

        /* 주문 상품 추가 */
        function addOrderItem() {
            let productCode = $('#newProductCode').value;
            let productName = $('#newProductName').value;
            let quantity = $('#newQuantity').value;
            let price = $('#newPrice').value;
            //let orderCode = $('#newOrderCode').value;
            //let buyerCode = $('#newBuyerCode').value;

            // 필수정보 입력 검증 - productCode, name, quantity, price

            let itemList = [productName, productName, quantity, price];

            orderItemList.add(itemList);
            console.log("orderItemList ========> "+orderItemList);

            itemListInModal(orderItemList);

        }

        /* 모달창 - 주문상품 리스트 조회 */
        function itemListInModal(orderItemList) {
            // 표에 리스트 보여주기
        }


        /* 새 주문 등록 */
        function addNewOrder() {

        }


    </script>
</body>
</html>
