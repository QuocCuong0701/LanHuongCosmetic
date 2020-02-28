<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="APIurl" value="/api-admin-user"/>
<c:url var ="AccountURL" value="/account"/>
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
            <form class="form-horizontal" action="/account" method="post" id="formUpdateAcc">
                <input type="hidden" name="user_id" value="${USERMODEL.user_id}"/>
                <div class="control-group">
                    <label class="control-label" for="inputUserName">Tên đăng nhập<sup>*</sup></label>
                    <div class="controls">
                        <input type="text" id="inputUserName" placeholder="Tên đăng nhập" value="${USERMODEL.user_name}" disabled>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputEmail">Email <sup>*</sup></label>
                    <div class="controls">
                        <input type="email" id="inputEmail" name="user_email" placeholder="john@gmail.com" value="${USERMODEL.user_email}">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="oldPassword">Mật khẩu cũ<sup>*</sup></label>
                    <div class="controls">
                        <input type="password" id="oldPassword" placeholder="Mật khẩu cũ">
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="newPassword">Mật khẩu mới<sup>*</sup></label>
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
       $('#formUpdateAcc').submit(function (e) {
           e.preventDefault();
           let userEmail = $('#inputEmail').val();
           let oldPassword = $('#oldPassword').val();
           let newPassword = $('#newPassword').val();
           let rePassword = $('#rePassword').val();
           $('.error').remove();
           if (userEmail.length < 1) {
               $('#inputEmail').after('<span class="error"> Điền địa chỉ email.</span>');
           } else {
               var regEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
               var validEmail = regEx.test(userEmail);
               if (!validEmail) {
                   $('#inputEmail').after('<span class="error"> Email không hợp lệ.</span>');
               }
           }
           if(!oldPassword.match(${USERMODEL.user_pass})){
               $('#oldPassword').after('<span class="error"> Mật khẩu không đúng.</span>');
           }
           if (newPassword.length <= 4 || newPassword.length > 20) {
               $('#newPassword').after('<span class="error"> Mật khẩu phải từ 5 - 20 ký tự.</span>');
           }
           if (rePassword.length < 1) {
               $('#rePassword').after('<span class="error"> Nhập lại mật khẩu.</span>');
           } else if (!rePassword.match(newPassword)) {
               $('#rePassword').after('<span class="error"> Mật khẩu không khớp.</span>');
           }
           let error = $('form span').map(function () {
               return $(this).val();
           }).get();
           if (error.length == 0) {
               let data = {};
               let formData = $('#formUpdateAcc').serializeArray();
               $.each(formData, function (i, v) {
                   data["" + v.name + ""] = v.value;
               });
               updateAccount(data);
           }
       });
   });

   function updateAccount(data) {
       $.ajax({
           url: '${APIurl}',
           type: 'PUT',
           contentType: 'application/json',
           data: JSON.stringify(data),
           dataType: 'json',
           success: function (result) {
               if (result != null) {
                   window.location.href = "${AccountURL}?message=update_success";
               } else {
                   window.location.href = "${AccountURL}?message=error_system";
               }
           },
           error: function (error) {
               window.location.href = "${AccountURL}?message=error_system";
           }
       });
   }
</script>
</body>
</html>
