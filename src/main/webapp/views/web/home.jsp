<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Trang chủ</title>
</head>
<body>
<div class="row">
    <%@include file="/common/web/left-menu.jsp"%>

    <div class="span9">
        <div class="well np">
            <div id="myCarousel" class="carousel slide homCar">
                <div class="carousel-inner">
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/img1.jpg"/>" alt="bootstrap ecommerce templates">
                        <div class="carousel-caption">
                            <h4>Chuyên bán buôn - bán lẻ</h4>
                            <p><span>cam kết hàng chính hãng</span></p>
                        </div>
                    </div>
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/img4.jpg"/>" alt="bootstrap ecommerce templates">
                    </div>
                    <div class="item active">
                        <img style="width:100%" src="<c:url value="/template/web/img/img5.png"/>" alt="bootstrap ecommerce templates">
                    </div>
                    <div class="item">
                        <img style="width:100%" src="<c:url value="/template/web/img/img6.png"/>" alt="bootstrap templates">
                    </div>
                </div>
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
            </div>
        </div>
        <!-- Products -->
        <div class="well well-small">
                <h3 id="category_id_${category1.category_id}" style="text-transform: capitalize">${category1.category_name}</h3>
                <hr class="soften"/>
                <div class="row-fluid">
                    <ul class="thumbnails">
                        <c:forEach var="list1" items="${list1.listResult}">
                                <input type="hidden" value="${category1.category_id}" name="category_id"/>
                                <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                                    <div class="thumbnail">
                                        <a class="zoomTool" href="<c:url value="/product-detail?product_id=${list1.product_id}"/>" title="add to cart">
                                            <span class="icon-search"></span> Xem sản phẩm
                                        </a>
                                        <a href="<c:url value="/product-detail?product_id=${list1.product_id}"/>">
                                            <c:if test="${list1.product_image == null}">
                                                <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                            </c:if>
                                            <c:if test="${list1.product_image != null}">
                                                <img src="<c:url value="${list1.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                            </c:if>
                                        </a>
                                        <div class="caption cntr">
                                            <p style="height: 40px; text-transform: capitalize;overflow: hidden;"> ${list1.product_name}</p>
                                            <p style="color: #ff0000;"><i class="icon-money"></i><strong> ${list1.product_price} &#8363;</strong></p>
                                            <h4>
                                                <a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${list1.product_id}"/>" title="add to cart">
                                                <i class="icon-shopping-cart"></i> Thêm vào giỏ </a>
                                            </h4>
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
            </div>
        <div class="well well-small">
            <h3 id="category_id_${category2.category_id}" style="text-transform: capitalize">${category2.category_name}</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <c:forEach var="list2" items="${list2.listResult}">
                            <input type="hidden" value="${category2.category_id}" name="category_id"/>
                            <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                                <div class="thumbnail">
                                    <a class="zoomTool" href="<c:url value="/product-detail?product_id=${list2.product_id}"/>" title="add to cart">
                                        <span class="icon-search"></span> Xem sản phẩm
                                    </a>
                                    <a href="<c:url value="/product-detail?product_id=${list2.product_id}"/>">
                                        <c:if test="${list2.product_image == null}">
                                            <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                        <c:if test="${list2.product_image != null}">
                                            <img src="<c:url value="${list2.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                    </a>
                                    <div class="caption cntr">
                                        <p style="height: 40px; text-transform: capitalize;overflow: hidden;"> ${list2.product_name}</p>
                                        <p style="color: #ff0000;"><i class="icon-money"></i><strong> ${list2.product_price} &#8363;</strong></p>
                                        <h4>
                                            <a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${list2.product_id}"/>" title="add to cart">
                                                <i class="icon-shopping-cart"></i> Thêm vào giỏ </a>
                                        </h4>
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
        </div>
        <div class="well well-small">
            <h3 id="category_id_${category4.category_id}" style="text-transform: capitalize">${category4.category_name}</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <c:forEach var="products" items="${list4.listResult}">
                            <input type="hidden" value="${category4.category_id}" name="category_id"/>
                            <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                                <div class="thumbnail">
                                    <a class="zoomTool" href="<c:url value="/product-detail?product_id=${products.product_id}"/>" title="add to cart">
                                        <span class="icon-search"></span> Xem sản phẩm
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
                                        <p style="height: 40px; text-transform: capitalize;overflow: hidden;"> ${products.product_name}</p>
                                        <p style="color: #ff0000;"><i class="icon-money"></i><strong> ${products.product_price} &#8363;</strong></p>
                                        <h4>
                                            <a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${products.product_id}"/>" title="add to cart">
                                                <i class="icon-shopping-cart"></i> Thêm vào giỏ </a>
                                        </h4>
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
        </div>
        <div class="well well-small">
            <h3 id="category_id_${category3.category_id}" style="text-transform: capitalize">${category3.category_name}</h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <c:forEach var="list3" items="${list3.listResult}">
                            <input type="hidden" value="${category3.category_id}" name="category_id"/>
                            <li class="span4" style="margin-left: 0; margin-right: 1.42%;">
                                <div class="thumbnail">
                                    <a class="zoomTool" href="<c:url value="/product-detail?product_id=${list3.product_id}"/>" title="add to cart">
                                        <span class="icon-search"></span> Xem sản phẩm
                                    </a>
                                    <a href="<c:url value="/product-detail?product_id=${list3.product_id}"/>">
                                        <c:if test="${list3.product_image == null}">
                                            <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                        <c:if test="${list3.product_image != null}">
                                            <img src="<c:url value="${list3.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                    </a>
                                    <div class="caption cntr">
                                        <p style="height: 40px; text-transform: capitalize;overflow: hidden;"> ${list3.product_name}</p>
                                        <p style="color: #ff0000;"><i class="icon-money"></i><strong> ${list3.product_price} &#8363;</strong></p>
                                        <h4>
                                            <a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${list3.product_id}"/>" title="add to cart">
                                                <i class="icon-shopping-cart"></i> Thêm vào giỏ </a>
                                        </h4>
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
        </div>
        <!--
        Featured Products
        -->
        <div class="well well-small" style="display: none">
            <h3><a class="btn btn-mini pull-right" href="products.html" title="View more">VIew More<span class="icon-plus"></span></a> Featured Products  </h3>
            <hr class="soften"/>
            <div class="row-fluid">
                <ul class="thumbnails">
                    <li class="span4">
                        <div class="thumbnail">
                            <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                            <a  href="product_details.html"><img src="assets/img/d.jpg" alt=""></a>
                            <div class="caption">
                                <h5>Manicure & Pedicure</h5>
                                <h4>
                                    <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
                                    <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
                                    <span class="pull-right">$22.00</span>
                                </h4>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                            <a  href="product_details.html"><img src="assets/img/e.jpg" alt=""></a>
                            <div class="caption">
                                <h5>Manicure & Pedicure</h5>
                                <h4>
                                    <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
                                    <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
                                    <span class="pull-right">$22.00</span>
                                </h4>
                            </div>
                        </div>
                    </li>
                    <li class="span4">
                        <div class="thumbnail">
                            <a class="zoomTool" href="product_details.html" title="add to cart"><span class="icon-search"></span> QUICK VIEW</a>
                            <a  href="product_details.html"><img src="assets/img/f.jpg" alt=""/></a>
                            <div class="caption">
                                <h5>Manicure & Pedicure</h5>
                                <h4>
                                    <a class="defaultBtn" href="product_details.html" title="Click to view"><span class="icon-zoom-in"></span></a>
                                    <a class="shopBtn" href="#" title="add to cart"><span class="icon-plus"></span></a>
                                    <span class="pull-right">$22.00</span>
                                </h4>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <div class="well well-small" style="display: none">
            <a class="btn btn-mini pull-right" href="#">View more <span class="icon-plus"></span></a>
            Popular Products
        </div>
    </div>
</div>
</body>
</html>
