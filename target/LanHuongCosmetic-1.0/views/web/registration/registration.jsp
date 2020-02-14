<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="RegistrationURL" value="/registration"/>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Đăng ký</title>
</head>
<body>
<div class="row">
    <%@include file="/common/web/left-menu.jsp"%>
    <div class="span9">
        <ul class="breadcrumb">
            <li><a href="<c:url value="/trang-chu"/>">Trang chủ</a> <span class="divider">/</span></li>
            <li class="active">Đăng ký</li>
        </ul>
        <h3>Đăng Ký Tài Khoản</h3>
        <hr class="soft">
        <div class="well">
            <c:if test="${not empty messageResponse}">
                <div class="alert alert-${alert}">
                        ${messageResponse}
                </div>
            </c:if>
            <form class="form-horizontal" action="/registration" method="post" id="formSubmit">
                <h3>Thông tin đăng ký</h3>
                <div class="control-group">
                    <label class="control-label" for="inputUserName">Tên đăng nhập<sup>*</sup></label>
                    <div class="controls">
                        <input type="text" id="inputUserName" name="user_name" placeholder="Tên đăng nhập">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Email <sup>*</sup></label>
                    <div class="controls">
                        <input type="email" id="inputEmail" name="user_email" placeholder="john@gmail.com">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">Mật khẩu <sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="password" name="user_pass" placeholder="Mật khẩu">
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
                        <input type="submit" name="submitAccount" id="submitAccount" value="Đăng ký" class="exclusive shopBtn"/>
                    </div>
                </div>
            </form>
        </div>
        <hr class="soft">
        <div class="well">
            <h5>BẠN ĐÃ CÓ TÀI KHOẢN ?</h5>
            <form action="<c:url value='/dang-nhap'/>" method="post" class="form-horizontal" id="formLogin">
                <div class="control-group">
                    <label class="control-label" for="userName">Tên đăng nhập<sup>*</sup></label>
                    <div class="controls">
                        <input type="text" id="userName" name="user_name" placeholder="Tên đăng nhập">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputPassword">Mật khẩu<sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="inputPassword" name="user_pass" class="span3" placeholder="Mật khẩu">
                    </div>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <input type="hidden" value="login" id="action" name="action"/>
                        <button type="submit" name="action" value="login" class="shopBtn">Đăng nhập</button>
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
            var userName = $('#inputUserName').val();
            var userEmail = $('#inputEmail').val();
            var userPassword = $('#password').val();
            var userRePass = $('#rePassword').val();
            $('.error').remove();
            if (userName.length < 1 || userName.length > 32) {
                $('#inputUserName').after('<span class="error"> Tên phải từ 1 - 32 ký tự.</span>');
            }
            if (userEmail.length < 1) {
                $('#inputEmail').after('<span class="error"> Điền địa chỉ email.</span>');
            } else {
                var regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                var validEmail = regEx.test(userEmail);
                if (!validEmail) {
                    $('#inputEmail').after('<span class="error"> Email không hợp lệ.</span>');
                }
            }
            if (userPassword.length <= 4 || userPassword.length > 20) {
                $('#password').after('<span class="error"> Mật khẩu phải từ 5 - 20 ký tự.</span>');
            }
            if (userRePass.length < 1) {
                $('#rePassword').after('<span class="error"> Nhập lại mật khẩu.</span>');
            } else if (!userRePass.match(userPassword)) {
                $('#rePassword').after('<span class="error"> Mật khẩu không khớp.</span>');
            }
            let error = $('form span').map(function () {
                return $(this).val();
            }).get();
            if (error.length === 0) {
                let data = {};
                let formData = $('#formSubmit').serializeArray();
                $.each(formData, function (i, v) {
                    data["" + v.name + ""] = v.value;
                });
                addAccount(data);
            }
        });
    });

    function addAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                if (result != null) {
                    window.location.href = "${RegistrationURL}?message=create_account_success";
                } else {
                    window.location.href = "${RegistrationURL}?message=create_account_error";
                }
            },
            error: function (error) {
                window.location.href = "${RegistrationURL}?message=error_system";
            }
        });
    }
</script>
</body>
</html>
