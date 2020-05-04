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
    <script type='text/javascript' src='<c:url value="/template/web/js/jquery-2.2.3.js" />'></script>
    <script src="<c:url value="/template/paging/jquery.twbsPagination.js" />"></script>
</head>
<body>

<div class="navbar navbar-inverse navbar-fixed-top">
    <div class="topNav">
        <div class="container">
            <div class="alignR">
                <c:set var="cart" value="${sessionScope.model}" />
                <div class="pull-left socialNw">
                    <a href="#"><span class="icon-twitter"></span></a>
                    <a href="#"><span class="icon-facebook"></span></a>
                    <a href="#"><span class="icon-youtube"></span></a>
                    <a href="#"><span class="icon-tumblr"></span></a>
                </div>
                <a class="active" href="<c:url value="/trang-chu"/>"> <span class="icon-home"></span> Trang chủ</a>
                <c:if test="${not empty USERMODEL}">
                    <a href="<c:url value="/account"/>"><span class="icon-user"></span> Tài khoản</a>
                </c:if>
                <a href="<c:url value="/registration"/>"><span class="icon-edit"></span> Đăng ký </a>
                <a href="#"><span class="icon-envelope"></span> Liên hệ</a>
                <a href="<c:url value="/cart"/>"><span class="icon-shopping-cart"></span>
                    <c:if test="${cart == null}">
                        0 Sản phẩm - <span class="badge badge-warning"> 0 &#8363;</span>
                    </c:if>
                    <c:if test="${cart != null}">
                        ${cart.size()} Sản phẩm - <span class="badge badge-warning">${sessionScope.totalPrice} &#8363;</span>
                    </c:if>
                </a>
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

<a href="#gototop" class="gotop"><i class="icon-double-angle-up"></i></a>

<!-- Placed at the end of the document so the pages load faster -->

<%--<script src="<c:url value='/template/web/js/jquery.js'/>"></script>--%>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.easing-1.3.min.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.scrollTo-1.4.3.1-min.js'/>"></script>
<script src="<c:url value='/template/web/js/shop.js'/>"></script>
<script src="<c:url value='/template/web/js/jquery.dataTable.js'/>"></script>
<script src="<c:url value='/template/web/js/data_table-1.0.0.js'/>"></script>
</body>
</html>