<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Activity</title>
</head>
<style>
	.container {
		font-family:微軟正黑體;
			}
</style>

<body>
<jsp:include page="admin_header.jsp" />
	

<div class="container" style="margin: 150px auto ;width:60%">

<h2>活動修改</h2><hr>

<form:form modelAttribute="activity" action='activityQuery'
			method='POST' enctype="multipart/form-data">

<div class="form-group">
  <label for="id">活動ID:</label>
  <form:input path="activityId" type="text" class="form-control" id="id" disabled="true"/>
  <form:input path="activityId" type="hidden" class="form-control" id="id" />
</div>


<div class="form-group">
  <label for="name">活動名稱:</label>
  <form:input path="eventName" type="text" class="form-control" id="name" placeholder="${activity.eventName}"/>
</div>

<div class="form-group">
  <label for="date">活動日期:</label>
  <form:input path="eventDate" type="date" class="form-control" id="date" placeholder="${activity.eventDate}"/>
</div>

<div class="form-group">
  <label for="address">活動地點</label>
  <form:input path="address" type="text" class="form-control" id="address" placeholder="${activity.address}"/>
</div>

<div class="form-group">
  <label for=introdoction>活動簡介:</label>
  <form:textarea path="introduction" class="form-control" rows="5" id="introdoction" placeholder="${activity.introduction}"></form:textarea>
</div>

<div class="form-group">
  <label for="content">活動內容:</label>
  <form:textarea path="activities" class="form-control" rows="5" id="content" placeholder="${activity.activities}"></form:textarea>
</div>

<div class="form-group">
  <label for="info">活動資訊:</label>
  <form:textarea path="information" class="form-control" rows="5" id="info" placeholder="${activity.information}"></form:textarea>
</div>

<div class="form-group">
<p>活動分類:</p>
<form:select path="category">
			<form:option value="其他活動">請選擇分類</form:option>
					<form:option value="放肆朵頤"></form:option>
					<form:option value="藝見自己"></form:option>
					<form:option value="品味生活"></form:option>
					<form:option value="找點樂子"></form:option>
			</form:select>
</div>

<div class="form-group">
<p>活動圖片:</p>
<div><img style="width:150px; height:80px" src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>"></div>
  <form:input id="activityImage" path="activityImage" type='file'
					class='form:input-large' />
</div>


	<hr>
    <form:button type="submit" class="btn btn-outline-secondary">修改</form:button>
    <a href="${pageContext.request.contextPath}/activityQuery?index=1">
    <button type="button" class="btn btn-outline-secondary">取消</button></a>
    </form:form>
        
</div>
</body>

<jsp:include page="admin_footer.jsp" />
</html>