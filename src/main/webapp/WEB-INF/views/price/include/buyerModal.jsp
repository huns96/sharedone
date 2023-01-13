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
<!-- Modal -->
<div class="modal fade" id="buyerModal" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel" style="left: 10px">바이어</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close" style="right: 10px"></button>
      </div>
      <div class="modal-body" style="float: left">
<%--        <form action="">--%>
<%--          <select name="" id="">--%>
<%--            <option value=""></option>--%>
<%--          </select>--%>
<%--          <div class="search">--%>
<%--            <input type="text">--%>
<%--            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="">--%>
<%--          </div>--%>
<%--        </form>--%>

        <form class="d-flex" role="search" action="">
          <select name="t" id="t" class="form-select" style="width: 160px ; font-size: 12px ">
            <option value="buyer_code" ${param.t == 'buyer_code' ? 'selected' : ''}>바이어코드</option>
            <option value="name" ${param.t == 'name' ? 'selected' : ''}>바이어명</option>
          </select>
          <input value="${param.q }" class="form-control me-2" id="keyword" type="search" placeholder="Search" aria-label="Search" name="q" style="font-size: 14px;" >
          <button class="btn btn-outline-success" id="select" type="button" data-bs-toggle="modal" data-bs-target="#buyer_code_search">
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </form>
  <table class="table table-hover">
    <thead>
    <tr>
      <th>#</th>
      <th>바이어코드</th>
      <th>바이어명</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${buyers}" var="buyer" varStatus="status">
      <tr id="buyer">
        <td>${status.count}</td>
        <td>${buyer.buyer_code}</td>
        <td>${buyer.name}</td>
<%--        <td>${buyer.address}</td>--%>
<%--        <td>${buyer.license}</td>--%>
<%--        <td>${buyer.contact}</td>--%>
<%--        <td>${buyer.adduser}</td>--%>
<%--        <td>${buyer.upduser}</td>--%>
      </tr>
    </c:forEach>
    </tbody>
  </table>
  </form>

      </div>
      <div class="modal-footer">
        <button id="buyerConfirmButton" type="button"
                class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary"
                data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="buyer_code_search" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModal" style="left: 10px">바이어코드 검색결과</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close" style="right: 10px"></button>
      </div>
      <div class="modal-body" style="float: left">
        <%--        <form action="">--%>
        <%--          <select name="" id="">--%>
        <%--            <option value=""></option>--%>
        <%--          </select>--%>
        <%--          <div class="search">--%>
        <%--            <input type="text">--%>
        <%--            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="">--%>
        <%--          </div>--%>
        <%--        </form>--%>

<%--        <form class="d-flex" role="search" action="">
          <select name="t" class="form-select" style="width: 160px ; font-size: 12px " id="t">
            <option value="buyer_code" ${param.t == 'buyer_code' ? 'selected' : ''}>바이어코드</option>
            <option value="buyer_name" ${param.t == 'buyer_name' ? 'selected' : ''}>바이어명</option>
          </select>
          <input value="${param.q }" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="q" style="font-size: 14px;" >
          <button id="select" class="btn btn-outline-success" &lt;%&ndash;type="submit"&ndash;%&gt; type="button" data-bs-toggle="modal"
                   &lt;%&ndash;data-bs-target=<c:if test=" ${t} == buyer_code">"#reroadbuyerModal"</c:if>&ndash;%&gt;>
            <i class="fa-solid fa-magnifying-glass"></i>
          </button>
        </form>--%>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>#</th>
            <th>바이어코드</th>
            <th>바이어명</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${buyerCodeSearch}" var="buyer" varStatus="status">
            <tr id="buyer">
              <td>${status.count}</td>
              <td>${buyer.buyer_code}</td>
              <td>${buyer.name}</td>
                <%--        <td>${buyer.address}</td>--%>
                <%--        <td>${buyer.license}</td>--%>
                <%--        <td>${buyer.contact}</td>--%>
                <%--        <td>${buyer.adduser}</td>--%>
                <%--        <td>${buyer.upduser}</td>--%>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        </form>

      </div>
      <div class="modal-footer">
        <button id="reroadbuyerConfirmButton" type="button"
                class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary"
                data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="name_search" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="example" style="left: 10px">바이어명 검색결과</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close" style="right: 10px"></button>
      </div>
      <div class="modal-body" style="float: left">
        <%--        <form action="">--%>
        <%--          <select name="" id="">--%>
        <%--            <option value=""></option>--%>
        <%--          </select>--%>
        <%--          <div class="search">--%>
        <%--            <input type="text">--%>
        <%--            <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" alt="">--%>
        <%--          </div>--%>
        <%--        </form>--%>

        <%--        <form class="d-flex" role="search" action="">
                  <select name="t" class="form-select" style="width: 160px ; font-size: 12px " id="t">
                    <option value="buyer_code" ${param.t == 'buyer_code' ? 'selected' : ''}>바이어코드</option>
                    <option value="buyer_name" ${param.t == 'buyer_name' ? 'selected' : ''}>바이어명</option>
                  </select>
                  <input value="${param.q }" class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="q" style="font-size: 14px;" >
                  <button id="select" class="btn btn-outline-success" &lt;%&ndash;type="submit"&ndash;%&gt; type="button" data-bs-toggle="modal"
                           &lt;%&ndash;data-bs-target=<c:if test=" ${t} == buyer_code">"#reroadbuyerModal"</c:if>&ndash;%&gt;>
                    <i class="fa-solid fa-magnifying-glass"></i>
                  </button>
                </form>--%>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>#</th>
            <th>바이어코드</th>
            <th>바이어명</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach items="${buyerNameSearch}" var="buyer" varStatus="status">
            <tr id="buyer">
              <td>${status.count}</td>
              <td>${buyer.buyer_code}</td>
              <td>${buyer.name}</td>
                <%--        <td>${buyer.address}</td>--%>
                <%--        <td>${buyer.license}</td>--%>
                <%--        <td>${buyer.contact}</td>--%>
                <%--        <td>${buyer.adduser}</td>--%>
                <%--        <td>${buyer.upduser}</td>--%>
            </tr>
          </c:forEach>
          </tbody>
        </table>
        </form>

      </div>
      <div class="modal-footer">
        <button id="name_ConfirmButton" type="button"
                class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
        <button type="button" class="btn btn-primary"
                data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<%--<div class="modal fade" id="buyerModal" tabindex="-1"--%>
<%--     aria-labelledby="exampleModalLabel" aria-hidden="true">--%>
<%--  <div class="modal-dialog">--%>
<%--    <div class="modal-content">--%>
<%--      <div class="modal-header">--%>
<%--        <h1 class="modal-title fs-5" id="ModalLabel">삭제</h1>--%>
<%--        <button type="button" class="btn-close" data-bs-dismiss="modal"--%>
<%--                aria-label="Close"></button>--%>
<%--      </div>--%>
<%--      <div class="modal-body">삭제하시겠습니까?</div>--%>
<%--      <div class="modal-footer">--%>
<%--        <button id="removeConfirmButton" type="button"--%>
<%--                class="btn btn-secondary" data-bs-dismiss="modal">확인</button>--%>
<%--        <button type="button" class="btn btn-primary"--%>
<%--                data-bs-dismiss="modal">취소</button>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script>
  document.querySelector("#t").addEventListener("click", function(){
    const type = document.querySelector("#t").value;

    const keyword = document.getElementById("keyword").value;

    document.querySelector("#select").setAttribute("data-bs-target", "#"+type+"_search");

  });




</script>
</body>
</html>
