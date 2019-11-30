<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
#emptyCart {
	display: block;
	margin-top:150px;
	margin-bottom:100px;
	margin-left: auto;
	margin-right: auto;
	width: 50%;
}
</style>
<head>
<meta charset="UTF-8">
<title>Cart</title>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div id="emptyCart">
		<div align="center" colpsan="8">
		<a href="/FunBar/shoppingCart?index=1"><img src="images/emptyCart.png" style="height: 367px" alt="emptyCart" title="back to shop"></a>
		<br><br><h3 style="margin-bottom:10px">There is no any product in your cart.</h3>
		</div>
		 
		<div align="center" colspan="8" style="margin:20px ">
		<a href="<c:url value='/shoppingCart?index=1' />"><button class="btn btn-dark" >Back to mall</button></a>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>

</html>