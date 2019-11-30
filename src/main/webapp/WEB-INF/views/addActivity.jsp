<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>新增活動</title>
<style>
	.container{
		font-family:微軟正黑體;
	}
</style>
</head>

<body>
	<jsp:include page="admin_header.jsp" />

	<hr>
	<div class="container" style="margin: 150px auto; width: 60%">
		<h2>新增活動資料</h2>
		<hr>

		<form:form modelAttribute="activity" method='POST'
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="name">活動名稱:</label>
				<form:input path="eventName" type="text" class="form-control"
					id="name" />
			</div>


			<div class="form-group">
				<label for="date">活動日期:</label>
				<form:input path="eventDate" type="date" class="form-control"
					id="date" />
			</div>


			<div class="form-group">
				<label for="address">活動地點:</label>
				<form:input path="address" type="text" class="form-control"
					id="address" />
			</div>

			<div class="form-group">
				<label for=introdoction>活動簡介:</label>
				<form:textarea path="introduction" class="form-control" rows="5"
					id="introdoction" />
			</div>

			<div class="form-group">
				<label for="content">活動內容:</label>
				<form:textarea path="activities" class="form-control" rows="5"
					id="content" />
			</div>

			<div class="form-group">
				<label for="info">活動資訊:</label>
				<form:textarea path="information" class="form-control" rows="5"
					id="info" />
			</div>

			<div class="form-group">
				<p>活動分類</p>
				<form:select path="category">
					<form:option value="品味生活">請選擇分類</form:option>
					<form:option value="放肆朵頤"></form:option>
					<form:option value="藝見自己"></form:option>
					<form:option value="戶外出走"></form:option>
					<form:option value="找點樂子"></form:option>
				</form:select>
			</div>
			<br>

			<div class="form-group">
			<p>上傳圖片</p>
				<form:input id="activityImage" path="activityImage" type='file'
					class='form:input-large' required="required" />
			</div>

			<hr>
			<form:button type="submit" class="btn btn-outline-secondary">送出</form:button>
			<form:button type="reset" class="btn btn-outline-secondary">還原</form:button>

		</form:form>
	</div>

	<jsp:include page="admin_footer.jsp" />
</body>

</html>