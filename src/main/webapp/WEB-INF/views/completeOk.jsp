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

	go();
	function go() {
		setTimeout("location.href='http://localhost:8080/FunBar/'", 8000);
	}
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

						
						<img src="images/two-cups.jpg" alt="" title="" height="200px"
							width="555px" style="margin:5px;border:5px solid black;border-radius:5px">


					</div>

					<div class="modal-body" style="text-align: center">
						<h4 class="modal-title" style="font-size:28px;font-family:DFKai-sb;">訂位完成</h4>
						<span style="font-size:28px;font-family:DFKai-sb;">訂位編號 : ${number}</span><br>
						<span style="font-size:25px;font-family:DFKai-sb;">感謝您的訂位,我們 <span style="color: blue;font-family:DFKai-sb;"> ${date} </span>見 !</span>

					</div>

					<div class="modal-footer" style="text-align: center">

						<button style="background-color: orange; border: 1px solid black;font-size:22px;width:400px" onclick="location='http://localhost:8080/FunBar/'" type="button" class="btn btn-default" data-dismiss="modal">回首頁</button>

					</div>

				</div>



			</div>

		</div>



	</div>

</body>
</html>