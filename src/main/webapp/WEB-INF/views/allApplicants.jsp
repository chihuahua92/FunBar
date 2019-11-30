<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>報名名單</title>
<style>
 .container{
		font-family:微軟正黑體;
		margin: 100px auto 150px auto; width: 80%;
	}
</style>
</head>

<body>
<jsp:include page="admin_header.jsp" />
		
<div class="container" style="font-family:微軟正黑體; padding:15px">
    <h2>活動報名名單管理</h2>
    <hr>
    <img style="float:right; height:150px; width:300px" class="card-img-top" 
				src="${pageContext.request.contextPath}/ActivitygetPicture/${ac.activityId}"/>
				<br><br>
	<h4>活動名稱：</h4>
	<h4 style="color:rgba(97, 35, 6, 0.877)">${ac.eventName}</h4><br><br>
	
    <h5>報名者基本資料：</h5><br>
    <table class="table table-striped">
      <thead>
        <tr class="dark">
          <th>姓名</th>
          <th>性別</th>
          <th>Email</th>
          <th>連絡電話</th>
        </tr>
      </thead>
      <c:forEach var='al' varStatus='vs' items='${al}'>
        <tbody>
          <tr>
            <td style="width:150px">${al.applicantName}</td>
            <td style="width:100px">${al.gender} </td>
            <td style="width:100px">${al.applicantEmail}</td>
            <td >${al.applicantPhone}</td>

          </tr>
        </tbody>
      </c:forEach>
    </table>
	<a href="${pageContext.request.contextPath}/activityQuery?index=1">
    <button style="float:right;" type="button" class="btn btn-outline-secondary">返回</button></a>
  </div>
  


<jsp:include page="admin_footer.jsp" />
</body>
</html>