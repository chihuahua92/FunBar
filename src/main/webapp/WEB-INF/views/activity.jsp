<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Activity</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
<style>
.lead {
	font-family: 微軟正黑體;
}

.ti {
	font-family:微軟正黑體;
	 }

.pic {
	height: 40px;
	width: 40px;
}
.day{
	height: 20px;
	width: 20px;
}
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
    
<script>
	document.addEventListener("DOMContentLoaded", function() {
		setClock(),hidden(),stopTime();
	});
	
	
	function hoho(){
	
	var aaa = $("#test").val();
	
	console.log(aaa);
	
	if(aaa=='123'){
		swal({
		    title: '你已報名過此活動!!!',
		    text: '2秒後自動關閉',
		    timer: 3000
		}).then(
		    function () {},
		    // handling the promise rejection
		    function (dismiss) {
		        if (dismiss === 'timer') {
		            console.log('I was closed by the timer')
		        }
		    }
		)
	}
	
	};

	function setClock() {
		var targetTime = "${activity.eventDate}";
		var today = new Date();
		var targetTimeArray = targetTime.split("-");
		var dt1 = new Date(targetTimeArray[0], targetTimeArray[1] - 1,
				targetTimeArray[2]);

		var time = (dt1.getTime() - today.getTime());

		var d = Math.floor(time / (1000 * 60 * 60 * 24));
		var h = Math.floor(time / ((1000 * 60 * 60)) % 24);
		var m = Math.floor(time / ((1000 * 60)) % 60);
		var s = Math.floor(time / 1000) % 60;

		var d1 = parseInt(d / 10);
		var d2 = d % 10;
		var h1 = parseInt(h / 10);
		var h2 = h % 10;
		var m1 = parseInt(m / 10);
		var m2 = m % 10;
		var s1 = parseInt(s / 10);
		var s2 = s % 10;

		document.getElementById("picD1").src = "${pageContext.request.contextPath}/activityimages/"
				+ d1 + ".png";
		document.getElementById("picD2").src = "${pageContext.request.contextPath}/activityimages/"
				+ d2 + ".png";
		document.getElementById("picH1").src = "${pageContext.request.contextPath}/activityimages/"
				+ h1 + ".png";
		document.getElementById("picH2").src = "${pageContext.request.contextPath}/activityimages/"
				+ h2 + ".png";
		document.getElementById("picM1").src = "${pageContext.request.contextPath}/activityimages/"
				+ m1 + ".png";
		document.getElementById("picM2").src = "${pageContext.request.contextPath}/activityimages/"
				+ m2 + ".png";
		document.getElementById("picS1").src = "${pageContext.request.contextPath}/activityimages/"
				+ s1 + ".png";
		document.getElementById("picS2").src = "${pageContext.request.contextPath}/activityimages/"
				+ s2 + ".png";

	}
	
	
	function hidden() {
		var theTime = "${activity.eventDate}";
		var theday = new Date();
		var theTimeArray = theTime.split("-");
		var day = new Date(theTimeArray[0], theTimeArray[1] - 1,
				theTimeArray[2]);

		if (day.getTime() <= theday.getTime()) {
			document.getElementById("signup").disabled=true;
			document.getElementById("picD1").style.display = "none";
			document.getElementById("picD2").style.display = "none";
			document.getElementById("picH1").style.display = "none";
			document.getElementById("picH2").style.display = "none";
			document.getElementById("picM1").style.display = "none";
			document.getElementById("picM2").style.display = "none";
			document.getElementById("picS1").style.display = "none";
			document.getElementById("picS2").style.display = "none";
			document.getElementById("pic").style.display = "none";
		} else {
			document.getElementById("exp").style.display = 'none';
			var time = setInterval(function(){ setClock() }, 1000);
			function stopTime() {
			    clearInterval(time);
			}
		}
	}
</script>

</head>

<body onload="hoho()">
	<jsp:include page="header.jsp" />

	<div class="container" style="margin-top: 150px; width: 60%">
		<img class="img-fluid rounded"
			src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>"><br>
		<br>


		<div id="pic" style="min-height: 40px">
			<img class="pic" alt="" id="picD1" /><img class="pic" alt=""id="picD2" />
			<img class="day" src="${pageContext.request.contextPath}/activityimages/day.png" />
			<img class="pic" alt="" id="picH1" /><img class="pic" alt="" id="picH2" />
			<img class="day" src="${pageContext.request.contextPath}/activityimages/hour.png" />
			<img class="pic" alt="" id="picM1" /><img class="pic" alt="" id="picM2" />
			<img class="day" src="${pageContext.request.contextPath}/activityimages/minute.png" />
			<img class="pic" alt="" id="picS1" /><img class="pic" alt="" id="picS2" />
			<img class="day" src="${pageContext.request.contextPath}/activityimages/second.png" />
		</div>
		<p class="ti" style="font-size:2em" id="exp">活動已過期</p>

		<hr>
		<p class="ti"><img src="${pageContext.request.contextPath}/activityimages/activity.PNG">活動名稱</p>
		<p class="lead" style="color:rgba(58, 26, 11, 0.877)">${activity.eventName}</p>
		<br>

		<p class="ti"><img src="${pageContext.request.contextPath}/activityimages/date.PNG">活動時間</p>
		<p  class="lead">${activity.eventDate}</p><br>

		<p class="ti"><img src="${pageContext.request.contextPath}/activityimages/location.PNG">活動地點</p>
		<p class="lead">${activity.address}</p>
		<hr>
		<br>

		<blockquote class="blockquote">
			<p class="mb-0"></p>
			<footer class="blockquote-footer">
				<cite title="Source Title">${activity.introduction}</cite>
			</footer>
		</blockquote>

		<br>
		<p class="lead">活動介紹</p>
		<hr>
		<p class="ti">${activity.activities}</p>
		<br> <br>

		<p class="lead">活動資訊</p>
		<hr>
		<p class="ti">${activity.information}</p>

		<hr>
		<br>
		<p class="lead">活動地圖</p>
		<hr>
		<iframe width='100%' height='300' style="border-radius: 50px"
			src='https://maps.google.com.tw/maps?f=q&hl=zh-TW&geocode=&q=${activity.address}&z=16&output=embed&t='>
		</iframe>

		<div style="width:20%;margin:25px 20% 15px 85%;">
			
			
		
			<a
				 href="<spring:url value='activityRegistration?id=${activity.activityId}&memberId=${member.memberId}'/>">
				<button id="signup" type="button" class="btn btn-primary active">我要報名</button>
			</a>

		</div>

	</div>
	
	<input type="hidden" id="test" value="${test}">

	<jsp:include page="footer.jsp" />
</body>

</html>