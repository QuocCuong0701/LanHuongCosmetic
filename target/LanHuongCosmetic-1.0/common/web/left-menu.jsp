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
                <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span>
                    QUICK VIEW</a>
                <img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
                <div class="caption">
                    <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span
                            class="pull-right">$22.00</span></h4>
                </div>
            </div>
        </li>
        <li style="border:0"> &nbsp;</li>
    </ul>
</div>
