<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<script>

    window.setBuyerInfo = function (buyerCode, buyerName) {
        $('#newBuyerCode').val(buyerCode);
        // $('#newBuyerName').val(buyerName);
    }

    window.setOrderCode = function (orderCode) {
        $('#setOrderCode').val(orderCode);
    }
    window.setProduct = function (productCode,productName) {
        $('#setProduct').val(productCode);
        $('#setProduct').val(productCode);

    }

    $('#buyerPopupButton').click(function () {
        buyerPopup();
    });

    $('#orderPopupButton').click(function () {
        orderPopup();
    });

    $('#productPopupButton').click(function () {
        productPopup();
    });

    function productPopup() {
        let url = "/report/productPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }
    function orderPopup() {
        let url = "/report/orderPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }

    function buyerPopup() {
        let url = "/search/buyerPopup";
        let popupWidth = 600;
        let popupHeight = 500;
        let popupX = (window.screen.width / 2) - (popupWidth / 2);
        let popupY = (window.screen.height / 2) - (popupHeight / 2);
        let popupOption = 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left=' + popupX + ', top=' + popupY;
        window.open(url, "", popupOption);
    }


    if ('${message}' != '')
        alert('${message}');


    // $(document).ready(function() {
    //     $("input[type='checkbox']").click(function() {
    //          let v1 =parseInt($(this).each(getCheckboxValue())) ;
    //         console.log($(this).id.val())
    //
    //         $('#ordersTable td:nth-child('+v1+'),th:nth-child('+v1+')').toggle();
    //     });
    // });
    //
    //


    //
    // $(document).ready(function () {
    //     $(".row_sum").each(function () {
    //         var $this = $(this);
    //         var sum_value = 0;
    //         $(".row_value",$(this).closest('tr')).each(function (e) {
    //             sum_value+=parseInt($(e).text());
    //         })
    //         $this.text(sum_value);
    //     })
    // })

    // $(document).ready(
    //     function calcSum() {
    //     // table element 찾기
    //     const table = document.getElementById('testTable');
    //     console.log(table)
    //     // 합계 계산
    //     let sumPrice = 0;
    //     for(let i = 0; i < table.rows.length; i++)  {
    //         sumPrice += parseInt(table.rows[i].cells[0].innerHTML);
    //     }
    //     document.querySelector('.row_sum').innerHTML=sumPrice.toString();
    //         console.log(sumPrice)}
    // )


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