<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>
.top{
	height:100px;
	background-color:black;
}

</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	
<div style="margin:150px auto;width: 40%;height: 600px;">
	 <div class="top">
        <h2 style="margin-bottom:0px; font-size: 4em;color :white;font-family:Copperplate;
	font-weight:bold;font-style:italic;text-decoration:underline;text-align: center;">FunBar</h2>
        <h6 style="margin-top: 0px;text-align: center;color :white;font-family:Papyrus;font-size: 1em;">CHILL&CHEER</h6>
    </div>
    <div style="margin:50px auto;width:100px;height:35px ;border: 1px gray solid;border-radius:25px;">
    <p style="color:gray ;margin-top: 6px ;font-family: 微軟正黑體;font-size:1em; text-align: center;">感謝您的意見</p>
    </div>
    <div style="text-align: center;font-family: 微軟正黑體;margin:auto ;width: 500px;height: 350px;border: 1px gray solid;">
    <br><br>
    <p style="font-family: 微軟正黑體;font-size: 1.8em;color: rgb(22, 15, 1)">${member.memberName} 你好</p><br>
<%--     <p style="text-align: center;font-size: 1.5em;color: rgb(128, 128, 128)">${activity.eventName}</p> --%>
    <p style="font-family: 微軟正黑體;font-size: 1.5em;color: rgb(228, 121, 21);">謝謝你對此活動的建議，</p><br>
    <p style="font-family: 微軟正黑體;font-size: 1.2em;color: gray;">有你們的支持是我們辦活動的動力!!!</p><br>
    <br><br>
     <a href="${pageContext.request.contextPath}/getsiqnupActivity/${member.memberId}">
				<button type="button" class="btn btn-outline-secondary">我報名的活動</button>
			</a>
   
    </div>
</div>
	
	
	<jsp:include page="footer.jsp" />
</body>
</html>