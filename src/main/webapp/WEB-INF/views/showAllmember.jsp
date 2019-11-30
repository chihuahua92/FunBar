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
<title>showAllmember</title>
</head>
<style>
button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
<body>
	<jsp:include page="admin_header.jsp" />

	<div
		style="padding: 10px; float: left; width: 1000px; margin-bottom: 100px;">
		<div class="container" style="text-align: center">
			<h1>會員管理</h1>
			<form action="getMemberByName" method="post">
				<input type="text" name="memberName" id="memberName"
					placeholder="輸入姓名查詢"> <input type="submit" value="會員查詢">
			</form>
		</div>
		<table style="border: 3px #cccccc solid;" cellpadding="15" border='1'>
			<tr bgcolor="#8fefa">
			<tr>
				<th style="width: 50px;">會員編號
				<th>姓名
				<th>地址
				<th>生日
				<th>電話
				<th>帳號
				<th>email
				<th>大頭貼
				<th>等級
				<th style="width: 50px;">功能 <c:forEach var="member"
						items="${members}">
						<!--  隨便取                      對應Controller-->
						<tr>
							<td>${member.id}</td>
							<td>${member.memberName}</td>
							<td>${member.memberAddress}</td>
							<td>${member.memberBirth}</td>
							<td>${member.memberPhone}</td>
							<td>${member.memberId}</td>
							<td>${member.memberEmail}</td>
							<td><div style="text-align: center">
									<img src="<c:url value='/membergetPicture/${member.id}'/> "
										height="120px" width="120px" required="required" />
								</div></td>
							<td>${member.memberLevel}</td>
							<td><a
								href="<spring:url value='deletemb?id=${member.id}' />">
									<button type="button" class="btn btn-outline-secondary"
										style="background-color: red; color: black;">刪除</button>
							</a> <a href="<spring:url value='getONE?id=${member.id}' />">
									<button type="button" class="btn btn-outline-secondary"
										style="background-color: #4CAF50; color: black;">修改</button>
							</a></td>

						</tr>
					</c:forEach>
				</th>
			</tr>


		</table>
<div style="margin:50px 0">
	<ul class="pagination justify-content-center">


		<c:forEach begin="1" step="1" end="${count}" varStatus="i">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/showAllmember?index=${i.count}">${i.count}</a></li>
		</c:forEach>

	</ul>
	</div>
	</div>
	
	
	
	<jsp:include page="admin_footer.jsp" />
</body>
</html>

