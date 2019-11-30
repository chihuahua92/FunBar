<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Orders</title>

</head>


<body>


	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="page row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div id="emptyCart">
				<div align="center" colpsan="8">
					<a href="/FunBar/shoppingCart?index=1"><img src="images/emptyOrder.png"
						style="height: 367px; filter: grayscale(80%);" alt="emptyOrder"
						title="back to shop"></a><br>
					<br>
					<h3 style="margin-bottom: 10px">Your Order List is Empty.</h3>
				</div>

				<div align="center" colspan="8" style="margin: 20px">
					<a href="<c:url value='/shoppingCart?index=1' />"><button
							class="btn btn-dark">Back to mall</button></a>
				</div>
			</div>

		</div>
	</div>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />


</body>
</html>