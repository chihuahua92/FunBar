<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<title>確認訂位</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	
<style>



#signup {
    width: 350px;
    margin: 0 auto 0 auto;
    padding: 20px;
    position: relative;
    background: #fff url(data:image/png;base64,iVBORw0K[...]CYII=);
    border: 1px solid #ccc;
    border-radius: 3px;  
}


#signup::after {
    content: "";
    position: absolute;
    bottom: -3px;
    left: 2px;
    right: 2px;
    top: 0;
    z-index: -1;
    background: #fff;
    border: 1px solid #ccc;         
}

#signup::after {
    left: 4px;
    right: 4px;
    bottom: -5px;
    z-index: -2;
    box-shadow: 0 8px 8px -5px rgba(0,0,0,.3);
}

#signup h1 {
    position: relative;
    font: italic 1em/3.5em 'trebuchet MS',Arial, Helvetica;
    color: #999;
    text-align: center;
    margin: 0 0 20px;
}

#signup h1::after{
    content:'';
    position: absolute;
    border: 1px solid rgba(0,0,0,.15);
    top: 10px;
    bottom: 10px;
    left: 0;
    right: 0;
}

#signup h1::after{
    top: 0;
    bottom: 0;
    left: 10px;
    right: 10px;
}

::-webkit-input-placeholder {
   color: #bbb;
}

:-moz-placeholder {
   color: #bbb;
}                       

.placeholder{
    color: #bbb; /* polyfill */
}       

#signup input{
    margin: 5px 0;
    padding: 15px;
    width: 100%;
    *width: 518px; /* IE7 and below */
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 3px; 
}

#signup input:focus{
        outline: 0;
        border-color: #aaa;
    box-shadow: 0 2px 1px rgba(0, 0, 0, .3) inset;
}       

#signup button{
    margin: 20px 0 0 0;
    padding: 15px 8px;
    cursor: pointer;
    border: 1px solid red;
    overflow: visible;
    color: #fff;
    font: bold  arial, helvetica;
    text-shadow: 0 -1px 0 rgba(0,0,0,.4);         
    background-color: orange;
    background-image: linear-gradient(top, rgba(255,255,255,.5), rgba(255,255,255,0)); 
    transition: background-color .2s ease-out;
    border-radius: 3px;
    box-shadow: 0 2px 1px rgba(0, 0, 0, .3),
                0 1px 0 rgba(255, 255, 255, .5) inset;                               
}

#signup button:hover{
    background-color: #7cbfff;
        border-color: #7cbfff;
}

#signup button:active{
    position: relative;
    top: 3px;
    text-shadow: none;
    box-shadow: 0 1px 0 rgba(255, 255, 255, .3) inset;
}

input{
	height:30px;
	text-align:center;

}

button{
	height:50px;
	width:150px;
}
</style>	
</head>

<body onload="go()">

	<!-- Header -->
	<jsp:include page="header.jsp" />



	
	<section class="animsition" style="background-color:#D0D0D0;margin-top:120px;">
	<div style="height:150px;width:100%;background-color:black;"></div>
	<div  style=" background-image:url('images/booking.jpg');">
		<form id="signup" method="post" action="addReservations" style="background-color:white;border:3px solid #FF5809">
    <h1>填寫訂位人資料</h1>
    
    
    <input name="date" type="text" value="${date}"  readonly="readonly">
    <input name="time" type="text" value="${time}"  readonly="readonly">
    <input name="people" type="text" value="${people}" readonly="readonly">
    
    <c:choose>
		<c:when test="${sessionScope.member ==null }">
    <input name="name" type="text" placeholder="姓名" required="required">
    <input name="phone" type="text" placeholder="連絡電話" required="required">
    <input name="email" type="text" placeholder="e-mail" required="required">
    <input name="remark" type="text" placeholder="備註">
    </c:when>
    
    <c:otherwise>
    
        <input name="name" type="text" value="${sessionScope.member.memberName}" required="required">
    <input name="phone" type="text" value="${sessionScope.member.memberPhone}" required="required">
    <input name="email" type="text" value="${sessionScope.member.memberEmail}" required="required">
    <input name="remark" type="text" placeholder="備註">
    
    </c:otherwise>
    </c:choose>
    <div style="text-align:center">
    <button type="button" style="width:130px"
					onclick="location.href='booking'">返回</button>               
    <button type="submit" style="width:130px;margin-botton:0px">預約</button>
    </div>
</form>
</div>
	</section>

	<!-- Footer -->
	<jsp:include page="footer.jsp" />

	<script>

function go() {
	$('html,body').animate({scrollTop:140},2000);
	}
</script>
	

</body>

</html>