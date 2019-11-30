<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>填寫訂位資料</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>

	<jsp:include page="header.jsp" />

	<!-- Content 區塊 -->

	<div class="page row">
		<div class="col-md-4" style="height: 350px; background-color: #DDDDDD">

			<img
				style="margin: 5px 5px 5px 5px; border: 2px solid red; border-radius: 10px"
				src="images/mini_img.jpg" alt="" title="" height="190px">
			<div style="padding: 5px 10px">
				<span style="font-weight: bold;">訂位日期:<span
					style="margin-left: 100px">${date}</span></span><br> <span
					style="font-weight: bold;">訂位時間:<span
					style="margin-left: 120px">${time}</span></span><br> <span
					style="font-weight: bold;">訂位人數:<span
					style="margin-left: 135px">${people} 人</span></span>
			</div>
			<div style="text-align: center; margin-bottom: 0px">
				<button type="submit" class="btn btn-primary"
					onclick="location.href='booking'"
					style="background-color: orange; border: 1px solid red;">重新選擇日期及時段</button>
			</div>
		</div>

		<div class="col-md-8">
			<form method="POST" action="ad_addReservations">
				<div class="form-group">
					<label for="inputname">Name <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-4" id="inputname" name="name"
						placeholder="請輸入姓名"> <input type="radio" name="sex"
						value="male" style="margin-left: 15px">Mr<input
						type="radio" name="sex" value="female">Ms
				</div>



				<div class="form-group">
					<label for="inputphone">Phone <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-4" id="inputphone" name="phone"
						placeholder="請輸入電話號碼">
										<label for="inputemail">E-mail <span style="color: red">*</span></label>
					<input type="text" class="form-control col-md-4" id="inputemail" name="email"
						placeholder="請輸入電子郵件">
				</div>


				<div class="form-group">
					<label for="inputremark">Remark</label> <input type="text"
						class="form-control col-md-8" id="inputremark" name="remark"
						placeholder="如有需要請輸入備註">
				</div>
				<input type="hidden" name="date" value="${date}" />
				<input type="hidden" name="time" value="${time}" />
				<input type="hidden" name="people" value="${people}" />
				<button type="submit" class="btn btn-primary"
					style="background-color: orange; border: 1px solid red">Complete
					Reservation</button>
			</form>
		</div>
	</div>


	<jsp:include page="footer.jsp" />




</body>
</html>