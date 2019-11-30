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








	<!-- 		<table class="table table-striped"> -->

	<%-- 			<c:forEach var="o" items="${orders}" begin="0" step="1" --%>
	<%-- 				end="${fn:length(orders)}" varStatus="i"> --%>



	<!-- 				<thead> -->
	<!-- 					<tr> -->
	<!-- 						<th scope="col">#</th> -->
	<!-- 						<th scope="col">items</th> -->
	<!-- 						<th scope="col">unitPrice</th> -->
	<!-- 						<th scope="col">quantity</th> -->
	<!-- 						<th scope="col">subtotal</th> -->
	<!-- 					</tr> -->
	<!-- 				</thead> -->


	<!-- 				<tbody> -->

	<%-- 					<c:forEach var="oi" items="${o.orderItem}" begin="0" step="1" --%>
	<%-- 						end="${fn:length(o.orderItem)}" varStatus="a"> --%>
	<!-- 						<tr> -->
	<!-- 							<td></td> -->
	<%-- 							<td>${sessionScope.allProduct[i.index][a.index].productName}</td> --%>
	<%-- 							<td>${sessionScope.allProduct[i.index][a.index].unitPrice}</td> --%>
	<%-- 							<td>${oi.quantity}</td> --%>
	<!-- 							<td>$${oi.subTotal}.0</td> -->
	<!-- 						</tr> -->
	<%-- 					</c:forEach> --%>

	<!-- 				</tbody> -->




	<%-- 			</c:forEach> --%>

	<!-- 		</table> -->







	<!-- 		<div id="accordion"> -->
	<!-- 			<div class="card"> -->
	<!-- 				<div class="card-header" id="headingOne"> -->
	<!-- 					<h5 class="mb-0"> -->
	<!-- 						<button class="btn btn-link" data-toggle="collapse" -->
	<!-- 							data-target="#collapseOne" aria-expanded="true" -->
	<!-- 							aria-controls="collapseOne">Collapsible Group Item #1</button> -->
	<!-- 					</h5> -->
	<!-- 				</div> -->

	<!-- 				<div id="collapseOne" class="collapse show" -->
	<!-- 					aria-labelledby="headingOne" data-parent="#accordion"> -->
	<!-- 					<div class="card-body">.....</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="card"> -->
	<!-- 				<div class="card-header" id="headingTwo"> -->
	<!-- 					<h5 class="mb-0"> -->
	<!-- 						<button class="btn btn-link collapsed" data-toggle="collapse" -->
	<!-- 							data-target="#collapseTwo" aria-expanded="false" -->
	<!-- 							aria-controls="collapseTwo">Collapsible Group Item #2</button> -->
	<!-- 					</h5> -->
	<!-- 				</div> -->
	<!-- 				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" -->
	<!-- 					data-parent="#accordion"> -->
	<!-- 					<div class="card-body">.....</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 			<div class="card"> -->
	<!-- 				<div class="card-header" id="headingThree"> -->
	<!-- 					<h5 class="mb-0"> -->
	<!-- 						<button class="btn btn-link collapsed" data-toggle="collapse" -->
	<!-- 							data-target="#collapseThree" aria-expanded="false" -->
	<!-- 							aria-controls="collapseThree">Collapsible Group Item #3 -->
	<!-- 						</button> -->
	<!-- 					</h5> -->
	<!-- 				</div> -->
	<!-- 				<div id="collapseThree" class="collapse" -->
	<!-- 					aria-labelledby="headingThree" data-parent="#accordion"> -->
	<!-- 					<div class="card-body">.....</div> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->



	<div class="page row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h1 style="font-family:fantasy;margin-top:5px"">Dear ${sessionScope.member.memberName} ,</h1>
			<h3 style="font-family:fantasy;">here are all your orders , check out please.</h3><br>
			<div id="accordion">
				<c:forEach var="o" items="${orders}" begin="0" step="1"
					end="${fn:length(orders)}" varStatus="i">

					<div class="card">
						<div class="card-header" id="heading${i.index}">
							<h3 class="mb-0">
								<button class="orderToggle btn btn-link" data-toggle="collapse"
									data-target="#collapse${i.index}" aria-expanded="true"
									aria-controls="collapse${i.index}">Your Order
									#${i.index+1} &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${o.orderTime}</button>
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
												<td style="text-align:center;">${oi.quantity}</td>
												<td>${sessionScope.allProduct[i.index][a.index].unitPrice}</td>
												<td>$${oi.subTotal}.0</td>
											</tr>
										</c:forEach>

										<tr>
											<th scope="row"></th>
											<td></td>
											<td></td>
											<th><br>Status<br>
											<br>Total</th>
											<td><br>paid<br>
											<br>$${o.totalAmount}</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>
					</div>

				</c:forEach>
			</div>
		</div>
	</div>



	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script>
		$(document).ready(function() {
			$(".orderToggle").click();
		})
	</script>

</body>
</html>