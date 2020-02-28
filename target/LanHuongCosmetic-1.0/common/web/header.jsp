<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglib.jsp" %>

<div id="gototop"> </div>

<header id="header">
    <div class="row">
        <div class="span4">
            <h1>
                <a class="logo" href="<c:url value="/trang-chu"/>">
                    <img src="<c:url value="/template/web/img/lhcos.png"/>" style="height: 70px;" alt="LanHuongCosmetic">
                </a>
            </h1>
        </div>
        <c:set var="cart" value="${sessionScope.model}" />
        <div class="span4 alignR" style="float:right;">
            <p><br> <strong> Hỗ trợ (24/7) : 0800 1234 678 </strong><br><br></p>
            <span class="btn btn-mini">[
                <c:if test="${cart == null}">0</c:if>
                <c:if test="${cart != null}">${cart.size()}</c:if>
                ] <span class="icon-shopping-cart"></span></span>
        </div>
    </div>
</header>

<!-- Navigation Bar Section -->
<div class="navbar">
    <div class="navbar-inner">
        <div class="container" style="height: 40px">
            <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>
            <div class="nav-collapse">
                <ul class="nav">
                    <li class="active"><a href="/trang-chu">Trang Chủ</a></li>
                    <li class=""><a href="/product?page=1">Sản Phẩm</a></li>
                    <li class=""><a href="/about-us">Giới Thiệu</a></li>
                    <li class=""><a href="#">Liên Hệ</a></li>
                </ul>
                <form action="#" class="navbar-search pull-left">
                    <input style="display: none" type="text" placeholder="Tìm kiếm" class="search-query span2">
                </form>
                <ul class="nav pull-right" style="height: 40px">
                    <c:if test="${not empty USERMODEL}">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#"><span
                                    class="icon-user"></span> ${USERMODEL.user_name} <b class="caret"></b></a>
                            <div class="dropdown-menu">
                                <form class="form-horizontal loginFrm" action="<c:url value='/dang-nhap'/>" method="post" style="height: 40px">
                                    <div class="control-group">
                                        <a class="shopBtn btn-block" href="<c:url value="/thoat?action=logout"/>">Đăng xuất</a>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}">
                                ${message}
                        </div>
                    </c:if>
                    <c:if test="${empty USERMODEL}">
                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="icon-lock"></span> Đăng nhập <b class="caret"></b>
                            </a>
                            <div class="dropdown-menu">
                                <form class="form-horizontal loginFrm" action="<c:url value='/dang-nhap'/>" method="post" style="height: 120px">
                                    <div class="control-group">
                                        <input type="text" class="span2" id="input_Email" placeholder="Tên đăng nhập" name="user_name">
                                    </div>
                                    <div class="control-group">
                                        <input type="password" class="span2" id="input_Password" placeholder="Mật khẩu" name="user_pass">
                                    </div>
                                    <div class="control-group">
                                        <input type="hidden" value="login" id="action" name="action"/>
                                        <button type="submit" name="action" value="login" class="shopBtn btn-block">Đăng nhập</button>
                                    </div>
                                </form>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </div>
    </div>
</div>