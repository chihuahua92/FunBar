<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>您的訂房資訊</title>
</head>
<body>

<jsp:include page="header.jsp" />


<section class="page animsition">
		<div class="calendar" >
		
		  <h2 style="width:200px;margin:0 auto">您的訂房</h2>
    <hr>
    
    
        <c:forEach var="o" items="${orders}">
    <div style="width:800px;height:150px;border:1px solid #FFF8D7;margin:0 auto;margin-bottom:20px;background-color:#FCFCFC">
    <table class="table table-dark table-hover" style="width:500px;align:left;float:left;background-color:#FCFCFC;margin-top:15px">
      <thead style="color:#EAC100">
        <tr>
          <th>訂房編號</th>
          <th>入住日期</th>
          <th>退房日期</th>
          <th>房型</th>
        </tr>
      </thead>
        <tbody>
          <tr>
            <td class="">${o.order_id}</td>
            <td class="">${o.check_in_time}</td>
            <td class="">${o.check_out_time}</td>
            <td class="">${o.room.room_type}</td>

          </tr>
        </tbody>
        
            </table>
            
            <img class="card-img-top" style="width:285px;height:149px;margin-left:10px;border:2px solid #EAC100" src="<c:url value='/room/${o.room.room_id}'/>">
           </div>
      </c:forEach>

		
		
		
			</div>
			
			</section>


<jsp:include page="footer.jsp" />
</body>
</html>