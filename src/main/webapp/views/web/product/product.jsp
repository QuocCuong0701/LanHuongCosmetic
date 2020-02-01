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
    <div id="sidebar" class="span3">
        <div class="well well-small">
            <ul class="nav nav-list">
                <c:forEach var="listCategory" items="${categories.listResult}">
                    <li>
                        <a href="#" id="category_id_${listCategory.category_id}" style="text-transform: capitalize;">
                            <span class="icon-chevron-right"></span> ${listCategory.category_name}
                        </a>
                    </li>
                </c:forEach>
                <%--<li><a href="products.html"><span class="icon-chevron-right"></span>Fashion</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>Watches</a></li>
                <li><a href="products.html"><span class="icon-chevron-right"></span>See All Jewelry & Watches</a></li>--%>
                <li style="border:0"> &nbsp;</li>
            </ul>
        </div>

        <div class="well well-small alert alert-warning cntr">
            <h2>50% Discount</h2>
            <p>
                only valid for online order. <br><br><a class="defaultBtn" href="#">Click here </a>
            </p>
        </div>

        <ul class="nav nav-list promowrapper">
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/bootstrap-ecommerce-templates.png" alt="bootstrap ecommerce templates">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
            <li style="border:0"> &nbsp;</li>
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/shopping-cart-template.png" alt="shopping cart template">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
            <li style="border:0"> &nbsp;</li>
            <li>
                <div class="thumbnail">
                    <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                    <img src="assets/img/bootstrap-template.png" alt="bootstrap template">
                    <div class="caption">
                        <h4><a class="defaultBtn" href="product_details.html">VIEW</a> <span class="pull-right">$22.00</span></h4>
                    </div>
                </div>
            </li>
        </ul>
    </div>

    <div class="span9">
        <div class="well np">
            <div id="myCarousel" class="carousel slide homCar">
                <div class="carousel-inner">
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/bootstrap_free-ecommerce.png"/>" alt="bootstrap ecommerce templates">
                        <div class="carousel-caption">
                            <h4>Bootstrap shopping cart</h4>
                            <p><span>Very clean simple to use</span></p>
                        </div>
                    </div>
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/carousel1.png"/>" alt="bootstrap ecommerce templates">
                        <div class="carousel-caption">
                            <h4>Bootstrap Ecommerce template</h4>
                            <p><span>Highly Google seo friendly</span></p>
                        </div>
                    </div>
                    <div class="item active">
                        <img style="width:100%" src="<c:url value="/template/web/img/carousel3.png"/>" alt="bootstrap ecommerce templates">
                        <div class="carousel-caption">
                            <h4>Twitter Bootstrap cart</h4>
                            <p><span>Very easy to integrate and expand.</span></p>
                        </div>
                    </div>
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/bootstrap-templates.png"/>" alt="bootstrap templates">
                        <div class="carousel-caption">
                            <h4>Bootstrap templates integration</h4>
                            <p><span>Compitable to many more opensource cart</span></p>
                        </div>
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <!--
        Products
        -->
        <div class="well well-small">
            <h3>Our Products</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <c:forEach var="products" items="${model.listResult}">
                        <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                            <div class="thumbnail">
                                <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                                <a href="product_details.html">
                                    <c:if test="${products.product_image == null}">
                                        <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                    </c:if>
                                    <c:if test="${products.product_image != null}">
                                        <img src="<c:url value="${products.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                    </c:if>
                                </a>
                                <div class="caption cntr">
                                    <p style="height: 40px; text-transform: capitalize;">${products.product_name}</p>
                                    <p><strong> ${products.product_price}</strong></p>
                                    <h4><a class="shopBtn" href="#" title="add to cart"> Add to cart </a></h4>
                                        <%--<div class="actionList">
                                            <a class="pull-left" href="#">Add to Wish List </a>
                                            <a class="pull-left" href="#"> Add to Compare </a>
                                        </div>--%>
                                    <br class="clr">
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
            <ul class="pagination" id="pagination"></ul>
            <input type="hidden" value="" id="page" name="page"/>
            <input type="hidden" value="" id="maxPageItem" name="maxPageItem"/>
            <input type="hidden" value="" id="sortName" name="sortName"/>
            <input type="hidden" value="" id="sortBy" name="sortBy"/>
        </div>
    </div>
</div>
<script>
    var totalPages = ${model.totalPage};
    var currentPage = 1;
    var limit = 12;
    jQuery(document).ready(function ($) {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('product_name');
                    $('#sortBy').val('asc');
                }
            }
        });
    })
    /*$(function () {
        window.pagObj = $('#pagination').twbsPagination({
            totalPages: totalPages,
            visiblePages: 10,
            startPage: currentPage,
            onPageClick: function (event, page) {
                if (currentPage != page) {
                    $('#maxPageItem').val(limit);
                    $('#page').val(page);
                    $('#sortName').val('product_name');
                    $('#sortBy').val('asc');
                }
            }
        });
    });*/
</script>
</body>
</html>
