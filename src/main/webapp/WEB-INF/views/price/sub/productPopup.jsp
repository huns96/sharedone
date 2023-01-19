<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>제품 검색</title>
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
<div id="memberPopup">
    <h5><b>제품 목록</b></h5>
    <form action="/price/sub/productPopup" role="search" style="display: flex; margin: 20px 0;">
        <select name="type" id="searchTypeSelect" class="form-select search-select">
            <%--<option value="all"></option>--%>
            <option value="product_code" ${param.type == 'product_code' ? 'selected' : '' }>제품코드</option>
            <option selected value="product_name" ${param.type == 'product_name' ? 'selected' : '' }>제품명</option>
        </select>
        <input value="${param.value }" id="searchInput" class="form-control search-input" type="text" name="value">
        <div id="buttonDiv">
            <button id="reset-btn" class="btn btn-secondary search-btn btn-sm" type="button">초기화</button>
            <button class="btn btn-dark search-btn btn-sm" type="submit">조회</button>
        </div>
    </form>
    <div style="height: 250px;">
        <table class="table" id="product-table">
            <thead>
            <tr>
<%--                <th style="width: 10%"></th>--%>
                <%--<th>#</th>--%>
                <th style="width: 30%">제품코드</th>
                <th style="width: 30%">제품명</th>

            </tr>
            </thead>
            <tbody>
            <c:forEach items="${products}" var="product" varStatus="status">
                <tr>
<%--                    <td><input type="checkbox" id="checkbox"></td>--%>
                    <%--<td>${status.count}</td>--%>
                    <td>${product.product_code}</td>
                    <td>${product.name}</td>

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
                        <c:url value="/price/sub/productPopup" var="pageLink"></c:url>
                        <a class="page-link" href="${pageLink}?page=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                    <c:forEach begin="1" end="${pages}" varStatus="status" var="pageNumb">
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

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(function() {

        $('#product-table tr').dblclick(function() {
            let tr = $(this);
            let td = tr.children();
            let productCode = td.eq(0).text();
            let productName = td.eq(1).text();
            opener.$('#productCodeInput').val(productCode);
            opener.$("[name='product_code']").val(productCode);
            opener.$('#productNameInput').val(productName);
            opener.$("[name='product_name']").val(productName);

            close();


        });

        /* 검색 초기화 */
        $('#reset-btn').click(function() {
            $('#searchInput').val("");
        });

        /* 확인 버튼 */
        $('#confirm').click(function() {
            const checkbox = $('input[id=checkbox]:checked');
            const tr = checkbox.parent().parent();
            const td = tr.children();
            const productCode = td.eq(1).text();
            const productName = td.eq(2).text();

            // reportSearch.tag setProduct()에 값 전달
            opener.setProduct(productCode, productName);
            window.close();
        });

    })

</script>
</body>
</html>
