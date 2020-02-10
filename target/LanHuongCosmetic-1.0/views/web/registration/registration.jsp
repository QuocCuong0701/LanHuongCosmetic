<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
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
            <li><a href="index.html">Trang chủ</a> <span class="divider">/</span></li>
            <li class="active">Đăng ký</li>
        </ul>
        <h3>Đăng Ký Tài Khoản</h3>
        <hr class="soft">
        <div class="well">
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
                        <input type="text" id="inputEmail" name="user_email" placeholder="Email">
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
                        <input type="button" name="submitAccount" id="submitAccount" value="Đăng ký" class="exclusive shopBtn"/>
                    </div>
                </div>
            </form>
        </div>
        <hr class="soft">
        <div class="well">
            <form class="form-horizontal" action="/registration" method="post" id="formLogin">
                <h5>BẠN ĐÃ CÓ TÀI KHOẢN ?</h5>
                <form>
                    <div class="control-group">
                        <label class="control-label" for="userName">Tên đăng nhập<sup>*</sup></label>
                        <div class="controls">
                            <input type="text" id="userName" name="user_name" placeholder="Tên đăng nhập">
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label" for="inputPassword">Mật khẩu</label>
                        <div class="controls">
                            <input type="password" id="inputPassword" class="span3" placeholder="Mật khẩu">
                        </div>
                    </div>
                    <div class="control-group">
                        <div class="controls">
                            <button type="submit" class="shopBtn">Đăng nhập</button>
                        </div>
                    </div>
                </form>
            </form>
        </div>
    </div>
</div>
<script>
    $('#submitAccount').click(function () {
        var data = {};
        var formData = $('#formSubmit').serializeArray();
        $.each(formData, function (i, v) {
            data[""+v.name+""] = v.value;
        });
        addAccount(data);
    });

    function addAccount(data) {
        $.ajax({
            url: '${APIurl}',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (result) {
                console.log("OK "+result);
            },
            error: function (error) {
                console.log("ERROR "+error);
            }
        });
    };
</script>
</body>
</html>
