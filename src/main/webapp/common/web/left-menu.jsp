<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div id="sidebar" class="span3">
    <div class="well well-small">
        <ul class="nav nav-list">
            <c:forEach var="listCategory" items="${categories.listResult}">
                <li>
                    <a href="<c:url value="/product?page=1&category_id=${listCategory.category_id}"/>" id="category_id_${listCategory.category_id}" style="text-transform: capitalize;">
                        <span class="icon-chevron-right"></span> ${listCategory.category_name}
                    </a>
                </li>
            </c:forEach>
            <li style="border:0"> &nbsp;</li>
            <c:set var="cart" value="${sessionScope.model}" />
            <li>
                <a class="totalInCart" href="<c:url value="/cart"/>">
                    <strong>Tổng Giỏ Hàng
                        <span class="badge badge-warning pull-right" style="line-height:18px;">
                            <c:if test="${cart == null}">0 </c:if>
                            <c:if test="${cart != null}">${sessionScope.totalPrice} </c:if>
                            &#8363;
                        </span>
                    </strong>
                </a>
            </li>
        </ul>
    </div>

    <div class="well well-small alert alert-warning cntr" style="display: none">
        <h2>50% Discount</h2>
        <p>
            only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
        </p>
    </div>

    <ul class="nav nav-list promowrapper">
        <li>
            <div class="thumbnail">
                <a href="<c:url value="/product-detail?product_id=5"/>" title="add to cart">
                    <img src="<c:url value="/template/web/img/5.jpg"/>" alt="bootstrap ecommerce templates">
                </a>
                <div class="caption">
                    <h4><a class="defaultBtn" href="<c:url value="/product-detail?product_id=5"/>">Xem</a> <span
                            class="pull-right">100000 &#8363;</span></h4>
                </div>
            </div>
        </li>
        <li style="border:0"> &nbsp;</li>
    </ul>
</div>
