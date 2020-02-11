<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Giỏ hàng</title>
</head>
<body>
<div class="row">
    <div class="span12">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span class="divider">/</span></li>
            <li class="active">Giỏ hàng</li>
        </ul>
        <c:set var="cart" value="${sessionScope.model}" />
        <c:if test="${cart.size() > 0}">
            <div class="well well-small">
                <h1>Giỏ hàng<small class="pull-right">Có <span>${cart.size()}</span> sản phẩm trong giỏ</small></h1>
                <hr class="soften">
                <form action="/cart?act=update" method="post" id="formSubmit">
                    <div class="table-responsive" style="background: white">
                        <c:if test="${not empty cart}">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th></th>
                                    <th></th>
                                    <th>Sản phẩm</th>
                                    <th>Giá</th>
                                    <th>Số lượng</th>
                                    <th>Tổng</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="rows" items="${cart}">
                                    <tr>
                                        <td>
                                            <a href="<c:url value="/cart?act=remove&product_id=${rows.value.productModel.product_id}"/>"
                                               class="btn btn-mini btn-danger" style="border-radius: 50%;" title="Xóa sản phẩm">
                                                <span class="icon-remove"></span>
                                            </a>
                                            <input id="product_id" name="product_id" value="${rows.value.productModel.product_id}" type="hidden" />
                                        </td>
                                        <td><img width="50px" src="<c:url value="${rows.value.productModel.product_image}"/>" alt=""></td>
                                        <td>${rows.value.productModel.product_name}</td>
                                        <td>${rows.value.productModel.product_price} &#8363;</td>
                                        <td>
                                            <input id="quantity" size="16" type="number" value="${rows.value.quantity}"
                                                   style="max-width:34px" placeholder="Sl." name="quantity"/>
                                        </td>
                                        <td><c:out value="${rows.value.quantity * rows.value.productModel.product_price}"></c:out> &#8363;</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                                <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="controls" style="float: right">
                                            <button type="submit" class="shopBtn" id="update-cart" name="update"><i class="icon-refresh"></i> CẬP NHẬT GIỎ HÀNG</button>
                                        </div>
                                    </td>
                                </tr>
                                </tfoot>
                            </table>
                        </c:if>
                    </div>
                </form>
                <br>
                <div class="table-responsive">
                    <table class="table table-bordered" style="background: white">
                        <thead>
                        <tr><th colspan="2">Tổng giỏ hàng</th></tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th style="width: 70%">Thành tiền:</th>
                            <td><c:out value="${sessionScope.totalPrice}"/> &#8363;</td>
                        </tr>
                        <tr>
                            <th>Tổng cộng:</th>
                            <td><strong><c:out value="${sessionScope.totalPrice}"/> &#8363;</strong> </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="controls" style="float: right">
                                    <button type="submit" class="shopBtn" style="width: 200px; height: 40px;display: none"><i class="icon-check"></i> THANH TOÁN</button>
                                    <a class="btn-large shopBtn" href="<c:url value="/checkout"/>" style="width: 150px;"><i class="icon-check"></i> THANH TOÁN</a>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <a href="<c:url value="/product?page=1"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Tiếp tục mua sắm </a>
                <a href="login.html" class="shopBtn btn-large pull-right" style="display: none">Tiếp theo <span class="icon-arrow-right"></span></a>
            </div>
        </c:if>
        <c:if test="${cart.size() <= 0}">
            <div class="well well-small">
                <h1>Giỏ hàng</h1>
                <hr class="soften">
                <p><i>Không có sản phẩm nào.</i></p>
                <hr class="soften"/>
                <a href="<c:url value="/product?page=1"/>" class="shopBtn btn-large"><span class="icon-arrow-left"></span> Quay lại cửa hàng </a>
            </div>
        </c:if>
    </div>
</div>
<script>
    $('#update-cart').change(function (e) {
        e.preventDefault();
        var data = {};
        var ids = $('tbody input[type=number]').map(function () {
            return $(this).val();
        }).get();
        data['ids'] = ids;
        for(var id in data){
            if(id < 1){
                $('#update-cart').val(1)
            }
        }
    }).change();
</script>
</body>
</html>
