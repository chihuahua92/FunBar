<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>完成訂位</title>
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

						
						<img src="images/phone.png" alt="" title="" height="200px"
							width="555px" style="margin:5px;border:5px solid black;border-radius:5px">


					</div>

					<div class="modal-body" style="text-align: center">
						<h4 class="modal-title" style="color:blue;font-size:28px;font-family:bold">訂位人資料</h4>
						<input type="hidden" name="date" value="${date}">
						<input type="hidden" name="time" value="${time}">
						<input type="hidden" name="people" value="${people}">
						
						姓名:<input type="text" name="name"><br>
						性別:<input type="radio" name="sex"
						value="male" style="margin-left: 15px">Mr<input
						type="radio" name="sex" value="female">Ms<br>
						手機:<input type="text" name="phone"><br>
						電子郵件:<input type="hidden" name="email" value="admin@gmail.com"><br>
						備註:<input type="text" name="remark">

					</div>

					<div class="modal-footer" style="text-align: center">

						<button style="background-color: orange; border: 1px solid red;font-size:22px;width:400px" onclick="location='http://localhost:8080/FunBar/ad_addReservations'" type="button" class="btn btn-default" data-dismiss="modal">回首頁</button>

					</div>

				</div>



			</div>

		</div>



	</div>

</body>
</html>