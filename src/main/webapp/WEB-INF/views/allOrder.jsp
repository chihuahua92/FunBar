<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有訂房</title>
<style>

.qb{
width:140px;
height:30px;
}

.button:active {
	border-style:solid;
	border-color:#0080FF;
	background-color:#0080FF;
	color:black;
}
</style>

<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
		
<script>
function del() {var msg ="是否刪除";if (confirm(msg)==true){return true;}else{return false;}}
</script>



</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	<div style="padding: 10px ;border:1px solid black;float:left;width:1200px">
	<table id="ch" class="table table-striped" style="text-align: center" >
<thead><tr>
<th>訂單編號<th>訂位人<th>入住日期<th>退房日期<th>手機<th>付款狀態<th>取消訂房
</tr></thead>
<tbody>
<c:forEach var="o" items="${orders}">
<tr>
<td>${o.order_id}</td>
<td>${o.order_name}</td>
<td>${o.check_in_time}</td>
<td>${o.check_out_time}</td>
<td>${o.order_phone}</td>
<td>${o.status}</td>
<td><a href="cancelOrder?id=${o.order_id}"><button class="button" type="button" onclick="return confirm('是否刪除');">取消訂房</button></a></td>
</tr>

 

</c:forEach>
</tbody>
</table>
</div>
<div style="width:150px;height:300px;text-align:center">
<span style="color:blue">日期:</span>
<br>
<input class="qb" id="ymd" type="text">
<br>
<button class="qb" id="D" type="button">查詢</button>
<span style="color:blue">手機:</span>
<br>
<input class="qb" id="tel" type="text">
<br><button class="qb" id="P" type="button">查詢</button>

</div>
	<jsp:include page="admin_footer.jsp" />
	
<script>

var url = "/FunBar/";

$("#D").click(function(){
	$.ajax({

			url:"http://localhost:8080" +url +"dateSearch",
			type:"POST",
			dataType:"JSON",
			data:{
					date:$("#ymd").val()

				},
			success:function(data){

				if(data.length == 0){

					console.log(11111);
							
					}else{

						console.log(data);
						let txt ="";
						txt +="<thead><tr><th>訂單編號<th>訂位人<th>入住日期<th>退房日期<th>手機<th>付款狀態<th>取消訂房</tr></thead><tbody>";
						for(let i=0;i<data.length;i++){
								txt += "<tr><td>"+data[i].order_id+"</td><td>"
								+data[i].order_name+"</td><td>"+data[i].check_in_time+"</td><td>"
								+data[i].check_out_time+"</td><td>"+data[i].order_phone+"</td><td>"
								+data[i].status+"</td><td>"
								+"<a href='cancelBooking?id="+data[i].booking_id+"'><button class='button' type='button'"+"onclick='return del()'"+">取消訂房</button></a></td>"
								+"</tr>";
							}
						txt += "</tbody></table>";
						
						$("#ch").html("");
						$("#ch").html(txt);
						}
					
				}



		
		})
		
});

$("#P").click(function(){
	$.ajax({

			url:"http://localhost:8080" +url +"phoneSearch",
			type:"POST",
			dataType:"JSON",
			data:{
					phone:$("#tel").val()

				},
			success:function(data){

				if(data.length == 0){
					console.log(data);
					}else{
						let txt ="";
						console.log(data);
						txt +="<thead><tr><th>訂單編號<th>訂位人<th>入住日期<th>退房日期<th>手機<th>付款狀態<th>取消訂房</tr></thead><tbody>";
						for(let i=0;i<data.length;i++){
								txt += "<tr><td>"+data[i].order_id+"</td><td>"
								+data[i].order_name+"</td><td>"+data[i].check_in_time+"</td><td>"
								+data[i].check_out_time+"</td><td>"+data[i].order_phone+"</td><td>"
								+data[i].status+"</td><td>"
								+"<a href='cancelBooking?id="+data[i].booking_id+"'><button class='button' type='button'"+"onclick='return del()'"+">取消訂房</button></a></td>"
								+"</tr>";
							}
						txt += "</tbody></table>";
						
						
						$("#ch").html(txt);

						}
					
				}



		
		})
		
});


</script>
</body>
</html>