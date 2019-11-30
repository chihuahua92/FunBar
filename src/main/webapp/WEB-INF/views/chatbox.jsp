<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat box</title>
<!--sockJS cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/web-socket-js/1.0.0/web_socket.js"></script>
<!--stomp cdn-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<!-- Font Awesome -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/chatbox.css'/>">
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<input id="websocketUrl" type="hidden" value="<c:url value="/websocket"/> ">
	 <input id="emojiBaseUri" type="hidden" value="<c:url value="/images/media/emoji/"/> ">
	<a id="loginMemberid_chatbox" style="display: none">${sessionScope.member.id}</a>
	<a id="loginMemberName_chatbox" style="display: none">${sessionScope.member.memberName}</a>
	<a href="" class="list-group-item list-group-item-action" id="requestUrl_chatbox" style="display:none"><c:url value='/'/></a>
	<!-- left menu -->
	<nav class="navbar" id="sidebarbtn">
		<button type="button" id="sidebarCollapse" class="btn btn-info btn-lg">
			<h4><span>Chat</span></h4>
		</button>
	</nav>

		<!-- Friend List -->
		<nav id="sidebar">
			<div id="dismiss">
				<i class="fa fa-arrow-left"></i>
			</div>
			<div id="profile">
				<div class="wrap">
					<img id="profile-img"
						src="<c:url value='/membergetPicture/${member.id}'/>"
						class="online" />
					<p style="font-family: 'Russo One', sans-serif; font-size: 20px; color:white;">${sessionScope.member.memberName}</p>
					<!-- <i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
					<div id="status-options">
						<ul>
							<li id="status-online" class="active"><span class="status-circle"></span>
								<p>Online</p></li>
							<li id="status-away"><span class="status-circle"></span>
								<p>Away</p></li>
							<li id="status-busy"><span class="status-circle"></span>
								<p>Busy</p></li>
							<li id="status-offline"><span class="status-circle"></span>
								<p>Offline</p></li>
						</ul>
					</div>
					<div id="expanded">
						<label for="twitter"><i class="fa fa-facebook fa-fw"
							aria-hidden="true"></i></label> <input name="twitter" type="text"
							value="mikeross" /> <label for="twitter"><i
							class="fa fa-twitter fa-fw" aria-hidden="true"></i></label> <input
							name="twitter" type="text" value="ross81" /> <label
							for="twitter"><i class="fa fa-instagram fa-fw"
							aria-hidden="true"></i></label> <input name="twitter" type="text"
							value="mike.ross" />
					</div> -->
				</div>
			</div>
			<div id="search">
				<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
				<input type="text" placeholder="Search Friends" id="searchFriends"/>
			</div>
			<div id="contacts">
				<ul id="receiverArea">
				</ul>
			</div>
			<!-- <div id="bottom-bar">
				<button id="addcontact">
					<i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>Add contact</span>
				</button>
				<button id="settings">
					<i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>Settings</span>
				</button>
			</div> -->
		</nav>

	<!--Chat Box-->
	<div class="container">
		<div class="row">
			<div class="chatbox chatbox22 chatbox--closed rounded-top"
				style="z-index: 9998">
				<div class="chatbox__title">
					<h5>
						<a id="receiverMemberName" href="javascript:void()"></a>
					</h5>
					<span class="badge badge-danger mr-2" id="notificationChatBox"></span>
					<button class="chatbox__title__close"><i class="fa fa-window-close fa-5" aria-hidden="true"></i></button>
				</div>
				<div class="chatbox__body">
					<div class="messages" id="messages">
						<ul id="conversation">
						</ul>
					</div>
				</div>
				<div class="panel-footer">
					<div class="input-group">
						<input id="messageInput" type="text"
							class="form-control input-sm chat_set_height rounded"
							placeholder="Type your message here" /> <span
							class="input-group-btn">
							<button class="btn bt_bg btn-success" id="btn-chat" type="submit">Send</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/js/chat.js'/>"></script>
	<script>
		$(document).ready(function() {
							var $chatbox = $('.chatbox'), $chatboxTitle = $('.chatbox__title'), $chatboxTitleClose = $('.chatbox__title__close'), $chatboxCredentials = $('.chatbox__credentials');
							$chatboxTitle.on('click', function() {
								$chatbox.toggleClass('chatbox--tray');
								$("#notificationChatBox").text("")
								count = 0;
							});
							$chatboxTitleClose.on('click', function(e) {
								e.stopPropagation();
								$chatbox.addClass('chatbox--closed');
							});
							$chatbox.on('transitionend', function() {
								if ($chatbox.hasClass('chatbox--closed'))
									$chatbox.hide();
							});

							$('#dismiss , .overlay').on('click', function() {
								console.log("closeclose")
								$('#sidebar').removeClass('active');
								$('.overlay').removeClass('active');
							});

							$('#sidebarCollapse').on('click',function() {
								$('#sidebar').addClass('active');
								$('.overlay').addClass('active');
								$('.collapse.in').toggleClass('in');
								$('a[aria-expanded=true]').attr('aria-expanded', 'false');
								});
						});
	</script>
</body>
</html>