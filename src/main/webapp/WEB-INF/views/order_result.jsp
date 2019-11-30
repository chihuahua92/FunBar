<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交易結果</title>
<style>
.form-control[readonly] {
	background: white;
	opacity: 0.6;
}

.ui-widget-header {
	background-color: white;
}

p {
	margin: 0.5% 2%;
}
</style>

</head>


<body>


<jsp:include page="header.jsp" />
	<div id="page-wrapper" class="page animsition">
		<div id="header1">
			<!-- Header -->
	
	

		</div>
		<!-- Main -->
		<div class="wrapper style1">

			<div class="container">
				<div class="row">
					<div class="col-12">
						<div id="movie-info" class="row mb-3">
						</div>
						<div>
							<table class="table border" style="border-radius: 10px">
								<thead>
									<tr class="table-warning">
										<th>
											<div class="h2">
												<strong>訂單編號 : ${sessionScope.showOrder.orderId}</strong>
											</div>
											<small class="text-muted" style="font-size: 14px">以下為此次訂單詳細資訊，您可以在我My Orders內查看您的訂單</small>
										</th>
									</tr>
								</thead>
								<tbody>

									<tr>
										<td>
											<div>付款狀態</div>

													<h3 style="text-align: right; color: green">付款成功</h3>


										</td>
									</tr>

									<tr>
										<td>
											<div>訂購人</div>

											<p>姓名: ${sessionScope.showOrder.memberName}</p>
			
											<p>電話: ${sessionScope.showOrder.memberPhone}</p>

										</td>
									</tr>
									<tr>
										<td>
											<div>商品明細</div>
											<c:forEach var="product" items="${sessionScope.showProducts}"  begin="0" step="1" varStatus="i">
											<fmt:formatNumber type="number" value="${product.unitPrice*product.discount/10}" maxFractionDigits="0" var="price" />
												<p>${product.productName}&nbsp;&nbsp;&nbsp;${price}&nbsp;&nbsp;&nbsp;${sessionScope.orderItemList[i.index].quantity}入</p> 
												<p></p>
												</c:forEach>
											
										</td>
									</tr>
									<tr>
										<td>
											<div>總計</div>
											<p>
												<strong style="text-align: center;">${sessionScope.showOrder.totalAmount} 元整</strong>
											</p>

										</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row justify-content-end">
					<div class="col-md-auto col-12-mobile">
						<a href="<c:url value='/'/>">
							<button>回首頁</button>
						</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Footer -->
<jsp:include page="footer.jsp" />
	</div>

	<!-- Scripts -->
<%-- 	<script src="<c:url value='/assets/js/jquery.min.js'/>"></script> --%>
	<script src="<c:url value='/assets/js/jquery.dropotron.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrolly.min.js'/>"></script>
	<script src="<c:url value='/assets/js/jquery.scrollex.min.js'/>"></script>
	<script src="<c:url value='/assets/js/browser.min.js'/>"></script>
	<script src="<c:url value='/assets/js/breakpoints.min.js'/>"></script>
	<script src="<c:url value='/assets/js/util.js'/>"></script>
	<script src="<c:url value='/assets/js/main.js'/>"></script>
</body>
</html>