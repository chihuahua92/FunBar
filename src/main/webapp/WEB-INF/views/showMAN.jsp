<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
<title>showAllmember</title>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/css/styles.css'
	type="text/css" />
</head>
<style>
* {
	font-family: 微軟正黑體;
}

html, body {
	background: url("../images/member.jpg");
	background-size: cover;
	width: 100%;
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #eee;
	padding-top: 20px;
	padding-bottom: 10px;
}

.login {
	background-color: black;
	text-align: center;
	width: 450px;
}

.error {
	color: white;
}

figure {
	margin: 50px;
	border: :5px solid rab(8, 8, 8);
}

button {
	border: 0;
	padding: 6px 12px;
	margin: 20px auto;
	font-size: 18px;
	background: white;
	border-radius: 10px;
	color: black;
	font-family: "微軟正黑體", sans-serif;
}
</style>

<body>
	<h1>修改成功</h1>

	<div>
	<button>
		<a href="${pageContext.request.contextPath}"> 回首頁 </a>
		</button>
	</div>

</body>
</html>

