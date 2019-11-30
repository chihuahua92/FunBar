<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>

<head>
<link href="<c:url value="/images/icons/favicon.png" />" rel="icon">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/bootstrap/css/bootstrap.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/fonts/themify/themify-icons.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/animate/animate.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/css-hamburgers/hamburgers.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/animsition/css/animsition.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/select2/select2.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/daterangepicker/daterangepicker.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/slick/slick.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/vendor/lightbox2/css/lightbox.min.css"/>">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
 href="<c:url value="/css/util.css"/>">
<link rel="stylesheet" type="text/css"
 href="<c:url value="/css/main.css"/>">
<link rel="stylesheet" type="text/css"
 href="<c:url value="/css/own.css"/>">
<link href="https://fonts.googleapis.com/css?family=Poller+One|Sarina|Sonsie+One&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Paytone+One|Russo+One&display=swap" rel="stylesheet">

</head>
<style>
.buyBoxBlock { relative; z-index: 9999;}
.buyBox {
 	position: absolute;
 	top: 0px;
	width: 60px;
	height: 60px;
	opacity: 0;
	z-index: -1;
}
</style>
<body>
	<!-- Header -->
	<header>
		<!-- Header desktop -->
		<div class="wrap-menu-header gradient1 trans-0-4" style="background-color: black; opacity: 0.8">
			<div class="container-fluid h-full">
				<div class="wrap_header trans-0-3">
					<!-- Logo -->
					<div class="logo">
						<a href="${pageContext.request.contextPath}"> 
						<img src="<c:url value='/images/icons/logo5.png' />" 
							data-logofixed="<c:url value='/images/icons/logo5.png' />">
						</a>
					</div>
					<!-- Menu -->
					<div class="wrap_menu p-l-20 p-l-0">
						<nav class="menu">
							<ul class="main_menu">
								<!-- 活動選單列 -->
								<li><a href="${pageContext.request.contextPath}/activities?index=1">熱門活動</a></li>

								<!-- 部落格選單列 -->
								<li><a href="${pageContext.request.contextPath}/blogs">部落格</a></li>

								<!-- 討論區選單列 -->		
								<li><a href="${pageContext.request.contextPath}/discuss">討論區</a></li>

								<!-- 訂位/訂房選單列 -->
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">線上預約</a>    
								    <div class="dropdown-menu">
								    	<a class="dropdown-item" href="${pageContext.request.contextPath}/booking">線上訂位</a>
		             					<a class="dropdown-item" href="${pageContext.request.contextPath}/booking_room">線上訂房</a>
		             				</div>
								</li>

								<!-- 購物選單列 -->		
								<li class="nav-item dropdown">
									<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">購物區</a>
									<div class="dropdown-menu">

						           		 <a class="dropdown-item" href="${pageContext.request.contextPath}/shoppingCart?index=1">Mall</a>
       									 <a class="dropdown-item" href="${pageContext.request.contextPath}/showCart">My Cart</a>
       									 <a class="dropdown-item" href="${pageContext.request.contextPath}/showMemOrders">My Orders</a>
               						</div>

								</li>

								<!-- 會員選單列 -->
									<c:choose>
									<c:when test="${sessionScope.member.memberName==null}">
										<li><a href="${pageContext.request.contextPath}/signin">登入</a></li>
									</c:when>
									<c:otherwise>
										<li class="nav-item dropdown" style="position: absolute; right: 80px;">
											<a class="nav-item dropdown-toggle" data-toggle="dropdown" href="#">
												<img id="dropdownMenu1" data-toggle="dropdown" class="card-img-top rounded-circle" style="height: 50px; width: 50px" src="<c:url value='/membergetPicture/${member.id}'/>">
											</a>
											<div class="dropdown-menu">
												<a class="dropdown-item" href="<c:url value='/getself?id=${member.id}' />">修改會員資料</a>
												<a class="dropdown-item" href="${pageContext.request.contextPath}/personal_order">我的訂房</a>
												<a class="dropdown-item" href="javascript:;">${member.memberName},你好</a>
												<a class="dropdown-item" href="${pageContext.request.contextPath}/logout">登出</a>
											</div>
										</li>
									</c:otherwise>
								</c:choose>
								<li class="nav-item dropdown no-arrow">
							    	<a class="nav-link" href="${pageContext.request.contextPath}/showCart" id="userDropdown" role="button" aria-haspopup="true" aria-expanded="false">
									<i style="color:red;"class="fa fa-cart-arrow-down"></i>
		         					<span class="badge badge-danger cart">${fn:length(sessionScope.Cart.cartItems)}</span>
		         					</a>
		         					<div class="buyBox"></div>
		     					</li>
							</ul>
						<!-- menu end  -->
						</nav>
					</div>
					<!-- Social -->
					<div class="social flex-w flex-l-m p-r-20">
						<button class="btn-show-sidebar m-l-33 trans-0-4"></button>
					</div>
				</div>
			</div>
		</div>
	</header>

<!-- 	Right Sidebar -->
	<aside class="sidebar trans-0-4">
		<!-- Button Hide sidebar icon -->
		<button class="btn-hide-sidebar ti-close color0-hov trans-0-4"></button>

		<!-- menu-sidebar -->
		<ul class="menu-sidebar p-t-95 p-b-70">

			<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/booking_query">訂位、訂房查詢</a></li>

			<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/activities?index=1" class="txt19">熱門活動</a></li>

			<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/shoppingCart?index=1">購物區</a></li>

			<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/blogs" class="txt19">部落格</a></li>

			<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/discuss" class="txt19">討論區</a></li>

			<c:choose>
			<c:when test="${sessionScope.member.memberName==null}">
				<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/signin">登入</a></li>
			</c:when>

			<c:otherwise>
				<li class="t-center m-b-13">
					<a href="<c:url value='/getself?id=${member.id}' />">
	     				<img class="card-img-top rounded-circle" style="height: 50px; width: 50px" src="<c:url value='/membergetPicture/${member.id}'/>">
	     			</a>
				</li>
			
				<c:if test="${sessionScope.member.memberLevel>1}">
					<li class="t-center m-b-13"><a href="${pageContext.request.contextPath}/admin">後台管理</a></li>
				</c:if>
				<li class="t-center m-b-13">
					<a href="${pageContext.request.contextPath}/logout">登出</a>
				</li>
			</c:otherwise>
			</c:choose>

<!-- 			<li class="t-center"> -->
<!-- 				<a href="reservation.html" class="btn3 flex-c-m size13 txt11 trans-0-4 m-l-r-auto">Reservation</a> -->
<!-- 			</li> -->
		</ul>
	</aside>
</body>

</html>