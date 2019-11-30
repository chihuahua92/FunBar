<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>重設時段及人數</title>

<style>

.div{

height:480px;
width:500px;

margin:0 auto;
text-align:center;

border:2px solid #DDDDDD;

}

.time{

height:35px;
width:150px;

background-color:	#DDDDDD;
font-size:20px;
text-align:center;
border-radius:5px;
color:black;
    text-align: center;
    text-align-last: center;

}

.people{

height:35px;
width:150px;

background-color:	#DDDDDD;
font-size:20px;
text-align:center;
border-radius:5px;
color:black;
    text-align: center;
    text-align-last: center;
}

select{

margin:5px 0;

}



</style>

</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	
<div class="div">
<h2>重設時段及人數</h2>
<form method="post" action="${pageContext.request.contextPath}/reset_time_people_ok">


	<select class="time" name="time0" class="text">
	<option value="${alltime[0].time}" selected>${alltime[0].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people0" class="text">
		<option value="${alltime[0].people}" selected>${alltime[0].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time1" class="text">
	<option value="${alltime[1].time}" selected>${alltime[1].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people1" class="text">
		<option value="${alltime[1].people}" selected>${alltime[1].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time2" class="text">
	<option value="${alltime[2].time}" selected>${alltime[2].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people2" class="text">
		<option value="${alltime[2].people}" selected>${alltime[2].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time3" class="text">
	<option value="${alltime[3].time}" selected>${alltime[3].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people3" class="text">
		<option value="${alltime[3].people}" selected>${alltime[3].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time4" class="text">
	<option value="${alltime[4].time}" selected>${alltime[4].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people4" class="text">
		<option value="${alltime[4].people}" selected>${alltime[4].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time5" class="text">
	<option value="${alltime[5].time}" selected>${alltime[5].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people5" class="text">
		<option value="${alltime[5].people}" selected>${alltime[5].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time6" class="text">
	<option value="${alltime[6].time}" selected>${alltime[6].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people6" class="text">
		<option value="${alltime[6].people}" selected>${alltime[6].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time7" class="text">
	<option value="${alltime[7].time}" selected>${alltime[7].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people7" class="text">
		<option value="${alltime[7].people}" selected>${alltime[7].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
		<select class="time" name="time8" class="text">
	<option value="${alltime[8].time}" selected>${alltime[8].time}</option>
	<c:forEach var="i" begin="10" end="24" step="1">
	<option value="${i}:00">${i}:00</option>
	</c:forEach>
	</select>
		<select class="people" name="people8" class="text">
		<option value="${alltime[8].people}" selected>${alltime[8].people}位</option>
	<c:forEach var="i" begin="1" end="50" step="1">
	<option value="${i}">${i}位</option>
	</c:forEach>
	</select><br>
	
	<input style="margin-top:10px;width:300px;background-color:#5599FF;color:black" type="submit" value="確定" onclick="return confirm('時段及人數即將變更,是否確定');">
</form>
</div>
	
	<jsp:include page="admin_footer.jsp" />
</body>
</html>