<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<title>線上訂房</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="<c:url value="/css/booking_room.css" />" rel="stylesheet">



<style>



.calendar1 {
	
	width: 300px;
	height:398px;
	
	box-shadow: 0px 1px 1px rgba(0, 0, 0, .1);
	margin: 0 auto;
	color: #66B3FF;
	text-align: center;
	padding: 30px auto;
	font-size: 30px;
	float:left;
	display:block;
	margin-left:2px;
	border: 1px solid #FF8F59;
	border-radius: 5px;

}


</style>


</head>

<body>

	<jsp:include page="header.jsp" />
	

	<section class="animsition" style="background-color:#3C3C3C;height:650px;margin-top:120px">
	<div style="height:150px;width:100%;background-color:#3C3C3C;border:2px solid black;text-align:center;"><img style="height:150px;width:150px;" src="images/icons/logo3.png"></div>
		<div class="calendar"
			style="border: 1px solid #FF8F59; border-radius: 5px">

			選擇入住日期:
			<div class="title">
				<h1 class="pink" id="calendar-title">Month</h1>
				<h2 class="pink" id="calendar-year">Year</h2>
				<a href="" id="pre">◀</a> <a href="" id="next">▶</a>
			</div>
			<div class="body">
				<div class="lightgrey body-list" style="margin-top: 30px">
					<ul>
						<li>日</li>
						<li>一</li>
						<li>二</li>
						<li>三</li>
						<li>四</li>
						<li>五</li>
						<li>六</li>
					</ul>
				</div>

				<div class="darkgrey body-list">
					<ul id="days"></ul>
				</div>
			</div>
		</div>

		<div class="calendar1" style="color:black;background-color:white">
					<form method="POST" action="chooseRoom">
				<h3 style="font-family: DFKai-sb;margin-left:25px;background-color:#FF8F59;border-radius:5px;border-top-right-radius:0px;border-top-left-radius:0px;width:250px;border:1px solid black;border-top:none">選擇天數與間數</h3>
				<div style="margin-top: 85px">
				<span style="font-family: DFKai-sb">客房間數:</span>
				<select name="rooms" id="rooms" class="custom-select" style="text-align:center;font-size:15px;width:85px">
				<option value="1" selected = "selected">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				</select><span style="font-family: DFKai-sb">間</span>	<br>
				</div>	
					
				<div style="margin-top: 30px">
				<span style="font-family: DFKai-sb">入住天數:</span>
				<select name="stay" id="slc" class="custom-select" style="text-align:center;font-size:15px;width:85px">
				<option value="1" selected = "selected">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				</select><span style="font-family: DFKai-sb">晚</span>
				</div>

				
				<br>
				<input id="date" type="hidden" name="date"> <input type="submit" style="height:50px;background-color:#FF8F59;border-radius:10px;color:black;width:100%;font-size:22px;font-family: DFKai-sb;margin-top:30px;border:2px solid black;margin-left:14px"
					value="選擇房型      >>">
			</form>
		</div>
		<div>

		</div>

	</section>

	<jsp:include page="footer.jsp" />

	<script src="<c:url value="/js/booking_room.js"/>"></script>


</body>
</html>