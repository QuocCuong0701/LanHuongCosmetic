<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết sản phẩm</title>
</head>
<body>
<div class="row">
    <%@include file="/common/web/left-menu.jsp"%>
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/trang-chu"/>">Trang Chủ</a> <span class="divider">/</span></li>
            <li><a href="<c:url value="/product?page=1"/>">Sản Phẩm</a> <span class="divider">/</span></li>
            <li class="active">Xem sản phẩm</li>
        </ul>
        <%--<c:forEach var="productDetail" items="${model}">--%>
            <div class="well well-small">
                <div class="row-fluid">
                    <div class="span5">
                        <div id="myCarousel" class="carousel slide cntr">
                            <div class="carousel-inner">
                                <div class="item">
                                    <a href="#">
                                        <%--<img src="<c:url value="${productDetail.product_image}"/>" alt="" style="width:100%">--%>
                                        <c:if test="${productDetail.product_image == null}">
                                            <img src="<c:url value="/template/web/img/noimages.png"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                        <c:if test="${productDetail.product_image != null}">
                                            <img src="<c:url value="${productDetail.product_image}"/>" alt="" style="width: 207px; height: 267px;">
                                        </c:if>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="span7">
                        <h3 style="text-transform: uppercase;">${productDetail.product_name}</h3>
                        <hr class="soft">
                        <form class="form-horizontal qtyFrm">
                            <div class="control-group">
                                <label class="control-label"><span style="color: #ff0000;font-size: 20px;font-weight: 600;"><fmt:formatNumber pattern="###,###" value="${productDetail.product_price}"/> đ</span></label>
                                <div class="controls">
                                    <input type="number" class="span6" placeholder="Số lượng">
                                </div>
                            </div>
                            <p>
                                <a class="shopBtn" href="<c:url value="/cart?act=add&product_id=${productDetail.product_id}"/>" title="Thêm vào giỏ">
                                    <i class="icon-shopping-cart"></i> Thêm vào giỏ
                                </a>
                            </p>
                        </form>
                    </div>
                </div>
                <hr class="softn clr">

                <ul id="productDetail" class="nav nav-tabs">
                    <li class="active"><a href="#home" data-toggle="tab">Thông tin sản phẩm</a></li>
                    <li class=""><a href="#profile" data-toggle="tab">Chi tiết sản phẩm</a></li>
                </ul>
                <div id="myTabContent" class="tab-content tabWrapper">
                    <div class="tab-pane fade active in" id="home">
                        <p>${productDetail.product_description}</p>
                    </div>
                    <div class="tab-pane fade" id="profile">
                        <p>${productDetail.product_detail}</p>
                    </div>
                </div>
            </div>
        <%--</c:forEach>--%>
    </div>
</div>
<script>
    /*var totalPages = ${model.totalPage};
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
    });*/
</script>
</body>
</html>
