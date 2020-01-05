<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title><dec:title default="Trang chủ"/></title>
    <link href="<c:url value="/template/assets/css/bootstrap.css"/>" type="text/css" rel="stylesheet" />
    <link href="<c:url value='/template/assets/css/style.css'/>" type="text/css" rel="stylesheet" />
    <link href="<c:url value='/template/assets/font-awesome/css/font-awesome.css'/>" type="text/css" rel="stylesheet" />
    <link rel="shortcut icon" href="<c:url value='/template/assets/ico/favicon.ico'/>">
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
                <a href="cart.html"><span class="icon-shopping-cart"></span> 2 Item(s) - <span class="badge badge-warning"> $448.42</span></a>
            </div>
        </div>
    </div>
</div>

    <div class="container">
        <!-- header -->
        <%@ include file="/common/web/header.jsp" %>
        <!-- header -->

        <dec:body/>

        <!-- footer -->
        <%@ include file="/common/web/footer.jsp" %>
        <!-- footer -->
    </div>

    <div class="copyright">
        <div class="container">
            <p class="pull-right">
                <a href="#"><img src="assets/img/maestro.png" alt="payment"></a>
                <a href="#"><img src="assets/img/mc.png" alt="payment"></a>
                <a href="#"><img src="assets/img/pp.png" alt="payment"></a>
                <a href="#"><img src="assets/img/visa.png" alt="payment"></a>
                <a href="#"><img src="assets/img/disc.png" alt="payment"></a>
            </p>
            <span>Copyright &copy; 2013<br> bootstrap ecommerce shopping template</span>
        </div>
    </div>
    <a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>

    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/template/assets/js/jquery.js'/>"></script>
    <script src="<c:url value='/template/assets/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/jquery.easing-1.3.min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/jquery.scrollTo-1.4.3.1-min.js'/>"></script>
    <script src="<c:url value='/template/assets/js/shop.js'/>"></script>
</body>
</html>
