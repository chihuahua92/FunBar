<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Product Info</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<style>
.context {
	overflow: hidden;
	padding: 30px 20px;
}

form {
	padding: 20px;
}

img {
	display: block;
	float: right;
	height: 120px;
	margin: 0 auto;
}

.btnMargin {
	margin-top: 10px;
}

@media ( max-width : 960px) {
	.prodlist {
		width: 31%;
	}
}

@media ( max-width : 600px) {
	.prodlist {
		width: 48%;
	}
}
</style>
<body>

	<jsp:include page="admin_header.jsp" />



	<!-- Content 區塊 -->
	<div class="context">
		<h1>修改商品資料</h1>
		<hr>

		<div>
			<figure>
				<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
			</figure>
		</div>

		<form method='POST' enctype="multipart/form-data"
			action="updateProduct">


			<div>
				<label for="productId">商品 ID</label> <input name="productId"
					value="${pb.productId}" type='text' disabled /> <input
					type="hidden" name="id" value="${pb.productId}" />
			</div>


			<div style="display:none;">
				<label for="productNo">商品編號</label> 
				<input id="productNo" name="productNo" value="${pb.productNo}" type="hidden"/>
			</div>

			<div>
				<label for='productDetail'>商品說明</label> <input autocomplete="off"
					name="productDetail" id="productDetail" value="${pb.productDetail}"
					type='text' />
			</div>

			<div>
				<label for='productName'>商品名稱</label> <input autocomplete="off"
					name="productName" id="productName" value="${pb.productName}"
					type='text' />
			</div>

			<div>
				<label for="category">商品分類</label> <select name="category">
					<option>${pb.category}</option>
					<option value="vodka">vodka</option>
					<option value="gin">gin</option>
					<option value="rum">rum</option>
					<option value="tequila">tequila</option>
					<option value="whisky">whisky</option>
					<option value="brandy">brandy</option>
					<option value="beer">beer</option>
				</select>
			</div>

			<div>
				<label for="unitPrice">商品單價</label> 
				<input autocomplete="off" name="unitPrice" id="unitPrice" value="${pb.unitPrice}" type='text'/>
			</div>

			<div>
				<label for="discount">商品折扣</label> <input autocomplete="off"
					name="discount" id="discount" value="${pb.discount}" type='text' />
			</div>

			<div>
				<label for="stock">庫存數量</label> <input autocomplete="off"
					name="stock" id="stock" value="${pb.stock}" type='text' />
			</div>


			<div>
				<label for="productCover">商品圖片</label> <input type='file'
					name="image" value="${pb.productImage}" />

			</div>


			<div style="margin-bottom:50px">
				<input type='submit' class='btn btn-primary' value="送出" />
			</div>

		</form>
	</div>

	<jsp:include page="admin_footer.jsp" />

</body>
</html>