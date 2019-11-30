<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>訂位、訂房查詢</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">



<style>

input{
	text-align:center;
}

</style>


</head>

<body>

	<!-- Header -->
	<jsp:include page="header.jsp" />



	
	<section class="page animsition">
			
			<div style="margin:0 auto;width:500px;text-align:center;">
				
				訂位查詢 : <br>
				<input id="bk" type="text" name="bk" placeholder="請輸入訂位編號" style="width:180px"><br>
				<button id="bkq" style="background-color:#E0E0E0;width:180px;">查詢一下</button> 
			<hr>
				訂房查詢: <br>
				<input id="bkr" type="text" name="bkr" placeholder="請輸入訂房編號" style="width:180px"><br>
				<button id="bkrq" style="background-color:#E0E0E0;width:180px">查詢一下</button> 
			<hr>
				<div id="result"></div>
			</div>

			
			
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	

</body>

<script>

var url = "/FunBar/";

$("#bkq").click(function(){
	$.ajax({
		url:"http://localhost:8080" +url +"bookingNumQuery",
		type:"POST",
		dataType:"JSON",
		data:{
				number:$("#bk").val()

			},
		success:function(data){


			console.log(data);
			var txt="";
			   txt += "<div style='margin:0 auto;border:2px solid black;width:400px;text-align:center;font-size:20px;border-radius:10px'>";
			   txt += "<h1>您的訂位資訊 :</h1>";
			   txt += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
			   txt += "<tr><td>訂位人:</td><td>"+data.name+"</td></tr>";
			   txt += "<tr><td>訂位日期:</td><td>"+data.date+"</td></tr>";
			   txt += "<tr><td>訂位時段:</td><td>"+data.time+"</td></tr>";
			   txt += "<tr><td>訂位人數:</td><td>"+data.people+"</td></tr>";
			   txt += "</table></div>";


				$("#result").html(txt);

			}



		})
})





$("#bkrq").click(function(){
	$.ajax({
		url:"http://localhost:8080" +url +"roomNumQuery",
		type:"POST",
		dataType:"JSON",
		data:{
				number:$("#bkr").val()

			},
		success:function(data){


			console.log(data);
			var txt="";
			   txt += "<div style='margin:0 auto;border:2px solid black;width:400px;text-align:center;font-size:20px;border-radius:10px'>";
			   txt += "<h1>您的訂房資訊 :</h1>";
			   txt += "<table style='border:none;text-align:ceneter;margin:0 auto'>";
			   txt += "<tr><td>訂房人:</td><td>"+data.order.order_name+"</td></tr>";
			   txt += "<tr><td>您的房型:</td><td>"+data.room.room_type+"</td></tr>";
			   txt += "<tr><td>客房數:</td><td>"+data.order.rooms+"</td></tr>";
			   txt += "<tr><td>入住日期:</td><td>"+data.order.check_in_time+"</td></tr>";
			   txt += "<tr><td>退房日期:</td><td>"+data.order.check_out_time+"</td></tr>";
			   txt += "</table></div>";


				$("#result").html(txt);

			}



		})
})





</script>

</html>