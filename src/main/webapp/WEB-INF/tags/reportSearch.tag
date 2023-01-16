<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="row">
    <div class="col">
        <div id="search" class="page-background">
            <form action="work">
                <div class="input-group">
                    <label class="form-control" style="  text-align:center">주문번호</label>

                    <input id="setOrderCode" type="text" size="10" class="form-control"
                           name="order_code"
                           placeholder=""/>
                    <a id="orderPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">바이어</label>
                    <input id="newBuyerCode" type="text" size="10" class="form-control"
                           name="buyer_code"
                           placeholder=""/>
                    <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">작성자</label>
                    <input id="" type="text" size="10" class="form-control"
                           name="adduser"
                           placeholder=""/>
                    <a id="adduserPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>


                <%--                        <div class="input-group" >--%>
                <%--                            <label class="form-control" style="  text-align:center">통화</label>--%>
                <%--                            <select  class="form-select">--%>
                <%--                                <option value="" selected></option>--%>
                <%--                                <option value="원">원</option>--%>
                <%--                                <option value="달러">달러</option>--%>
                <%--                            </select>--%>
                <%--                        </div>--%>


                <div class="input-group" style="width: 714px">
                    <label class="form-control " style="  text-align:center">요청일</label>
                    <input type="date" size="10" class="form-control"
                           name="from_request_date"
                           placeholder=""/>
                    <label id="inputLabel" class="form-control"
                           style="width: 10px !important;  text-align:center">~</label>
                    <input type="date" size="10" class="form-control"
                           name="to_request_date"
                           placeholder=""/>
                </div>
                <div class="input-group">
                    <label class="form-control" style="  text-align:center">제품</label>
                    <input id="setProduct" type="text" size="10" class="form-control"
                           name="product_code"
                           placeholder=""/>
                    <a id="productPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>

                <div class="input-group" style="width: 714px">
                    <label class="form-control " style="  text-align:center">작성일</label>
                    <input type="date" size="10" class="form-control"
                           name="from_add_date"
                           placeholder=""/>
                    <label class="form-control" style="width: 10px !important;  text-align:center">~</label>
                    <input type="date" size="10" class="form-control"
                           name="to_add_date"
                           placeholder=""/>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">주문상태</label>
                    <select name="status" class="form-select">
                        <option value="" selected></option>
                        <option value="작성중">작성중</option>
                        <option value="승인요청">승인요청</option>
                        <option value="승인완료">승인완료</option>
                        <option value="승인취소">승인취소</option>
                        <option value="반려">반려</option>
                        <option value="종결">종결</option>
                        <option value="반려">반려</option>
                    </select>
                </div>

                <br><br><br><br><br>
                <hr>
                <b>&nbsp; 합계조건 &nbsp; </b>
                <input type="radio" name="sumCondition" checked value="i.num"/> 선택안함
                <input type="radio" name="sumCondition" value="year(h.request_date)"/> 년별
                <input type="radio" name="sumCondition" value="quarter(h.request_date)"/> 분기별
                <input type="radio" name="sumCondition" value="month(h.request_date)"/> 월별
                <input type="radio" name="sumCondition" value="week(h.request_date)"/> 주별
                <input type="radio" name="sumCondition" value="b.name"/> 바이어별
                <input type="radio" name="sumCondition" value="addm.name"/> 담당자별
                <input type="radio" name="sumCondition" value="h.status"/> 주문상태별
                <%--                    <input type="radio" name="sumCondition" value="category" /> 카테고리별--%>

                <input class="btn btn-dark" type="submit" value="조회"
                       style="float:right; width:120px ;margin-right: 100px">
                <br><br>

            </form>

        </div>
    </div>
</div>
