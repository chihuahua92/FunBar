<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>login</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" href="<c:url value='/css/bootstrap.min.css' />">
<link rel="stylesheet" href="css/memberadd.css">
<script src="js/addmember.js"></script> 
<script type="text/javascript"
		src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>">
		
	</script>
</head>
<body> 
<div class="login">
    <fieldset>
    <form:form modelAttribute="Member" action="joinus" method="POST"
    enctype="multipart/form-data" >
        <h2>會員註冊</h2>
      
<td><p> 姓名 : </p> <form:input autocomplete="off" id="memberName" type="text" path="memberName" /></td>
<div id="noName"></div>
<div class="error">${errorMsg.errUserName}</div>
<td><p> 地址: </p> <form:input type="text" path="memberAddress"  value=""/></td>
<div class="error">${errorMsg.errAddress}</div>
<td><p> 生日 : </p> <form:input type="date" path="memberBirth"  value=""/> </td>
<div class="error">${errorMsg.errBirth}</div>
<td><p> 電話 : </p> <form:input type="text" path="memberPhone"  value=""/></td>
<div class="error">${errorMsg.errPhone}</div>
<td><p> 帳號 : </p> <form:input autocomplete="off" id="memberId" type="text" path="memberId"  value=""/></td>
<div id="noId"></div>
<div class="error">${errorMsg.errId}</div>
<td><p> 密碼 : </p> <form:input autocomplete="off" id="memberPwd" type="password"  path="memberPwd"  value=""/></td>
<div id="noPwd"></div>
<div class="error">${errorMsg.errPwd}</div>
<td><p> Email : </p> <form:input type="text" path="memberEmail"  value=""/></td>
<div class="error">${errorMsg.errEmail}</div>
<td><p> 大頭貼 : </p> <form:input path = "memberimg"  type ="file" required="required"  maxlength="40"/> </td>
      <br>	<button id="signUpBtn"  type="submit">送出</button>
        	<button  type="reset">清除</button>
        </fieldset>
</form:form>
</div>
<script>
$("#signUpBtn").click(function() {
	if($("memberId").val().length>0 && $("memberPwd").val().length>0") {
		alert("請到信箱收取驗證信");
	}
})
</script>
</body>
</html>