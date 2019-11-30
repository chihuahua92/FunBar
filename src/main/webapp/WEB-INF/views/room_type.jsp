<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理房型</title>

<style>
img{
width:150px;
height:70px;

}
</style>
</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />

	<div style="margin-top:30px; margin-bottom:120px; " class="row container">
		<table id="ch" class="table table-striped col-md-10" style="text-align: center;border:1px solid black;margin-left:5px;border-bottom:none;" >
			<thead>
				<tr>
					<th>房型圖片<th>房型名稱<th>房型數量<th>房型價位<th>房型詳細資訊<th>修改<th>刪除
				</tr></thead>
			<tbody>
			<c:forEach var="r" items="${room}">
				<tr>
					<td><img src="room/${r.room_id}"></td>
					<td>${r.room_type}</td>
					<td>${r.room_quantity}</td>
					<td>${r.room_price}</td>
					<td>${r.room_description}</td>
					<td><a href="pullSingleRoom/${r.room_id}"><button class="button" type="button">修改</button></a></td>
					<td><a href="cancelRoom/${r.room_id}"><button class="button" type="button" onclick="return confirm('是否刪除');">刪除</button></a></td>
					
				</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<div style="text-align:center" class="col-md-1">
			<button type="button" onclick="location='add_form'">新增房型</button>
		</div>
	</div>
	
	<jsp:include page="admin_footer.jsp" />
</body>
</html>