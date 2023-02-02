<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%--<ul class="anchor_tab">--%>
<%--    <li><a href="#" data-anchor="anchor_div1">버튼1</a></li>--%>
<%--    <li><a href="#" data-anchor="anchor_div2">버튼2</a></li>--%>
<%--</ul>--%>

<%--<div id="anchor_div1">--%>
<%--    버튼1을 클릭했을때 이동했을때 내용--%>
<%--</div>--%>
<%--<div id="anchor_div2">--%>
<%--    버튼2을 클릭했을때 이동했을때 내용--%>
<%--</div>--%>
<%--<style>.anchor_tab{margin:0;padding:0;overflow:hidden}--%>
<%--.anchor_tab li{float:left;margin:0 5px}--%>
<%--.anchor_tab li a{display:inline-block;height:30px;padding:0 15px;border:1px solid #ccc;border-radius:5px;background:#f4f4f4;box-shadow:0 0 5px #eee;color:#333;text-align:center;font-size:14px;line-height:30px}--%>
<%--.anchor_tab li a:hover{border:1px solid #1e7ae2;color:#1e7ae2;text-decoration:none}--%>
<%--#anchor_div1,#anchor_div2{margin-bottom:10px;padding:10px;background:#f4f4f4;border:1px solid #ccc;border-radius:5px}</style>--%>




<script>



    $(document).ready(function(){
        /* 탭 클릭 */
        $('.anchor_tab li a').on('click',function(){
            var anchorId = $(this).attr('data-anchor');
            // 스크롤 이동
            scroll_to_anchor_tab(anchorId);
        });
    });
    // 탭 이동 - 부드러운 스크롤
    function scroll_to_anchor_tab(anchor_id,speed) {
        if( !speed ) var speed = 'slow';
        var a_tag = $("#"+anchor_id);
        if(a_tag.length > 0){
            $('html, body').animate({
                scrollTop: a_tag.offset().top - $('').height() -  $('').height() // 상단에 특정 위치를 제외하고 스크롤할때 해당 이름 작성
            }, speed);
        }
    }







    $(document).ready(function () {
        let sumCondition = '${searchOrders.sumCondition}';
        let radioId
        let status='${searchOrders.status}'
        if (sumCondition === 'year(h.request_date)') {
            radioId = 'sumCondition_year'
        }
        if (sumCondition === 'quarter(h.request_date)') {
            radioId = 'sumCondition_quarter'
        }
        if (sumCondition === 'month(h.request_date)') {
            radioId = 'sumCondition_month'
        }
        if (sumCondition === 'week(h.request_date)') {
            radioId = 'sumCondition_week'
        }
        if (sumCondition === 'b.name') {
            radioId = 'sumCondition_buyer'
        }
        if (sumCondition === 'addm.name') {
            radioId = 'sumCondition_addm'
        }
        if (sumCondition === 'h.status') {
            radioId = 'sumCondition_status'
        }
        $('#' + radioId).prop("checked", true);
        console.log(radioId + ' : radioId')


    })


    window.setBuyerInfo = function (buyerCode, buyerName) {
        $('#setBuyerCode').val(buyerCode);
         $('#setBuyerName').val(buyerName);
    }

    // window.setOrderCode = function (orderCode) {
    //     $('#setOrderCode').val(orderCode);
    // }
    window.setProduct = function (productCode, productName) {
        $('#setProductCode').val(productCode);
        $('#setProductName').val(productName);
    }
    window.setMemberInfo = function (adduserId, adduserName) {
        $('#setAdduserId').val(adduserId);
        $('#setAdduserName').val(adduserName);
    }

    $('#buyerPopupButton').click(function () {
        buyerPopup();
    });

    // $('#orderPopupButton').click(function () {
    //     orderPopup();
    // });

    $('#productPopupButton').click(function () {
        productPopup();
    });
    $('#memberPopupButton').click(function () {
        memberPopup();
    });

    function productPopup() {
        let url = "${pageContext.request.contextPath}/report/productPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }

    // function orderPopup() {
    //     let url = "/report/orderPopup";
    //     let popupWidth = 600;
    //     let popupHeight = 500;
    //     let popupX = (window.screen.width / 2) - (popupWidth / 2);
    //     let popupY = (window.screen.height / 2) - (popupHeight / 2);
    //     let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
    //     window.open(url, "", popupOption);
    // }

    function buyerPopup() {
        let url = "${pageContext.request.contextPath}/search/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }
    function memberPopup() {
        let url = "${pageContext.request.contextPath}/search/memberPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }


    if ('${message}' != '')
        alert('${message}');





    $(document).ready(function () {
        $('#1').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#2').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#3').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#4').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#5').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#6').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#7').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#8').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#9').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#10').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#11').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#12').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#13').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#14').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#15').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#16').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#17').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#18').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#19').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })
        $('#20').change(function () {
            $('#ordersTable td:nth-child(' + this.id + '),th:nth-child(' + this.id + ')').toggle();
        })

    })


    $(document).ready(function () {
        $('#ordersTable th').each(function (column) {
            $(this).click(function () {
                if ($(this).is('.asc')) {
                    $(this).removeClass('asc');
                    $(this).addClass('desc');
                    sortdir = -1;

                } else {
                    $(this).addClass('asc');
                    $(this).removeClass('desc');
                    sortdir = 1;
                }

                $(this).siblings().removeClass('asc');
                $(this).siblings().removeClass('desc');

                var rec = $('#ordersTable').find('tbody>tr').get();
                console.log(rec)
                console.log()
                rec.sort(function (a, b) {
                    var val1 = $(a).children('td').eq(column).text().toUpperCase();
                    var val2 = $(b).children('td').eq(column).text().toUpperCase();
                    return (val1 < val2) ? -sortdir : (val1 > val2) ? sortdir : 0;
                });

                $.each(rec, function (index, row) {
                    $('#ordersTable tbody ').append(row);
                });
            });
        });
    });


    function searchOrderCode() {
        console.log("jsp 서치오더코드")
        // const boardId = document.querySelector("#boardId").value;
        const partOfOrderCode = document.querySelector("#inputOrderCode").value;
        console.log(partOfOrderCode)

        // console.log(data) 인풋데이터 받아짐
        fetch("${pageContext.request.contextPath}/report/search/order_code", {
            method: "post",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify(partOfOrderCode)
        })
            .then(res => res.json())
            .then(
                function (변수2) {
                    console.log(변수2);
                    for (const i of 변수2) {
                        console.log(i)
                        const orderCodesData = `<input type="checkbox" name="order_code" value="\${i}">`
                        console.log(orderCodesData)
                        document.querySelector("#orderCodes").innerHTML = orderCodesData;
                    }
                })
    }


    // $("input[type='checkbox']").click(function() {
    //     var index = $(this).attr('name').substr(2);
    //     $('table tr').each(function() {
    //         $('td:eq(' + index + ')',this).toggle();
    //     });
    // });

    <%--$('th').click(function(){--%>
    <%--    const orderByClick=$(this).attr("id");--%>
    <%--     alert(orderByClick);--%>
    <%--     document.querySelector('#orderByUrlParam').innerHTML=`<c:param name="orderBy"  value="\${orderByClick}" />`;--%>
    <%--    // const orderBy= new URLSearchParams(orderByClick).toString();--%>

    <%--    &lt;%&ndash;$.get(${orderByUrl});&ndash;%&gt;--%>
    <%--    $('#orderByUrl').submit();--%>
    <%--});--%>


    // document.querySelector('#order_code_check').addEventListener()
    // function myFunction() {
    //     var checkedList = document.querySelector(addEventListener(getCheckboxValue()))
    //     var element = document.getElementById("checkedList");
    //     element.classList.add("hidden_col");
    // }


    // CheckBox 검사

    // function getNumber(Event){
    //     let result = '';
    //     if(Event.target.checked)  {
    //         result = Event.target.value;
    //         console.log(result)
    //         $('#ordersTable td:nth-child('+result+'),th:nth-child('+result+')').toggle();
    //     }}


    // $("input[type=checkbox]").click(getCheckboxValue(event));
    //
    //
    //  $("input[type='checkbox']").click().$('#ordersTable td:nth-child('+this.val()+'),th:nth-child('+this.val()+')').toggle();


    // $(window).load(function(){
    //     // 실행할 내용
    // });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>