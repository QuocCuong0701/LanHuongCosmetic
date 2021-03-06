<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-bill"/>
<c:url var="APIurl1" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Thanh toán</title>
</head>
<body>
<c:set var="cart" value="${sessionScope.model}" />
<ul class="breadcrumb">
    <li><a href="/trang-chu">Trang chủ</a> <span class="divider">/</span></li>
    <li class="active">Thanh toán</li>
</ul>
<div class="row">
    <div class="span4">
        <div class="well well-small">
            <ul id="productDetail" class="nav nav-tabs">
                <li class="active" style="width: 50%; text-align: center;"><a href="#home" data-toggle="tab">Đăng ký</a></li>
                <li class="" style="width: 50%; text-align: center;"><a style="margin-right: 0;" href="#profile" data-toggle="tab">Đăng nhập</a></li>
            </ul>
            <div id="myTabContent" class="tab-content tabWrapper">
                <div class="tab-pane fade active in" id="home">
                    <h4>Khách hàng mới</h4>
                    <p style="text-align: justify">Bằng cách tạo tài khoản bạn sẽ có thể mua sắm nhanh hơn, cập nhật tình trạng đơn hàng.</p>
                    <a href="/registration" type="submit" class="shopBtn btn-block">Đăng ký tài khoản</a>
                </div>
                <div class="tab-pane fade" id="profile">
                    <form class="form-horizontal loginFrm" action="/dang-nhap" id="formLogin" method="post">
                        <table class="table" style="border: 0;">
                            <tr>
                                <td>Tài khoản:</td>
                                <td><input type="text" class="span2" id="inputEmail" placeholder="Username" name="user_name"></td>
                            </tr>
                            <tr>
                                <td>Mật khẩu:</td>
                                <td><input type="password" class="span2" id="inputPassword" placeholder="Password" name="user_pass"></td>
                            </tr>
                        </table>
                        <div class="control-group">
                            <input type="hidden" value="login" id="action" name="action">
                            <button type="submit" class="shopBtn btn-block">Đăng nhập</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="span8">
        <div class="well well-small">
            <h1>Thanh toán<small class="pull-right"><span>${cart.size()}</span> sản phẩm</small></h1>
            <hr class="soften">
            <ul class="info-error" >
                <li><strong>Họ</strong> là ô bắt buộc</li>
                <li><strong>Tên</strong> là ô bắt buộc</li>
                <li><strong>Địa chỉ email</strong> là ô bắt buộc</li>
                <li><strong>Số điện thoại</strong> là ô bắt buộc</li>
                <li><strong>Địa chỉ</strong> là ô bắt buộc</li>
            </ul>
            <form action="/checkout" method="post" id="formSubmit">
                <div class="form-horizontal">
                    <h3>Thông tin thanh toán</h3>
                    <div style="background: white; height: 200px; border-radius: 4px;">
                        <div class="control-group">
                            <label class="control-label" style="margin-top: 10px">Họ và tên <sup>*</sup></label>
                            <div class="controls" style="margin-top: 10px"><input type="text" placeholder="Nguyễn Hồng N" name="full_name" value=""></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Email <sup>*</sup></label>
                            <div class="controls"><input type="email" placeholder="" value="${USERMODEL.user_email}" disabled></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Số điện thoại <sup>*</sup></label>
                            <div class="controls"><input type="text" placeholder="0123456789" name="phone" value=""></div>
                        </div>
                        <div class="control-group">
                            <label class="control-label">Địa chỉ nhận hàng <sup>*</sup></label>
                            <div class="controls"><input type="text" placeholder="Trúc Bạch, Ba Đình, Hà Nội" name="address" value=""></div>
                        </div>
                        <input type="hidden" name="user_id" value="${USERMODEL.user_id}" />
                    </div>
                </div>
                <hr class="soften">
                <div class="table-responsive">
                    <h3>Đơn hàng của bạn</h3>
                    <c:if test="${not empty cart}">
                        <table id="billTable" class="table table-bordered" style="background: white;">
                            <thead>
                            <tr>
                                <th style="width: 40%">Sản phẩm</th>
                                <th style="width: 25%">Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng</th>
                            </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="rows" items="${cart}">
                                    <tr>
                                        <input type="hidden" value="${rows.value.productModel.product_id}"/>
                                        <td>${rows.value.productModel.product_name}</td>
                                        <td><fmt:formatNumber pattern="###,###" value="${rows.value.productModel.product_price}"/> đ</td>
                                        <td>${rows.value.quantity}</td>
                                        <td><fmt:formatNumber pattern="###,###" value="${rows.value.quantity * rows.value.productModel.product_price}"/> đ</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th style="width: 70%" colspan="2">Thành tiền:</th>
                                    <td colspan="2"><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ</td>
                                </tr>
                                <tr>
                                    <th colspan="2">Tổng cộng:</th>
                                    <td colspan="2"><strong><fmt:formatNumber pattern="###,###" value="${sessionScope.totalPrice}"/> đ </strong> </td>
                                </tr>
                                <tr >
                                    <td colspan="4">
                                        <div class="controls" style="float: right">
                                            <button type="submit" class="shopBtn" style="width: 200px; height: 40px;display: none"><i class="icon-check"></i> THANH TOÁN</button>
                                            <c:if test="${not empty USERMODEL}">
                                                <%--<a class="btn-large shopBtn" id="btnCheckout" href="" style="width: 150px;">
                                                    <i class="icon-check"></i> ĐẶT HÀNG
                                                </a>--%>
                                                <button id="btnCheckout" class="btn-large shopBtn">Đặt Hàng</button>
                                            </c:if>
                                            <c:if test="${empty USERMODEL}">
                                                <p style="color: red"><i>Bạn cần đăng nhập để có thể đặt hàng.</i></p>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </c:if>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $('#btnCheckout').click(function () {
       let data = {};
       let formData = $('#formSubmit').serializeArray();
       $.each(formData, function (i, v) {
           data[""+v.name+""] = v.value;
       });
       data["total"] = ${sessionScope.totalPrice};
       data["date"] = Date.parse((new Date()).toISOString());
       addBill(data);
    });

    function addBill(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                let billDetail = {};
                <c:forEach var="cart" items="${cart}">
                    billDetail["bill_id"] = result.bill_id;
                    billDetail["product_id"] = ${cart.value.productModel.product_id};
                    billDetail["quantity"] = ${cart.value.quantity};
                    billDetail["total"] = ${cart.value.quantity * cart.value.productModel.product_price};
                    addBillDetail(billDetail);
                </c:forEach>
                window.location.href = "/checkout/order-received?bill_id=" + result.bill_id;
            },
            error: function (error) {
                console.log("ERROR" + error);
            }
        });
    }
    function addBillDetail(data) {
        $.ajax({
            url: '${APIurl1}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function () {
                console.log("Success");
            },
            error: function (error) {
                console.log("ERROR" + error);
            }
        });
    }
</script>
</body>
</html>
