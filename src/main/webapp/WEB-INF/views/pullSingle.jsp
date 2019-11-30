<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改訂位資訊</title>
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
	background-color: #E0E0E0;
	/* 	opacity:0.2; */
}

.div {
	width: 500px;
	margin: 0 auto;
	text-align: center;
	border: 3px solid #DDDDDD;
	background-color: #AAAAAA;
	opacity: 0.8;
	font-size: 26px;
}

input {
	margin: 3px 0;
	height: 30px;
	width: 150px;
	font-size: 15px;
	font-family: 微軟正黑體;
	font-weight: bold;
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
	text-align: center;
}

h2 {
	background-color: #DDDDDD;
	opacity: 0.7;
	color: black;
	height: 46px;
	box-shadow: 0 0 15px #DDDDDD;
	margin: 10px auto 10px auto;
}

.aaa:focus {
	border-style: solid;
	border-color: #CCEEFF;
	box-shadow: 0 0 15px #DDDDDD;
}

span {
	right: 10px;
}

.a {
	font-size: 15px;
	color: #888888;
}

.s {
	color: black;
}

fieldset {
	border: none;
}

.title {
	height: 30px;
}

.input {
	height: 30px;
	width: 100px;
}

.aaa {
	margin: 1px auto;
}

table {
	margin: 0 auto;
}
</style>
</head>
<body>

	<div class="container">



		<!-- Trigger the modal with a button -->

		<!-- <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Open Modal</button>  -->



		<!-- Modal -->

		<div class="modal fade bg" id="myModal" role="dialog">

			<div class="modal-dialog">



				<!-- Modal content-->

				<div class="modal-content" style="background-color: #FFFFFF">

					<div class="modal-header"></div>

					<div class="modal-body" style="text-align: center">
						<div class="div">
							<h2 style="color: red">更改訂位</h2>
							<form method="post" action="modifyBooking">
								<table>
									<tr>
										<td>訂位編號 :</td>
										<td><input style="background-color: #888888" type="text"
											name="id" disabled value="${data.booking_id}"></td>
									</tr>
									<tr>
										<td>姓名 :</td>
										<td><input type="text" name="name" value="${data.name}"></td>
									</tr>
									<tr>
										<td>手機 :</td>
										<td><input type="text" name="phone" value="${data.phone}"></td>
									</tr>
									<tr>
										<td>訂位日期 :</td>
										<td><input type="text" name="date" value="${data.date}"></td>
									</tr>
									<tr>
										<td>訂位時間 :</td>
										<td><input type="text" name="time" value="${data.time}"></td>
									</tr>
									<tr>
										<td>訂位人數 :</td>
										<td><input type="text" name="people"
											value="${data.people}"></td>
									</tr>

									<tr>
										<td>備註:</td>
										<td><input type="text" name="remark"
											value="${data.remark}"></td>
									</tr>

								</table>
								<input type="hidden" name="id" value="${data.booking_id}">
								<input type="submit" onclick="return confirm('是否更改');"
									value="更改">
							</form>
						</div>
					</div>

					<div class="modal-footer" style="text-align: center">

						<button
							style="background-color: white; border: 1px solid grey; font-size: 22px; width: 400px"
							onclick="history.back()" type="button"
							class="btn btn-default" data-dismiss="modal">返回</button>

					</div>

				</div>



			</div>

		</div>



	</div>

</body>
</html>