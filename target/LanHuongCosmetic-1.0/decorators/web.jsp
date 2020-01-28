<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><dec:title default="Trang chủ"/></title>
    <link href="<c:url value="/template/web/css/bootstrap.css"/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value='/template/web/css/style.css'/>" type="text/css" rel="stylesheet"/>
    <link href="<c:url value='/template/web/font-awesome/css/font-awesome.css'/>" type="text/css" rel="stylesheet"/>
    <link rel="shortcut icon" href="<c:url value='/template/web/ico/favicon.ico'/>">
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="topNav">
        <div class="container">
            <div class="alignR">
                <div class="pull-left socialNw">
                    <a href="#"><span class="icon-twitter"></span></a>
                    <a href="#"><span class="icon-facebook"></span></a>
                    <a href="#"><span class="icon-youtube"></span></a>
                    <a href="#"><span class="icon-tumblr"></span></a>
                </div>
                <a class="active" href="index.html"> <span class="icon-home"></span> Home</a>
                <a href="#"><span class="icon-user"></span> My Account</a>
                <a href="register.html"><span class="icon-edit"></span> Free Register </a>
                <a href="contact.html"><span class="icon-envelope"></span> Contact us</a>
                <a href="cart.html"><span class="icon-shopping-cart"></span> 2 Item(s) - <span
                        class="badge badge-warning"> $448.42</span></a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <!-- header -->
    <%@include file="/common/web/header.jsp" %>
    <!-- header -->

    <dec:body></dec:body>

    <!-- footer -->
    <%@include file="/common/web/footer.jsp" %>
    <!-- footer -->
</div>

<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>

<!-- Placed at the end of the document so the pages load faster -->
<script src="<c:url value='/template/web/js/jquery.js'/>"></script>
<script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.easing-1.3.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.scrollTo-1.4.3.1-min.js'/>"></script>
<script src="<c:url value='/template/web/js/shop.js'/>"></script>
</body>
</html>
