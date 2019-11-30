<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<title>線上訂位</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
			<link href="<c:url value="/css/booking.css" />" rel="stylesheet">



</head>

<body>

	<jsp:include page="header.jsp" />

	<section class="animsition" style="margin-top: 120px;">
		<div  style=" background-image:url('images/booking.jpg');">
		<div class="calendar" style="border:1px solid orange;border-radius:5px;background-color:black;">

			選擇訂位日期:
			<div class="title">
				<h1 class="pink" id="calendar-title">Month</h1>
				<h2 class="pink" id="calendar-year">Year</h2>
				<a href="" id="pre">◀</a> <a href="" id="next">▶</a>
			</div>
			<div class="body">
				<div class="lightgrey body-list" style="margin-top:30px">
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
</div>
		<div style=" background-color:black">
		<div class="calendar1">
			選擇人數: <select id="slc" class="text">
				<option value="1">1位</option>
				<option value="2">2位</option>
				<option value="3">3位</option>
				<option value="4">4位</option>
				<option value="5">5位</option>
				<option value="6">6位</option>
				<option value="7">7位</option>
				<option value="8">8位</option>
				<option value="9">9位</option>
				<option value="10">10位</option>
				<option value="11">11位</option>
				<option value="12">12位</option>
			</select>
		</div>

		<div class="calendar1"id="time">請先選擇日期人數</div>
</div>
	</section>

	<jsp:include page="footer.jsp" />
	
	<script src="<c:url value="/js/booking.js"/>"></script>


		</body> </html>