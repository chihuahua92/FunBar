<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>login</title>
</head>
<style>
* {
	font-family: 微軟正黑體;
}

body {
	border: 2px solid;
	border-radius: 25px;
	display: flex;
	justify-content: center;
	align-items: center;
}

figure {
	margin: 50px;
	border: :5px solid rab(8, 8, 8);
}
</style>
</head>

<meta charset="UTF-8">

<body>
	<!-- Header -->
	<jsp:include page="header.jsp" />

	<!-- Content -->
	<table style="border: 3px #cccccc solid;" cellpadding="15" border='1';>
		<div>
			<h1>會員資料</h1>
			<form action="updatemb1" method="POST" enctype="multipart/form-data">
				<figure style="float: left">
					<img style="height: 310px; width: 310px; border-radius: 25px;"
						src="<c:url value='/membergetPicture/${member.id}'/>">
					<br>
					<input id="updateImg" type="file" name="memberimg" value="${one.memberimg}" required="required">
				</figure>
		</div>
		<div style="padding-top: 120px">
			<fieldset style="border: 1px #cccccc solid; width: 220px; border-radius: 20px;">
				<label for="memberId">姓名:</label> <input type="text"
					class="form-control" name="memberName" value="${one.memberName}">
				<label for="memberAddress">地址:</label> <input type="text"
					class="form-control" name="memberAddress"
					value="${one.memberAddress}">
					 <label for="memberAddress">生日:</label>
				<input type="date" class="form-control" name="memberBirth"
					value="${one.memberBirth}"> 
					<label for="memberAddress">電話:</label>
				<input type="text" class="form-control" name="memberPhone"
					value="${one.memberPhone}">
					 <label for="memberPwd">
					密碼:</label>
				<input type="password" class="form-control" name="memberPwd"
					disabled value="${one.memberPwd}"> <label
					for="memberAddress">帳號:</label> <input type="text"
					class="form-control" name="memberId" disabled
					value="${one.memberId}"> <label for="memberAddress">信箱:</label>
				<input type="text" class="form-control" name="memberEmail"
					value="${one.memberEmail}"> <input type="hidden" name="id"
					value="${one.id}" />
					 <input type="submit" id="updateok"
					class="btn btn-outline-secondary" value="送出"> 
					<a
					href="${pageContext.request.contextPath}">
					<button type="button"  class="btn btn-outline-secondary">回首頁</button>
				</a>
		</div>
		</form>
		</fieldset>
	</table>

<!-- FunBar Resource Link -->
<script type="text/javascript" src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/popper.js"/>"></script>
<script type="text/javascript" src="<c:url value="/vendor/bootstrap/js/bootstrap.min.js"/>"></script>

<!-- Member Custom Script -->
<script>
var updateFlag = false;
$("#updateImg").change(function() {
	updateFlag = true;
})

$("#updateok").click(function() {
	if(updateFlag) {
		alert("修改成功");
	}
})
</script>
</body>
</html>