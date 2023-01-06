<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>>
<style>
    *{
        font-family: ;
    }
    a{
        text-decoration-line: none;
        color: white;
    }
    .wrap{
        background-color: black;
        width: 200px;
        height: 937px;
        font-family: 나눔고딕;
        text-align: center;
    }
    .menu{
        padding-top: 5px;
        padding-bottom: 5px;
        border-bottom: 1px solid;
    }
    .menu a{
        font-size: 30px;
        color: #008148;
    }

    .logo{
        font-size: 30px;
        padding-top: 5px;
        padding-bottom: 5px;
    }

    .dropdwon-list{
        margin: 0;
        padding: 0;
    }
    li{
        list-style: none;
        padding-left: 30px;
        text-align: left;
    }

    li:first-child{
        padding-top: 5px;
    }

    li:last-child{
        padding-bottom: 5px;
        border-bottom: 1px solid;
    }

    ul{
        padding-left: 0;
        padding-bottom: 10px;
    }

</style>
<%-- authorize tag --%>
<%-- spring security expressions --%>
<sec:authorize access=""></sec:authorize>

<div class="wrap">
    
    <div class="menu">
        <a href=""><i class="fa-brands fa-youtube logo"></i></a>
    </div>
    <div class="menu dropdwon"><a href="">마스터</a></div>
        <ul class="dropdwon-list">
            <li><a href="">회원</a></li>
            <li><a href="">제품</a></li>
            <li><a href="">바이어</a></li>
            <li><a href="">판매가</a></li>
        </ul>
    <div class="menu dropdwon"><a href="">오더 관리</a></div>
        <ul class="dropdwon-list">
            <li><a href="">오더 등록</a></li>
            <li><a href="">오더 관리</a></li>
        </ul>
    <div class="menu dropdwon"><a href="">오더 현황</a></div>
    <a href="">로그인</a>
    <a href="">로그아웃</a>
</div>

<script>

</script>