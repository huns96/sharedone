<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<style>
    .titleName{
        width: 60px;
        height: 46px;
    }

    #logLink{
        text-decoration-line: none;
        color: aliceblue;
    }

</style>

<div class="col-auto col-md-3 col-xl-2 px-sm-2 px-0 bg-dark" style="width: 200px">
    <div class="d-flex flex-column align-items-center align-items-sm-start px-3 pt-2 text-white min-vh-100">
        <a href="   " class="d-flex align-items-center pb-3 mb-md-0 me-md-auto text-white text-decoration-none">
            <span class="fs-5 d-none d-sm-inline">Menu</span>
        </a>
        <sec:authorize access="isAuthenticated()" var="login"></sec:authorize>
        <c:if test="${not login}">
            <a id="logLink" href="/member/login">로그인</a>
        </c:if>
        <c:if test="${login}">
            <div style="display: flex">
            <a id="logLink" href="/member/logout">로그아웃</a>
            <a id="logLink" href="/member/myPage" style="margin-left: 20px">마이페이지</a>
            </div>
        </c:if>
        <ul class="nav nav-pills flex-column mb-sm-auto mb-0 align-items-center align-items-sm-start" id="menu">
            <li class="nav-item">
                <a href="/member/login" class="nav-link align-middle px-0">
                    <i class="fa-solid fa-house" style="color: aliceblue;"></i> <span class="ms-1 d-none d-sm-inline" style="color: aliceblue;">Home</span>
                </a>
            </li>

            <li>
                <a href="#" class="nav-link px-0 align-middle">
                    <span class="ms d-none d-sm-inline" style="color: red; font-size: 20px;">마스터</span> </a>
            </li>
            <li class="w-100">
                <a href="/product/list" class="nav-link"> <span class="d-none d-sm-inline" style="align-items: center; color: aliceblue;">제품</span></a>
            </li>
            <li class="w-100">
                <a href="/buyer/list" class="nav-link"> <span class="d-none d-sm-inline" style="align-items: center; color: aliceblue;">바이어</span></a>
            </li>
            <li class="w-100">
                <a href="/price/priceList" class="nav-link"> <span class="d-none d-sm-inline" style="align-items: center; color: aliceblue;">판매단가</span></a>
            </li>
            <li class="w-100">
                <a href="/member/list" class="nav-link"> <span class="d-none d-sm-inline" style="align-items: center; color: aliceblue;">멤버</span></a>
            </li>

            <li>
                <a href="#" class="nav-link px-0 align-middle">
                    <span class="ms d-none d-sm-inline" style="color: red; font-size: 20px;">주문</span> </a>
            </li>
            <li class="w-100">
                <a href="/order/orderManagement" class="nav-link"> <span class="d-none d-sm-inline name" style="align-items: center; color: aliceblue;">주문관리</span></a>
            </li>
            <li class="w-100">
                <a href="/approval/approvalList" class="nav-link"> <span class="d-none d-sm-inline name" style="align-items: center; color: aliceblue;">주문승인</span></a>
            </li>

            <li>
                <a href="#" class="nav-link px-0 align-middle">
                    <span class="ms d-none d-sm-inline" style="color: red; font-size: 20px;">리포트</span> </a>
            </li>
            <li class="w-100">
                <a href="/report/result" class="nav-link"> <span class="d-none d-sm-inline name" style="align-items: center; color: aliceblue;">리포트</span></a>
            </li>
        </ul>
    </div>
</div>