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


	<jsp:include page="admin_header.jsp" />


		<div class="container" style="margin-bottom:100px">
			<h1 style="font-family: fantasy; margin-top:30px">所有訂單</h1>
			<hr>
			<div id="accordion" style="width:800px">
				<c:forEach var="o" items="${orders}" begin="0" step="1"
					end="${fn:length(orders)}" varStatus="i">

					<div class="card">
						<div class="card-header" id="heading${i.index}">
							<h3 class="mb-0">
								<button class="orderToggle btn btn-link" data-toggle="collapse"
									data-target="#collapse${i.index}" aria-expanded="true"
									aria-controls="collapse${i.index}">${o.orderTime}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp訂單編號#${o.orderId}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp${o.memberName}的訂單</button>
							</h3>
						</div>

						<div id="collapse${i.index}" class="collapse show"
							aria-labelledby="heading${i.index}" data-parent="#accordion">
							<div class="card-body">
								<table class="table">
									<thead class="thead-light">
										<tr>
											<th scope="col">No.</th>
											<th scope="col">items</th>
											<th scope="col">quantity</th>
											<th scope="col">unitPrice</th>
											<th scope="col">subtotal</th>
										</tr>
									</thead>


									<tbody>

										<c:forEach var="oi" items="${o.orderItem}" begin="0" step="1"
											end="${fn:length(o.orderItem)}" varStatus="a">
											<tr>
												<th scope="row">${a.index+1}</th>
												<td>${sessionScope.allProduct[i.index][a.index].productName}</td>
												<td style="text-align: center;">${oi.quantity}</td>
												<td>${sessionScope.allProduct[i.index][a.index].unitPrice}</td>
												<td>$${oi.subTotal}.0</td>
											</tr>
										</c:forEach>

										<tr>
											<th scope="row"></th>
											<td></td>
											<td></td>
											<th><br>Status<br> <br>Total</th>
											<td><br>paid<br> <br>$${o.totalAmount}</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>


	<!-- Footer -->
	<jsp:include page="admin_footer.jsp" />



	<script>
		$(document).ready(function() {
			$(".orderToggle").click();
		})
	</script>

</body>
</html>