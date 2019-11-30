<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>意見</title>

</head>
<body>
<jsp:include page="header.jsp" />

<hr>
	<div class="container" style="margin: 150px auto; width: 60% ; font-family:微軟正黑體">
		<h2>請留下您對此活動的意見</h2>
		<hr>
		
		<p>活動名稱 :</P><br>
		<p Style="font-size:2em;color:rgba(97, 35, 6, 0.877)">${activity.eventName}</p><br>
		<form:form modelAttribute="suggestion" action="addSuggestion" method="POST">
			
			
			<input name="memberId" type="hidden" class="form-control"
					id="address" value="${member.memberId}" />
			
			<div class="form-group">
				<label for="name">會員名稱 :　</label>
				<input name="memberName" type="text" class="form-control" readonly="readonly"
					id="name" value="${member.memberName}" />
<%-- 				<input path="memberName" type="hidden" value="${member.memberName}" /> --%>
			</div>
			
			<div class="form-group">
				<label for="email">E-mail :　</label>
				<input name="memberEmail" type="text" class="form-control"
					id="email" value="${member.memberEmail}" />
			</div>

			<div class="form-group">
				<label for="content">我有話要說----</label>
				<form:textarea path="suggestion" class="form-control" rows="5"
					id="content" />
			</div>
			
			<input name="eventName" type="hidden" value="${activity.eventName}" />

			<form:button type="submit" class="btn btn-outline-secondary">送出</form:button>
			<a href="${pageContext.request.contextPath}/getsiqnupActivity/${member.memberId}">
			<button type="button" class="btn btn-outline-secondary" >返回</button></a>

		</form:form>
	</div>


	
<jsp:include page="footer.jsp" />
</body>
</html>