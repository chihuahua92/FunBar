<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<style>
.orderBtn, .removeBtn {
	font-size: 18px;
	text-decoration: none;
	padding: 5px;
	background: #fff;
	border: 1px solid black;
	border-radius: 1px;
}

.removeBtn:hover {
	background: #eee;
}

.orderBtn:hover {
	background: #eee;
}

.add, .minus {
	padding: 0 5px;
	font-size: 18px;
	font-weight: bold;
	background-color: #02C874;
	border-radius: 2.5px;
	color: #fff;
}

.add:hover {
	background-color: #019858;
}

.minus:hover {
	background-color: #019858;
}

input {
	outline: none;
}

.btn-back {
	padding: .5rem .75rem;
	font-size: 1rem;
	line-height: 1.25;
	border-radius: .25rem;
	color: #fff;
	background-color: #FF359A;
	border-color: #FF359A;
}

.btn-back:hover {
	color: #fff;
	background-color: #BF0060;
	border-color: #BF0060;
}
</style>
<head>
<meta charset="UTF-8">
<title>My cart</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src=js/showCart.js></script>
</head>

<body>
	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div class="page row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div align="right" colspan="8"
				style="float: fight; margin: 10px 10px 0px 0px">

				<a class="orderBtn" href="<c:url value='/deleteCartItem' />" onclick="confirm('確定清空購物車？')">remove the cart</a>

			</div>
			<div class="table-responsive">
				<table class="table" style="margin: 20px 0">
					<thead>
						<tr>
							<th>picture</th>
							<th>item</th>
							<th>unitPrice</th>
							<th>stock</th>
							<th>quantity</th>
							<th>discount</th>
							<th>subtotal</th>
							<th>edit</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="ci" items="${sessionScope.Cart.cartItems}"
							begin="0" step="1" varStatus="i">
							<tr>
								<td><div style="text-align: center">
										<img
											src="<c:url value='/ProductPictures/${ci.product.productId}' />"
											height="120px">
									</div></td>
								<td style="font-size:18px;">${ci.product.productName}</td>
								<td class="unit" data-product="${i.index}">${ci.product.unitPrice}</td>
								<td align="left" class="theStock" data-product="${i.index}">${ci.product.stock}</td>

								<td style="width: 200px">
									<button type="button" class="minus" data-product="${i.index}">-</button>
									<input id="count" type="text" maxlength="2" size="3"
									value="${ci.count}" size="1" class="num"
									data-product="${i.index}" /> <input class="pdid" type="hidden"
									value="${ci.product.productId}" data-product="${i.index}">
									<button type="button" class="add" data-product="${i.index}">+</button>
								</td>
								<td class="hallin" data-product="${i.index}">${ci.product.discount}</td>

								<td class="smallPrice pd" style="width: 100px"></td>
								<td><div style="float: right">
										<input type="hidden" class="price" value="${ci.subtotal}">
										<a class="removeBtn"
											href=" <c:url value='/removeCartItem?productId=${ci.product.productId}' />">delete</a>
									</div></td>

							</tr>
						</c:forEach>
						<tr style="text-align: right">
							<td align="right" colspan="8">總計:<span class="totalAmount"
								style="padding: 0 10px; color: #FF0088; font-size: 18px">${sessionScope.Cart.total}</span></td>
						</tr>
						<tr>
							<td align="right" colspan="8">
								<div class="col-sm-4 col-xs-12">
									<a href="<c:url value='/shoppingCart?index=1' />"><button
											class="btn btn-back">Back to shop</button></a>
									<button id="buy" type="button" class="btn btn-info page-btn"
										data-toggle="modal" data-target="#createForm">Go pay</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<!-- model -->
		<div class="modal fade" id="createForm" role="dialog"
			aria-labelledby="myModalLabel1"
			style="background: rgba(0, 0, 0, 0.8)">
			<div class="modal-dialog modal-dialog-centered modal-lg"
				role="document">
				<div class="modal-content" style="padding: 10px">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

					<div class="modal-body" id="createForm">
						<div class="container page" style="margin-top: 20px">
							<table class="table" style="margin: 5px 0;">
								<thead>
									<tr>
										<th>Item</th>
										<th>price</th>
										<th>quantity</th>
										<th>discount</th>
										<th>subtotal</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="ci" items="${sessionScope.Cart.cartItems}"
										begin="0" step="1" varStatus="i">
										<tr>
											<td class="pn"></td>
											<td class="pp"></td>
											<td class="pc" style="text-align: center;"></td>
											<td class="pddd"></td>
											<td class="st"></td>
										</tr>
									</c:forEach>
								</tbody>
								<tr>
									<td class="ta" align="right" colspan="8"
										style="color: #FF60AF;"></td>
								</tr>
							</table>

						</div>
					</div>



					<form method="post" action="orderSetUp" style="margin:0 50px 10px 50px">
						<div>
							<h4>check again your information</h4>
						</div><br>
						<div class="form-group">
							<label for="CCname">Name</label> <input
								type="text" class="form-control" id="CCname"
								value="${sessionScope.member.memberName}">
						</div>
						<div class="form-group">
							<label for="CCphone">Phone</label> <input
								type="text" class="form-control" id="CCphone"
								value="${sessionScope.member.memberPhone}">
							
						</div>
						<div class="form-group">
							<label for="CCaddress">Address</label> <input
								type="text" class="form-control" id="CCaddress"
								value="${sessionScope.member.memberAddress}">
							<small class="form-text text-muted">We'll never share your address with anyone else.</small>
						</div>
						
						<input type="submit" value="CHECK!" class="btn btn-success pay"
							style="float: right" />
					</form>
				</div>

			</div>
			<!-- modal-content -->
		</div>
		<!-- modal-dialog -->
	</div>
	<!-- modal -->





	<jsp:include page="footer.jsp" />
	<script>
		$(document)
				.ready(
						function() {
							$('#createForm').on('shown.bs.modal', function() {
								$(document).off('focusin.modal');
							});

							let todata;
							$("#buy")
									.click(
											function() {
												$
														.ajax({
															url : "http://localhost:8080/FunBar/buyCartJson",
															method : "POST",
															dataType : "JSON",
															contentType : "application/x-www-form-urlencoded; charset=UTF-8",
															success : function(
																	res) {
																let data = res;
																let totalAmount = 0;
																for (let i = 0; i < data.length; i++) {

																	let productName = data[i].product.productName;
																	$(".pn")
																			.eq(
																					i)
																			.text(
																					productName);
																	console
																			.log(productName);

																	let unitPrice = data[i].product.unitPrice;
																	let count = data[i].count;
																	let discount = data[i].product.discount;
																	$(".pp")
																			.eq(
																					i)
																			.text(
																					unitPrice);
																	$(".pc")
																			.eq(
																					i)
																			.text(
																					count);
																	$(".pddd")
																			.eq(
																					i)
																			.text(
																					discount);
																	let subTotal = parseInt(unitPrice
																			* count
																			* discount
																			/ 10);
																	$(".st")
																			.eq(
																					i)
																			.text(
																					subTotal);
																	console
																			.log(subTotal);
																	totalAmount += subTotal;
																}
																$(".ta")
																		.text(
																				"$"
																						+ totalAmount);

															}
														})
											})
						})
	</script>

</body>

</html>