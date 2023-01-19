<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<div class="row">
    <div class="col">
        <div id="search" class="page-background" style="height: 211px">
            <div style="margin-left: 44px; margin-right: 44px">
            <form action="work">
                <div class="input-group">
                    <label class="form-control" style="  text-align:center">주문번호</label>

                    <input id="setOrderCode" value="${searchOrders.order_code}" type="text" size="10"
                           class="form-control"
                           name="order_code"
                           placeholder=""/>
                    <%--                    <a id="orderPopupButton" class="btn btn-outline-secondary">검색</a>--%>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">바이어</label>
                    <input id="setBuyerName" value="${searchOrders.buyer_name}" type="text" size="10"
                           class="form-control"
                           name="buyer_name"
                           placeholder=""/>
                    <input id="setBuyerCode" class="form-control search-input" type="hidden" name="buyer_code"
                           value="${searchOrders.buyer_code}">
                    <a id="buyerPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">작성자</label>
                    <input id="setAdduserName" type="text" value="${searchOrders.adduser_name}" size="10" class="form-control"
                           name="adduser_name"
                           placeholder=""/>
                    <input id="setAdduserId" type="hidden" value="${searchOrders.adduser}" size="10" class="form-control"
                           name="adduser"
                           placeholder=""/>
                    <a id="memberPopupButton" class="btn btn-outline-secondary">검색</a>
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
                           name="from_request_date" value="${searchOrders.from_request_date}"
                           placeholder=""/>
                    <label id="inputLabel" class="form-control"
                           style="width: 10px !important;  text-align:center">~</label>
                    <input type="date" size="10" class="form-control"
                           name="to_request_date" value="${searchOrders.to_request_date}"
                           placeholder=""/>
                </div>
                <div class="input-group">
                    <label class="form-control" style="
                      text-align:center">제품</label>
                    <input id="setProductName" value="${searchOrders.product_name}" type="text" size="10"
                           class="form-control"
                           name="product_name"
                           placeholder=""/>
                    <input id="setProductCode" type="hidden" value="${searchOrders.product_code}" type="text" size="10"
                           class="form-control"
                           name="product_code"
                           placeholder=""/>
                    <a id="productPopupButton" class="btn btn-outline-secondary">검색</a>
                </div>

                <div class="input-group" style="width: 714px">
                    <label class="form-control " style="  text-align:center">작성일</label>
                    <input type="date" size="10" class="form-control"
                           name="from_add_date" value="${searchOrders.from_add_date}"
                           placeholder=""/>
                    <label class="form-control" style="width: 10px !important;  text-align:center">~</label>
                    <input type="date" size="10" class="form-control"
                           name="to_add_date" value="${searchOrders.to_add_date}"
                           placeholder=""/>
                </div>

                <div class="input-group">
                    <label class="form-control" style="  text-align:center">주문상태</label>
                    <select name="status" class="form-select">
                        <option value="" selected></option>
                        <option value="작성중" <c:if test="${searchOrders.status=='작성중'}">selected</c:if>>작성중</option>
                        <option value="승인요청" <c:if test="${searchOrders.status=='승인요청'}">selected</c:if>>승인요청</option>
                        <option value="승인완료" <c:if test="${searchOrders.status=='승인완료'}">selected</c:if>>승인완료</option>
                        <option value="승인취소" <c:if test="${searchOrders.status=='승인취소'}">selected</c:if>>승인취소</option>
                        <option value="반려" <c:if test="${searchOrders.status=='반려'}">selected</c:if>>반려</option>
                        <option value="종결" <c:if test="${searchOrders.status=='종결'}">selected</c:if>>종결</option>
                        <option value="반려" <c:if test="${searchOrders.status=='반려'}">selected</c:if>>반려</option>
                    </select>
                </div>

                <br><br><br><br><br>
                <hr>
                <div style="font-size: 19px;  ">
                    <b>&nbsp; 합계조건 &nbsp; </b>
                    <input type="radio" name="sumCondition" id="" value="" checked/> 선택안함
                    <input type="radio" name="sumCondition" id="sumCondition_year" value="year(h.request_date)"/> 년별
                    <input type="radio" name="sumCondition" id="sumCondition_quarter" value="quarter(h.request_date)"/>
                    분기별
                    <input type="radio" name="sumCondition" id="sumCondition_month" value="month(h.request_date)"/> 월별
                    <input type="radio" name="sumCondition" id="sumCondition_week" value="week(h.request_date)"/> 주별
                    <input type="radio" name="sumCondition" id="sumCondition_buyer" value="b.name"/> 바이어별
                    <input type="radio" name="sumCondition" id="sumCondition_addm" value="addm.name"/> 담당자별
                    <input type="radio" name="sumCondition" id="sumCondition_status" value="h.status"/> 주문상태별
                    <%--                    <input type="radio" name="sumCondition" value="category" /> 카테고리별--%>

                    <input class="btn btn-dark" type="submit" value="조회" style="float:right;margin-right: 98px">
                    <a href="/report/work?order_code=%22%22" class="btn btn-secondary search-btn"
                       style="margin-right: 8px"> 초기화</a>
                    <br> &nbsp;

                </div>

            </form>
            </div>
        </div>
    </div>
</div>
