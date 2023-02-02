<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>상품 검색</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        body { padding: 20px; }
        .footer { float: right; justify-content: flex-end; margin-bottom: 20px; }
        table { text-align: center }
        td, th {
            padding: 1em .5em;
            vertical-align: middle;
        }
        #searchTypeSelect{
            width: 130px;
        }
        #searchInput {
            width: 200px;
        }
        #buttonDiv {
            margin-top: 5px;
            margin-left: 40px;
        }
        .totalNum { margin-left: 20px; }
    </style>
</head>
<body>
<div id="productPopup">
    <h4><b>상품 목록</b></h4>
    <form id="searchFrom" action="${pageContext.request.contextPath}/search/productPopup" role="search" style="display: flex; margin: 20px 0;">
        <select name="type" id="searchTypeSelect" class="form-select search-select">
            <%--<option value="all"></option>--%>
            <option value="product_code" ${param.type == 'product_code' ? 'selected' : '' }>상품코드</option>
            <option selected value="product_name" ${param.type == 'product_name' ? 'selected' : '' }>상품명</option>
        </select>
        <input value="${param.value }" id="searchInput" class="form-control search-input" type="text" name="value">
        <input type="hidden" name="buyer_code" value="${param.buyer_code }">
        <input type="hidden" name="request_date" value="${param.request_date }">
        <div id="buttonDiv">
            <button id="reset-btn" class="btn btn-secondary search-btn btn-sm" type="button">초기화</button>
            <button id="search-btn" class="btn btn-dark search-btn btn-sm" type="submit">조회</button>
            <%--<button id="search-btn" class="btn btn-dark search-btn btn-sm" type="button">조회</button>--%>
        </div>
    </form>
    <div style="height: 250px;">
        <table class="table" id="item-table">
            <thead>
            <tr>
                <th style="width: 10%"></th>
                <%--<th>#</th>--%>
                <th style="width: 30%">상품코드</th>
                <th style="width: 30%">상품명</th>
                <%--<th style="width: 20%">카테고리</th>--%>
                <th style="width: 30%">단가</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${itemList}" var="item" varStatus="status">
                <tr>
                    <td><input type="checkbox" id="checkbox"></td>
                        <%--<td>${status.count}</td>--%>
                    <td>${item.product_code}</td>
                    <td>${item.product_name}</td>
                    <%--<td>${item.category_id}</td>--%>
                    <%--<td>${item.old_price}</td>--%>
                    <td><fmt:formatNumber value="${item.old_price}" pattern="#,###"/>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <c:if test="${total != null && total != ''}">
    <div class="totalNum"><b>총 ${total}건</b></div>
    </c:if>
    <%--페이지네이션--%>
    <div class="row justify-content-center">
        <div class="col-3">
            <nav aria-label="Page navigation example">
                <ul class="pagination pagination-sm">
                    <li class="page-item">
                        <c:url value="${pageContext.request.contextPath}/search/productPopup" var="pageLink">
                            <c:param name="buyer_code" value="${param.buyer_code }" />
                            <c:param name="request_date" value="${param.request_date }" />
                            <c:param name="type" value="${param.type }" />
                            <c:param name="value" value="${param.value }" />
                        </c:url>
                        <a class="page-link" href="${pageLink}&page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pages}" varStatus="status" var="pageNumb">
                        <li class="page-item  ${pageNum == pageNumb ? "active" : ""}">
                            <a class="page-link" href="${pageLink }&page=${pageNumb}">${pageNumb }</a>
                        </li>
                    </c:forEach>
                    <li class="page-item">
                        <a class="page-link" href="${pageLink }&page=${pages}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </div>
    <div class="footer">
        <button type="button" id="confirm" class="btn btn-primary">확인</button>
        <button type="button" class="btn btn-secondary" onclick="window.close()">취소</button>
    </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
    /* 부모창에서 값 가져오기 */
    /*let buyerCode = opener.$("#buyerCode").val();
    let requestDate = opener.$("#requestDate").val().replaceAll("-","");*/

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
            const itemCode = td.eq(1).text();
            const itemName = td.eq(2).text();
            /*const category = td.eq(3).text();*/
            const price = td.eq(3).text();

            // orderRegister의 setItemInfo()에 값 전달
            opener.setItemInfo(itemCode, itemName, /*category,*/ price.replace(/[^\d]+/g, ""));
            window.close();
        });
    })

</script>
</body>
</html>

