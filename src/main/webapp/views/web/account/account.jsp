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
        <ul class="breadcrumb">
            <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span class="divider">/</span></li>
            <li class="active">Tài khoản</li>
        </ul>
        <h3>Thông tin tài khoản</h3>
        <hr class="soft">

        <div class="well">
            <c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                        ${messageResponse}
                </div>
            </c:if>
            <form class="form-horizontal" action="/registration" method="post" id="formSubmit">
                <div class="control-group">
                    <label class="control-label" for="inputUserName">Tên đăng nhập<sup>*</sup></label>
                    <div class="controls">
                        <input type="text" id="inputUserName" name="user_name" placeholder="Tên đăng nhập" value="${USERMODEL.user_name}" disabled>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Email <sup>*</sup></label>
                    <div class="controls">
                        <input type="email" id="inputEmail" name="user_email" placeholder="john@gmail.com" value="${USERMODEL.user_email}">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">Mật khẩu cũ<sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="password" name="user_pass" placeholder="Mật khẩu cũ">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">Mật khẩu mới<sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="newPassword" name="user_pass" placeholder="Mật khẩu mới">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="rePassword">Nhập lại mật khẩu <sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="rePassword" placeholder="Nhập lại mật khẩu">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="submit" name="submitAccount" id="submitAccount" value="Lưu" class="exclusive shopBtn"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
   $(document).ready(function () {
       $('#formSubmit').submit(function (e) {
           e.preventDefault();

       });
   });
</script>
</body>
</html>
