<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Product Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	function on() {
		var msg = "確定重新上架？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
	function off() {
		var msg = "確定下架？";
		if (confirm(msg) == true) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>
<style>
.page {
	overflow: hidden;
}

.product-list table {
	padding: 20px;
	background-color: #272727;
}

.product-list th {
	padding: 10px 0;
	text-align: center;
	color: #fff;
	border-top: 1px solid #272727;
	border-bottom: 1px solid #272727;
}

.product-list td {
	padding: 10px 0;
	text-align: center;
	color: #000;
}

.product-list th {
	background-color: #272727;
	padding: 0 20px;
}

.product-list img {
	display: block;
	height: 120px;
	margin: 0 auto;
}

.button {
	margin: 0 auto;
	padding: 5px 10px;
	background-color: #272727;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button:hover {
	background-color: #fff;
	color: #272727;
	text-decoration: none;
}

.button-push {
	margin: 0 auto;
	padding: 5px 10px;
	background-color: #336666;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button-push:hover {
	background-color: #fff;
	color: #336666;
	text-decoration: none;
}

.button-pull {
	margin: 0 auto;
	padding: 5px 10px;
	background-color: #7E3D76;
	color: #fff;
	outline: none;
	border-radius: 5px;
}

.button-pull:hover {
	background-color: #fff;
	color: #7E3D76;
	text-decoration: none;
}
</style>

<body>

	<jsp:include page="admin_header.jsp" />

	<!-- Content 區塊 -->

	<div class="container page" style="margin: 50px auto; width: 100%">

		<div class=" col-md-4"
			style="float: left; font-size: 44px; margin-top: 50px">所有商品管理</div>
		<div class="card my-4" style="float: right">
			<h5 class="card-header">Search</h5>
			<div class="card-body">
				<div class="input-group">
					<input id="productName" type="text" class="form-control pb">

					<!-- 	                <button id="D" class="btn btn-secondary pb" type="button">Search</button> -->
					<form method="POST" action="getProdByName?index=1">
						<input id="n" type="hidden" name="productName"> <input
							id="s" type="submit" value="查詢">
					</form>

				</div>
			</div>
		</div>
		<table class="table" id="abc">
			<thead class="thead-dark">
				<tr>
					<th scope="col">picture</th>
					<th scope="col">ID</th>
					<th scope="col">itemsName</th>
					<th scope="col">description</th>
					<th scope="col">category</th>
					<th scope="col">price</th>
					<th scope="col">discount</th>
					<th scope="col">stock</th>
					<th scope="col">edit</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="pb" items="${showAllProduct}" begin="0" step="1"
					varStatus="i">
					<tr>
						<th scope="row"><div style="text-align: center">
								<img src="<c:url value='/ProductPicture/${pb.productId}'/>"
									height="120px" />
							</div></th>
						<td>${pb.productId}</td>
						<td>${pb.productName}</td>
						<td>${pb.productDetail}</td>
						<td>${pb.category}</td>
						<td>$${pb.unitPrice}</td>
						<td>${pb.discount}</td>
						<td>${pb.stock}</td>
						<td><c:if test="${pb.status=='0'}">
								<form method="post" class="form-group row"
									action="<c:url value='/pullProduct?id=${pb.productId}'/>">
									<input type="hidden" name="id" value="${pb.productId}" /> <input
										type="submit" value="下架" class="button-pull"
										onclick="return confirm('確定下架？')" />
								</form>
							</c:if> <c:if test="${pb.status=='1'}">
								<form method="post" class="form-group row"
									action="<c:url value='/pushProduct?id=${pb.productId}'/>">
									<input type="hidden" name="id" value="${pb.productId}" /> <input
										type="submit" value="上架" class="button-push"
										onclick="return confirm('確定重新上架？')" />
								</form>
							</c:if>



							<form method="get" class="form-group row"
								action="<c:url value='update?id=${pb.productId}'/>">
								<input type="hidden" name="id" value="${pb.productId}">
								<input type="submit" value="修改" class="button" />
							</form></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<ul class="pagination justify-content-center"
			style="padding-bottom: 20px">

			<c:forEach begin="1" step="1" end="${listCount}" varStatus="i">
				<li class="page-item"><a class="page-link"
					href="${pageContext.request.contextPath}/showAllProduct?index=${i.index}">${i.index}</a></li>
			</c:forEach>

		</ul>
	</div>

	<jsp:include page="admin_footer.jsp" />


	<script>
		var url = "/FunBar/";

		$("#s").click(function() {

			var on = $("#productName").val();

			$("#n").val(on);

		})
	</script>

</body>
</html>