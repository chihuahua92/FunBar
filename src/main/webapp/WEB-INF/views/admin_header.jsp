<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/vendor/bootstrap/css/bootstrap.min.css" />">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/fonts/font-awesome-4.7.0/css/font-awesome.min.css"/>">




<link rel="stylesheet" type="text/css"
	href="<c:url value="/ad_vendor/fontawesome-free/css/all.min.css"/>">

<!-- Page level plugin CSS-->
<link rel="stylesheet"
	href="<c:url value="/ad_vendor/datatables/dataTables.bootstrap4.css" />">

<!-- Custom styles for this template-->
<link rel="stylesheet" href="<c:url value="/ad_css/sb-admin.css"/>">
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark static-top">

		<a class="navbar-brand mr-1" href="/FunBar/">FunBar</a>

		<button class="btn btn-link btn-sm text-white order-1 order-sm-0"
			id="sidebarToggle" href="#">
			<i class="fas fa-bars"></i>
		</button>
	</nav>

	<div id="wrapper">

		<!-- Sidebar -->
		<ul class="sidebar navbar-nav">
			<li class="nav-item active"><a class="nav-link" href="${pageContext.request.contextPath}/admin"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>管理員您好</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>會員管理</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/showAllmember?index=1">查詢所有會員</a>
				</div></li>



			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>訂位</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/allbooking">查詢所有訂位</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/ad_booking">新增訂位</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/reset_time_people">重設時段及人數</a>
				</div></li>
				
							<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>訂房</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/allOrder">查詢所有訂房</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/admin_RoomBooking">新增訂房</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/room_type">房型</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath}/check_in">check in</a>
				</div></li>

			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>購物車</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/showAllProduct?index=1">所有商品</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/addProduct">新增商品</a> <a
						class="dropdown-item" href="${pageContext.request.contextPath}/showAllOrders">查看所有訂單</a>
				</div></li>
			
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>活動</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/activityQuery?index=1">活動管理</a> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/addActivity">新增活動</a>
				</div></li>
				
							<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>部落格</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<!-- <h6 class="dropdown-header"></h6> -->
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin_blog">部落格管理</a>
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin_report">部落格檢舉管理</a> 
				</div></li>

				<!-- 討論區後台 -->
				<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="pagesDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <i class="fas fa-fw fa-folder"></i> <span>討論區</span>
			</a>
				<div class="dropdown-menu" aria-labelledby="pagesDropdown">
					<h6 class="dropdown-header">Discuss</h6> 
					<a class="dropdown-item" href="${pageContext.request.contextPath}/admin_discuss">貼文管理</a> 
				</div></li>
		</ul>
</body>
</html>