<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>FunBar 聊天</title>
<!--sockJS cdn-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<!--stomp cdn-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/web-socket-js/1.0.0/web_socket.js"></script>
<!------ Include the above in your HEAD tag ---------->
<link rel="stylesheet" type="text/css"
	href="<c:url value="/css/chat.css"/>">

</head>
<body class="bg-dark">
	<div id="emojiWrapperModal" class="modal bd-example-modal-sm fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content" >
				<div class="modal-body" id="emojiWrapper" ></div>
			</div>
		</div>
	</div>
	<jsp:include page="header.jsp" />
	<br>
	<div class="col-md-2 fixed-top"
		style="margin: 150px 120px; width: 200px; display: none">
		<div class="list-group">
			<p class="list-group-item list-group-item-action active">${title}</p>
			<a href="" class="list-group-item list-group-item-action"
				id="loginMemberName_chatbox">${sessionScope.member.memberName}</a> <a
				href="" class="list-group-item list-group-item-action"
				id="loginMemberid_chatbox" style="display: none">${sessionScope.member.id}</a>
			<a href="" class="list-group-item list-group-item-action"
				id="requestUrl_chatbox" style="display: none">${pageContext.request.contextPath}/</a>
			<a href="${pageContext.request.contextPath}/discuss"
				class="list-group-item list-group-item-action ">討論區</a> <a
				href="${pageContext.request.contextPath}/chat"
				class="list-group-item list-group-item-action ">聊天</a> <input
				id="websocketUrl" type="hidden" value="<c:url value="/websocket"/> ">
			<input id="emojiBaseUri" type="hidden"
				value="<c:url value="/images/media/emoji/"/> ">
		</div>
	</div>
	<div class="container page">
		<div id="frame">
			<div id="sidepanel">
				<div id="profile">
					<div class="wrap">
						<img id="profile-img"
							src="<c:url value='/membergetPicture/${member.id}'/>"
							class="online" />
						<p style="font-family: 'Russo One', sans-serif; font-size: 20px; color:white;">${sessionScope.member.memberName}</p>
					</div>
				</div>
				<div id="search">
					<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
					<input type="text" placeholder="Search Friends" id="searchFriends" />
				</div>
				<div id="contacts">
					<ul id="receiverArea">
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="contact-profile" id="receiverProfile">
					<span id="receiverMemberName"></span>
				</div>
				<div class="messages">
					<ul id="conversation">
					</ul>
				</div>
				<div class="message-input">
					<div class="wrap">
						<input type="text" id="messageInput"
							placeholder="Write your message..." /> <i
							class="fa fa-paperclip attachment" id="emoji" aria-hidden="true" data-toggle="modal" data-target="#emojiWrapperModal">

						</i>

						<button class="submit" id="btn-chat">
							<i class="fa fa-paper-plane" aria-hidden="true"></i>
						</button>
					</div>

				</div>
			</div>
		</div>
	</div>

	<!-- <form id="sendImageForm" enctype="multipart/form-data"
							method="post">
							<input id="emoji" class="btn btn-primary" type="button" value="emoji" title="emoji" /> 
							<label for="sendImage" class="imageLable"> 
							<input id="sendImageBtn" class="btn btn-success" type="button" value="sendImage" /> 
							<input id="sendImage" type="file" value="sendImage" name="image" accept="image/jpg,image/jpeg,image/png,image/gif" />
							</label>
						</form> style="z-index: 9998; display: block; top: 0px; width: 40%; margin: 120px 800px;"-->
	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript" src="<c:url value='/js/chat.js'/>"></script>

</body>
</html>