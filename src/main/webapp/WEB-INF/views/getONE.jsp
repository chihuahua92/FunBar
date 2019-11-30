<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<style>
    * {
    	font-family: 微軟正黑體;
    }

    body {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: #eee;
    }

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
	<div class="row">
		<h2>會員資料</h2>
		<form action="updatemb" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<label for="memberAddress">帳號:</label>
            	<input type="text" class="form-control" name="memberId" value="${one.memberId}">
                
                <label for="memberId">姓名:</label>
                <input type="text" class="form-control" name="memberName" value="${one.memberName}">
				
				<label for="memberAddress">生日:</label>
                <input type="date" class="form-control" name="memberBirth" value="${one.memberBirth}">
				
				<label for="memberAddress">電話:</label>
                <input type="text" class="form-control" name="memberPhone" value="${one.memberPhone}">
                   
                <label for="memberAddress">信箱:</label>
                <input type="text" class="form-control" name="memberEmail" value="${one.memberEmail}">
				
				<label for="memberAddress">地址:</label>
                <input type="text" class="form-control" name="memberAddress" value="${one.memberAddress}">
                   
                <label for="memberAddress">大頭貼:</label>
                <input type="file" class="form-control" name="memberimg" value="${one.memberimg}" required="requried">
                   
                <label for="memberLevel">等級:</label>
                <input type="number" class="form-control" name="memberLevel" value="${one.memberLevel}">
			</div>

			<div class="button">
				<input type="hidden" name="id" value="${one.id}" />
				<button type="submit" class="btn btn-outline-secondary" >送出</button>

				<a href="${pageContext.request.contextPath}/showAllmember?index=1">
					<button type="button" class="btn btn-outline-secondary">會員管理</button>
				</a>
			</div>
		</form>
	</div>
</body>
</html>