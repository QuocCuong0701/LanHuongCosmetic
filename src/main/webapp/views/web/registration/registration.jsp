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
                        <span id="userNameError"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Email <sup>*</sup></label>
                    <div class="controls">
                        <input type="email" id="inputEmail" name="user_email" placeholder="Email">
                        <span id="emailError"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="password">Mật khẩu <sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="password" name="user_pass" placeholder="Mật khẩu">
                        <span id="passError"></span>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="rePassword">Nhập lại mật khẩu <sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="rePassword" name="user_rePass" placeholder="Nhập lại mật khẩu">
                        <span id="rePassError"></span>
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
                        <label class="control-label" for="inputPassword">Mật khẩu<sup>*</sup></label>
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
   $(document).ready(function () {
       $('#submitAccount').click(function () {
           $('#formSubmit').validate({
               rules: {
                   user_name: {
                       required: true,
                       minlength: 1,
                       maxlength: 32
                   },
                   user_email: {
                       required: true,
                       email: true
                   },
                   user_pass: {
                       required: true,
                       minlength: 5,
                       maxlength: 20
                   },
                   user_rePass: {
                       required: true,
                       equalTo: "#password"
                   }
               },
               message: {
                   user_name: {
                       minlength: "Tên phải từ 1 - 32 ký tự.",
                       maxlength: "Tên phải từ 1 - 32 ký tự."
                   },
                   user_email: "Email không hợp lệ.",
                   user_pass: {
                       minlength: "Mật khẩu phải từ 5 - 20 ký tự.",
                       maxlength: "Mật khẩu phải từ 5 - 20 ký tự."
                   },
                   user_rePass: "Mật khẩu không khớp."
               }
           });
           /*var userName = $('#inputUserName').val();
           var userPassword = $('#password').val();
           var userRePass = $('#rePassword').val();
           if (userName.trim().length === 0 || userName.trim().length > 32) {
               $('#userNameError').text('Tên phải từ 1 - 32 ký tự.');
           } else
           if (userPassword.trim().length <= 4 || userPassword.trim().length > 20) {
               $('#passError').text('Mật khẩu phải từ 5 - 20 ký tự.');
           } else
           if (!userRePass.match(userPassword)) {
               $('#rePassError').text('Mật khẩu không khớp.');
           } else
           if (!validate()) {
               $('#emailError').text('Email không hợp lệ.');
           }
           else {
               let data = {};
               let formData = $('#formSubmit').serializeArray();
               $.each(formData, function (i, v) {
                   data["" + v.name + ""] = v.value;
               });
               addAccount(data);
               alert(data.toString());
           }*/
       });
   });

    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }

    function validate() {
        //var $result = $("#emailError");
        var email = document.getElementById('inputEmail');
        //$result.text("");
        return validateEmail(email);
    }

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
    }
</script>
</body>
</html>
