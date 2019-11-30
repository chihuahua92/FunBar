<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FunBar 好友</title>

</head>
<body class="bg-dark">
<!-- Header -->
<jsp:include page="header.jsp" />
	<section class="container page">
		<div class="row">
			<!-- Member detail block -->
			<div class="col-md-2 fixed-top"
				style="margin: 150px 120px; width: 200px">
				<div class="list-group">
					<div class="list-group-item list-group-item-action">
						<img class="card-img-top rounded-circle"
							style="height: 50px; width: 50px"
							src="<c:url value='/membergetPicture/${member.id}'/>"><span
							id="loginMemberName"
							style="font-family: 'Russo One', sans-serif; font-size: 18px;"
							class="ml-3 text-xl">${sessionScope.member.memberName}</span>
					</div>
					<a href="${pageContext.request.contextPath}/friend"
						class="list-group-item list-group-item-action active list-group-item d-flex justify-content-between align-items-center">
						好友
						<button
							class='badge badge-primary badge-pill btn btn-primary btn-sm'
							id='friendRequest${sessionScope.member.id}'></button>
					</a> <a href="" class="list-group-item list-group-item-action"
						id="loginMemberid" style="display: none">${sessionScope.member.id}</a>
					<a href="" class="list-group-item list-group-item-action"
						id="requestUrl" style="display: none">${pageContext.request.contextPath}/</a>
					<a href="${pageContext.request.contextPath}/discuss"
						class="list-group-item list-group-item-action ">討論區</a> <a
						href="${pageContext.request.contextPath}/chat"
						class="list-group-item list-group-item-action ">聊天</a>
				</div>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<nav class="navbar navbar-light bg-light rounded-top">
					<div class="nav nav-tabs nav-pills" id="nav-tab" role="tablist">
						<a class="nav-item nav-link active" id="navFriendList"
							data-toggle="tab" href="#FriendList" role="tab"
							aria-controls="nav-home" aria-selected="true">好友列表</a> <a
							class="nav-item nav-link ml-3" id="navReceiver"
							data-toggle="tab" href="#Receiver" role="tab"
							aria-controls="nav-profile" aria-selected="false">交友邀請<button
							class='badge badge-primary badge-pill btn btn-primary btn-sm ml-1 mb-1'
							id='friendRequest2${sessionScope.member.id}'></button></a>
					</div>
					<form class="form-inline mr-right">
						<div class="md-form my-0">
							<i class="fa fa-search mr-2" aria-hidden="true"></i>
							<input class="form-control" type="text" placeholder="Search By Name" aria-label="Search" id="searchName"> 		
						</div>
					</form>
				</nav>
				<div class="tab-content" id="nav-tabContent">
					<div class="tab-pane fade show active" id="FriendList"
						role="tabpanel" aria-labelledby="nav-home-tab">

						<table
							class='table table-striped table-light table-hover rounded-bottom'>
							<thead class="bg-info"
								style="font-family: 'Russo One', sans-serif; font-size: 20px;">
								<tr>
									<th scope='col'>Friend Pic</th>
									<th scope='col'>Friend Name</th>
									<th scope='col'>Friend Birth</th>
									<th scope='col'>Friend E-mail</th>
									<th scope='col'></th>
								</tr>
							</thead>
							<tbody id='friendshipList'>
							</tbody>
						</table>




					</div>
					<div class="tab-pane fade" id="Receiver" role="tabpanel"
						aria-labelledby="nav-profile-tab">
						<table
							class='table table-striped table-light table-hover rounded-bottom'>
							<thead class="bg-info">
								<tr>
									<th scope='col'>Friend Pic</th>
									<th scope='col'>Friend Name</th>
									<th scope='col'>Friend Birth</th>
									<th scope='col'>Friend Request</th>
								</tr>
							</thead>
							<tbody id='friendshipTable'>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/friend.js'/>"></script>
	<!-- Chat Box -->
	<jsp:include page="chatbox.jsp" />
</body>
</html>