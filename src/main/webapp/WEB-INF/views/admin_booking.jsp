<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>

<style>

* {
	padding: 0%;
	margin: 0%;
}

.calendar {
	overflow: hidden;
	width: 350px;
	height: 380px;
	background-color: 	#DDDDDD;
	box-shadow: 0px 1px 1px rgba(0, 0, 0, .1);
	margin: 0;
	text-align: center;
	color: #003C9D;
	border:2px solid black;

	font-size:20px;
	
	padding:20px;

	margin-right:10px;
	margin-left:5%;
	float:left;
	
}


.calendar1 {
	width: 300px;
	margin: 5px 5px;
	color: #003C9D;
	text-align: left;

	font-size:20px;

	float:left;
	border:none;
	display:block
}

.calendar11 {
	width: 300px;
	height: 300px;
	margin: 5px auto;
	color: #003C9D;
	text-align: left;
	padding: 20px auto;
	font-size:20px;
	padding:20px;
	float:left;
	border:none;
	display:block;
}

.calendar2 {
	width: 700px;
	heiget:200px;
	margin: 0 auto;
	color: #003C9D;
	text-align: center;
	padding: 30px auto;
	font-size:30px;
	border:none;
}

.title {
	height: 1px;
	position: relative;
	text-align: center;
}

#calendar-title {
	font-size: 20px;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	
}

#calendar-year {
	font-size: 15px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: normal;
	color:black;
}

#pre {
	position: absolute;
	top: 0px;
	left: 0px;
	

}

#next {
	position: absolute;
	top: 0px;
	right: 0px;


}

a {
    text-decoration:none;
}



.body-list ul {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
	width: 100%;
	box-sizing: border-box;
}

.body-list ul li {
	list-style: none;
	display: block;
	width: 14.28%;
	float: left;
	height: 36px;
	line-height: 36px;
	box-sizing: border-box;
	text-align: center;
	font-size: 20px;
	margin:5px auto;
	

}

.pink {
	color: black;
	font-size:15px;
}

.lightgrey {
	color: white;
	pointer-events: none;
}

.lightgrey ul li  {

background-color:	#DDDDDD;
color:black;
}

.darkgrey ul li{

font-family:cursive;

}

.darkgrey {
	color: black;
}

.box {
	border: 1px solid #003C9D;
	background: #DDDDDD;
	color: black;
}

.button {
	display: inline-block;
	font-family: 微軟正黑體;
	background-color: #DDDDDD;
	width: 100px;
	color: black;
	text-align: center;
	height: 40px;
	font-size: 18px;
	opacity: 0.7;
	font-weight: bold;
	border-radius: 5px;
	padding: 10px 1em;
	margin: 5px 10px;
	 border: 2px solid blue;
}

.button span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.button span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.button:hover span {
	padding-right: 25px;
}

.button:hover span:after {
	opacity: 1;
	right: 0;
}

.button:hover {
	background-color: #77DDFF;
	color: black;
}

.button:active {
	background-color: #77DDFF;
}

.button:focus {
	border-style: solid;
	border-color: #03a9f4;
	background-color: #77DDFF;
	box-shadow: 0 0 15px #77DDFF;
	color: black;
}

.li {
	display: inline-block;
	font-family: 微軟正黑體;

}

.li span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.li span:after {
	content: '»';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.li:hover span {
	padding-right: 25px;
}

.li:hover span:after {
	opacity: 1;
	right: 0;
}

.li:hover {
	color: #003C9D;
	cursor: pointer; 
}





.add{

	border-style: solid;
	border-color: #03a9f4;
	background-color: #77DDFF;
	
	color: black;

}

.remove{
		
background-color: white;

}

#days li {
	outline: solid 1px black;
}



form {
	float: left;
}

.input2{
	margin:3px 0 ;
	height:50px;
	width:200px;
	font-size:15px;
	font-family:微軟正黑體;
	font-weight:bold;
	            background-color:black;
			opacity:0.7;
	color:hotpink;
	border-radius:25px;
}

select{
width:200px;
font-size:28px;
height:30px;
border-radius:25px;
background-color:#DDDDDD;
color:black;
padding: 0 0 0 25%;
}



select::-ms-expand { display: none; }

.tension{
color:red;
}

.Ample{
color:blue;
}

</style>
</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	
	
	<div id="today_status" style="height:590px"></div>
	
	<div class="calendar" style="border:1px solid #003C9D;border-radius:5px;margin-top:50px">

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

		<div class="calendar1" style="margin-top:50px">
			選擇人數: <select id="slc" class="text" style="text-align: center">

	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select>
	<div class="calendar11" id="time">請先選擇日期人數</div>
		</div>
		
		
		

		
	<jsp:include page="admin_footer.jsp" />
	
		<script src="<c:url value="/js/ad_booking.js"/>"></script>
</body>
</html>