<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sản phẩm</title>
</head>
<body>
<div class="row">
    <%@include file="/common/web/left-menu.jsp"%>
    <div class="span9">
        <!-- Products -->
        <form action="<c:url value='/product'/>" id="formSubmit" method="get">
            <div class="well well-small">
                <h3>Sản Phẩm</h3>
                <hr class="soften"/>
                <div class="row-fluid">
                    <ul class="thumbnails">
                        <c:forEach var="products" items="${model.listResult}">
                            <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                                <%--<form action="<c:url value='/product-detail'/>" id="formProductDetail" method="get">--%>
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value="/product-detail?product_id=${products.product_id}"/>" title="add to cart">
                                            <span class="icon-search"></span> XEM SẢN PHẨM
                                        </a>
                                        <a href="<c:url value="/product-detail?product_id=${products.product_id}"/>">
                                            <c:if test="${products.product_image == null}">
                                                <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                            </c:if>
                                            <c:if test="${products.product_image != null}">
                                                <img src="<c:url value="${products.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                            </c:if>
                                        </a>
                                        <div class="caption cntr">
                                            <p style="height: 40px; text-transform: capitalize; overflow: hidden;">${products.product_name}</p>
                                            <p style="color: #ff0000;"><i class="icon-money"></i><strong> ${products.product_price} &#8363;</strong></p>
                                            <h4><a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${products.product_id}"/>" title="add to cart"><i class="icon-shopping-cart"></i> Thêm vào giỏ </a></h4>
                                                <%--<div class="actionList">
                                                    <a class="pull-left" href="#">Add to Wish List </a>
                                                    <a class="pull-left" href="#"> Add to Compare </a>
                                                </div>--%>
                                            <br class="clr">
                                        </div>
                                    </div>
                                <%--</form>--%>
                            </li>
                        </c:forEach>
                    </ul>
                </div>
                <ul class="pagination" id="pagination"></ul>
                <input type="hidden" value="" id="page" name="page"/>
            </div>
        </form>
    </div>
</div>
<script>
    var totalPages = ${model.totalPage};
    var currentPage = ${model.page};
    jQuery(document).ready(function ($) {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#page').val(page);
                    $('#formSubmit').submit();
                }
            }
        });
    });
</script>
</body>
</html>
