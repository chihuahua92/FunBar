<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客房資訊</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

		$('#myModal').modal('show');

	});

</script>

<style>
.bg {
	background-color:#E0E0E0;
/* 	opacity:0.2; */
}
</style>

</head>
<body>

	<div class="container">



		<!-- Trigger the modal with a button -->

		<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>  -->



		<!-- Modal -->

		<div class="modal fade bg" id="myModal" role="dialog" >

			<div class="modal-dialog">



				<!-- Modal content-->

				<div class="modal-content"  style="background-color:#FFFFFF">

					<div class="modal-header">

						
						<img src="${pageContext.request.contextPath}/room/${room.room_id}" alt="" title="" height="200px"
							width="320px" style="margin:5px;border:5px solid black;border-radius:5px">


					</div>

					<div class="modal-body" style="text-align: center">
						<h4 class="modal-title" style="color:blue;font-size:28px;font-family:bold">客房詳細資料</h4>
						
						
						<table style="text-align: center;margin:0 auto">
						<tr><td>床:</td><td>${room.room_bed}</td></tr>
						<tr><td>房型:</td><td>${room.room_type}</td></tr>
						<tr><td>坪數:</td><td>${room.room_pings}坪</td></tr>
						<tr><td>容納人數:</td><td>${room.room_people}人</td></tr>
						<tr><td>房型介紹:</td><td>${room.room_description}</td></tr>
						</table>

					</div>

				</div>



			</div>

		</div>



	</div>

</body>
</html>