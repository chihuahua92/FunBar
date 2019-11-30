<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Shopping Center</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="<c:url value="/css/shoppingCart.css" />">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="container" style="margin-top: 150px">
		<div class="input-group mb-3">
			<input id="productName" type="text" class="form-control"
				placeholder="input the product name">
			<form method="POST" action="getProdByName2?index=1">
				<div class="input-group-append">
					<input id="n" type="hidden" name="productName" /> 
					<input
						class="btn btn-outline-secondary" type="submit" id="button-addon2"
						value="search" />
				</div>
			</form>
		</div>
		<div class="row" style="float: left">
			<div class="col-md-3">
				<div class="list-group" style="width: 150px">
					<a href="${pageContext.request.contextPath}/shoppingCart?index=1"
						class="list-group-item">All Products</a>
					<c:forEach var='category' items='${categoryList}'>
						<a
							href="${pageContext.request.contextPath}/shoppingCart/${category}?index=1"
							class="list-group-item">${category}</a>
					</c:forEach>
				</div>
				<div style="margin-top: 5px">
					<a href="<c:url value='/showCart' />">
					<button class="btn btn-info">My Cart</button>
					</a>
				</div>	
				
			</div>
			
			
		</div>
	</div>


	<div class="row">
		<c:forEach var="pb" items="${shoppingCart}" begin="0" step="1"
			varStatus="i">
			<div class="prodlist">
				<p>${pb.productDetail}</p>
				<p class="prodtitle">${pb.productName}</p>
				<figure>
					<a href="<c:url value='/product?id=${pb.productId}' />"> <img
						src="<c:url value='/ProductPicture/${pb.productId}'/>" />
					</a>
				</figure>
				<p>
					Unit Price:<span style="color: #FF44AA; font-weight: bold">$
						${pb.unitPrice}</span>
				</p>
				
				<c:choose>
					<c:when test="${pb.discount==10.0}">
						
						<p>
							<fmt:formatNumber type="number" value="${pb.discount}" maxFractionDigits="0" var="discount" />
							<span style="font-weight: bold; color: #CE0000; visibility:hidden">${discount}</span>
						</p>
					</c:when>
					<c:otherwise>
						
						<p>
							<fmt:formatNumber type="number" value="${pb.discount}" maxFractionDigits="0" var="discount" />
							discount：<span style="font-weight: bold; color: #CE0000;">${100-discount*10} %off</span>
						</p>
    				</c:otherwise>
				</c:choose>
			</div>
			<!-- .prodlist -->
		</c:forEach>
	</div>


	<ul class="pagination justify-content-center">
		<%-- 			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/shoppingCart?index=1" aria-label="Previous">  --%>
		<!-- 			<span aria-hidden="true">&laquo;</span> <span class="sr-only">Previous</span></a></li> -->


		<c:forEach begin="1" step="1" end="${listCount}" varStatus="i">
			<li class="page-item"><a class="page-link"
				href="${pageContext.request.contextPath}/getProdByName2?productName=${productName}&index=${i.index}"">${i.index}</a></li>
		</c:forEach>


		<%-- 			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/shoppingCart?index=${listCount}" aria-label="Next">  --%>
		<!-- 			<span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></a></li> -->
	</ul>

	<!-- .container -->


	<jsp:include page="footer.jsp" />
	
	<script>

		$("#button-addon2").click(function() {

			var on = $("#productName").val();

			$("#n").val(on);

		})
	</script>

</body>
</html>