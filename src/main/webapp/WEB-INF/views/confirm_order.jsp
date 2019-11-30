<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫訂房資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->
	<div style="height:100vh;background-color:black">
	<div class="row" style="padding:0 0 10px 0 ;background-color:white;border:3px solid #5B5B5B;margin:120px 1px 0 1px">
		<div style="height:150px;width:100%;background-color:#3C3C3C;text-align:center;"><img style="height:150px;width:150px;" src="images/icons/logo3.png"></div>
		<div class="col-md-7" style="margin:5px 0 5px 0;height: 380px; background-color: #DDDDDD;border:2px solid black;border-radius:5px">

			<img
				style="margin: 5px 5px 5px 5px; border: 2px solid black; border-radius: 10px"
				src="room/${room.room_id}" alt="" title="" height="220px" width="835px">
			<div style="padding: 5px 10px">
				<span style="font-weight: bold;">訂房日期:<span
					style="margin-left: 320px">${date}</span></span><br> <span
					style="font-weight: bold;">入住天數:<span
					style="margin-left: 350px">${stay}</span></span><br> <span
					style="font-weight: bold;">客房數:<span
					style="margin-left: 360px">${rooms} 間</span></span>
			</div>
			<div style="margin-left: 280px; margin-bottom: 0px;">
				<button type="submit" class="btn btn-primary"
					onclick="location.href='booking_room'"
					style="background-color: #66B3FF; border: 2px solid black;height:50px;width:300px;">重新選擇日期</button>
			
			<span style="margin-left: 90px;color:red;">TWD : ${total} 元整</span>
					
			</div>
			
		</div>
		
		<c:choose>
		<c:when test="${sessionScope.member ==null }">
		<div class="col-md-5" style="border:2px solid black;border-radius:5px;margin:5px 0 5px 0">
		
			<form:form modelAttribute="room_order" method="POST" action="pay">
			
			<form:input type="hidden" path="room_id" value="${room.room_id}" />
			<form:input type="hidden" path="total"  value="${total}" />
			<input type="hidden" name="stay" value="${stay}">
				<div class="form-group" style="margin-top:20px">
					<label style="float:left" for="inputname">姓名 <span style="color: red">* </span></label>
					<form:input type="text" class="form-control col-md-6" style="float:left" id="inputname" path="order_name"
						placeholder="請輸入姓名" /> <input style="margin-left:30px"  type="radio" name="sex"
						value="male" style="margin-left: 15px">Mr<input style="margin-left:30px"
						type="radio" name="sex" value="female">Ms
				</div>



				<div class="form-group">
					<label for="inputphone">手機 <span style="color: red">*</span></label>
					<form:input type="text" class="form-control col-md-12" id="inputphone" path="order_phone"
						placeholder="請輸入電話號碼" />
										<label for="inputemail">E-mail <span style="color: red">*</span></label>
					<form:input type="text" class="form-control col-md-12" id="inputemail" path="order_email"
						placeholder="請輸入電子郵件" />
						
					<label for="inputemail">備註 </label>
					<form:input type="text" class="form-control col-md-12" id="inputremark" path="remark"
						placeholder="如有需求,可輸入備註" />
				</div>

				<form:input type="hidden" path="check_in_time" value="${date}" />
				<form:input type="hidden" path="check_out_time" value="${stay}" />
				<form:input type="hidden" path="rooms" value="${rooms}" />
				<span>繳款方式 : 信用卡</span>
				<button type="submit" class="btn btn-primary"
					style="background-color: #66B3FF; border: 2px solid black;width:100%;height:50px">前往預訂</button>
			</form:form>
			
		</div>
		
		</c:when>

<c:otherwise>
				<div class="col-md-5" style="margin-top: 20px;">
		
			<form:form modelAttribute="room_order" method="POST" action="pay">
			
			<form:input type="hidden" path="room_id" value="${room.room_id}" />
			<form:input type="hidden" path="total"  value="${total}" />
			<input type="hidden" name="stay" value="${stay}">
				<div class="form-group" style="margin-top:20px">
					<label style="float:left" for="inputname">姓名 <span style="color: red">* </span></label>
					<form:input type="text" class="form-control col-md-6" style="float:left" id="inputname" path="order_name"
						value="${sessionScope.member.memberName}"/> <input style="margin-left:30px"  type="radio" name="sex"
						value="male" style="margin-left: 15px">Mr<input style="margin-left:30px"
						type="radio" name="sex" value="female">Ms
				</div>



				<div class="form-group">
					<label for="inputphone">手機 <span style="color: red">*</span></label>
					<form:input type="text" class="form-control col-md-12" id="inputphone" path="order_phone"
						value="${sessionScope.member.memberPhone}" />
										<label for="inputemail">E-mail <span style="color: red">*</span></label>
					<form:input type="text" class="form-control col-md-12" id="inputemail" path="order_email"
						value="${sessionScope.member.memberEmail}" />
						
					<label for="inputemail">備註 </label>
					<form:input type="text" class="form-control col-md-12" id="inputremark" path="remark"
						placeholder="如有需求,可輸入備註" />
				</div>

				<form:input type="hidden" path="check_in_time" value="${date}" />
				<form:input type="hidden" path="check_out_time" value="${stay}" />
				<form:input type="hidden" path="rooms" value="${rooms}" />
				<span>繳款方式 : 信用卡</span>
				<button type="submit" class="btn btn-primary"
					style="background-color: #66B3FF; border: 2px solid black;width:100%;height:50px">前往預訂</button>
			</form:form>
			
		</div>
		
		</c:otherwise>
		</c:choose>
	</div>
</div>

	<jsp:include page="footer.jsp" />




</body>
</html>