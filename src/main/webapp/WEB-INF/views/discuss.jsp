<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>FunBar 討論區</title>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/css/discuss.css'/>">
</head>
<body class="bg-dark">
	<!-- Header -->
	<jsp:include page="header.jsp" />
	<!-- Member detail block -->
	<div class="col-md-2 fixed-top" style="margin: 150px 120px; width: 200px">
		<div class="list-group">
			<div class="list-group-item list-group-item-action">
				<img class="card-img-top rounded-circle"
					style="height: 50px; width: 50px"
					src="<c:url value='/membergetPicture/${member.id}'/>"> <span
					id="loginMemberName" class="ml-3 text-xl"
					style="font-family: 'Russo One', sans-serif; font-size: 18px;">${sessionScope.member.memberName}</span>
			</div>
			<a href="" class="list-group-item list-group-item-action"
				id="loginMemberid" style="display: none">${sessionScope.member.id}</a>
			<a href="" class="list-group-item list-group-item-action"
				id="requestUrl" style="display: none"><c:url value='/' /></a>
			<p class="list-group-item list-group-item-action active">${title}</p>
			<a href="${pageContext.request.contextPath}/friend"
				class="list-group-item list-group-item-action list-group-item d-flex justify-content-between align-items-center">
				好友
				<button
					class='badge badge-primary badge-pill btn btn-primary btn-sm'
					id='friendRequest${sessionScope.member.id}'></button>
			</a> <a href="${pageContext.request.contextPath}/chat"
				class="list-group-item list-group-item-action ">聊天</a>
		</div>
	</div>
	<!-- Body -->
	<section class="container page">
		<div class="row">
			<div class="col-md-2"></div>
			<!-- Post area -->
			<!--create new post block-->
			<div class="col-md-7">
				<div class='card mb-4' id="newPost"></div>
				<!-- 第一層Post -->
				<div id="firstLevelComment">
					<!-- 第二層Post -->
				</div>
			</div>

			<!-- friend request block -->
			<div class="col-md-3 rounded" style="background-color: white;">
				<div class="col-md-12 font-weight-bold mt-4"
					style="font-family: 'Russo One', sans-serif; font-size: 20px;">
					<h5>Add Friend</h5>
				</div>
				<div class="col-md-12 mt-4">
					<div class="input-group mb-3">
						<input type="search" class="form-control rounded"
							id="searchMemberName" placeholder="Search"
							aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-success ml-2" id='searchMember'
								type="button">Search</button>
						</div>
					</div>
					<div id="searchResult" class="list-group mb-4"></div>
				</div>
			</div>
		</div>

	</section>


	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/discuss.js'/>"></script>
	<!-- Chat Box -->
	<jsp:include page="chatbox.jsp" />
</body>
</html>