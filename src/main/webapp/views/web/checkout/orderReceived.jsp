<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-billDetail"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chi tiết hóa đơn</title>
</head>
<body>
<c:set var="cart" value="${sessionScope.model}" />
<div class="row">
    <%@include file="/common/web/left-menu.jsp"%>
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span class="divider">/</span></li>
            <li class="active">Thanh toán</li>
        </ul>
        <h3>Đơn Hàng Nhận Được</h3>
        <hr class="soft">
        <div class="well">
            <p>Cảm ơn bạn. Đơn hàng của bạn đã được nhận.</p>
            <ul class="order_details">
                <li class="order">
                    Số đơn hàng:<strong>${BillModel.bill_id}</strong>
                </li>
                <li class="date">
                    Ngày:<strong>${BillModel.date}</strong>
                </li>
                <li class="total">
                    Tổng cộng:<strong><span class="amount">${BillModel.total} &#8363;</span></strong>
                </li>
                <li class="method" style="display: none">
                    Phương thức thanh toán:<strong>Trả tiền mặt khi nhận hàng</strong>
                </li>
            </ul>
            <p style="text-align: justify; font-size: 13px;">Bộ phận bán hàng sẽ gọi lại cho quý khách trong thời gian sớm nhất để chốt đơn hàng hoặc nhận thông tin bổ sung.
                Quý khách có yêu cầu gì thêm vui lòng gọi holine 0333 385 398 để có hướng dẫn đầy đủ nhất.<br>
                Trân trọng cảm ơn quý khách!</p>
            <h3>Chi tiết đơn hàng</h3>
            <table class="table table-bordered" style="background: white">
                <thead>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Tổng</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="billDetail" items="${listBillDetail.listResult}">
                    <tr>
                        <td><span style="color: red;font-style: italic;">${billDetail.product_name}</span><strong> × ${billDetail.quantity}</strong></td>
                        <td><span><fmt:formatNumber pattern="###,###" value="${billDetail.quantity * billDetail.product_price}"/> đ</span></td>
                    </tr>
                </c:forEach>
                </tbody>
                <tfoot>
                    <tr>
                        <th>Thành tiền:</th>
                        <td><span><c:out value="${BillModel.total}"/> &#8363;</span></td>
                    </tr>
                    <tr style="display: none">
                        <th>Phương thức thanh toán:</th>
                        <td>Trả tiền mặt khi nhận hàng</td>
                    </tr>
                    <tr>
                        <th>Tổng cộng:</th>
                        <td><strong><c:out value="${BillModel.total}"/> &#8363;</strong></td>
                    </tr>
                </tfoot>
            </table>
            <h3>Chi tiết khách hàng</h3>
            <table class="table table-bordered" style="background: white">
                <tbody>
                    <tr>
                        <th>Email:</th>
                        <td>${USERMODEL.user_email}</td>
                    </tr>
                    <tr>
                        <th>Số điện thoại:</th>
                        <td>${BillModel.phone}</td>
                    </tr>
                </tbody>
            </table>
            <h3>Địa chỉ thanh toán</h3>
            <address>${BillModel.full_name}<br>${BillModel.address}</address>
        </div>
    </div>
</div>
</body>
</html>
