<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>所有訂位</title>
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
<th>訂單編號<th>訂位人<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位<th>入場狀況
</tr></thead>
<tbody>
<c:forEach var="b" items="${All}">
<tr>
<td>${b.booking_id}</td>
<td>${b.name}</td>
<td>${b.date}</td>
<td>${b.time}</td>
<td>${b.people}</td>
<td>${b.phone}</td>
<td><a href="cancelBooking?id=${b.booking_id}&date=${b.date}&phone=${b.phone}"><button class="button" type="button" onclick="return confirm('是否刪除');">取消訂位</button></a></td>
<td><a href="pullSingle?id=${b.booking_id}&date=${b.date}&phone=${b.phone}"><button class="button" type="button">更改訂位</button></a></td>
<c:if test="${b.status!=1}">
<td><a href="arrival?id=${b.booking_id}"><button class="button" type="button">入場</button></a></td>
</c:if>
<c:if test="${b.status ==1}">
<td><a href="arrival?id=${b.booking_id}"><button class="button" disabled="disabled" type="button">已入場</button></a></td>
</c:if>
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

<button class="qb" type="button" style="margin-top: 10px" onclick="javascript:location.href='allbooking'">所有訂位</button>

<button class="qb" type="button" style="margin-top: 10px" onclick="javascript:location.href='todaybooking'">當日訂位</button>
</div>
	<jsp:include page="admin_footer.jsp" />
	
<script>

var url = "/FunBar/";

$("#D").click(function(){
	$.ajax({

			url:"http://localhost:8080" +url +"dateQuery",
			type:"POST",
			dataType:"JSON",
			data:{
					date:$("#ymd").val()

				},
			success:function(data){

				if(data.length == 0){

					console.log(data);
							
					}else{

						let txt = "";
						console.log(data);
						txt +="<thead><tr><th>訂單編號<th>訂位人<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位</tr></thead><tbody>";
						for(let i=0;i<data.length;i++){
								txt += "<tr><td>"+data[i].booking_id+"</td><td>"
								+data[i].name+"</td><td>"
								+data[i].date+"</td><td>"+data[i].time+"</td><td>"
								+data[i].people+"</td><td>"+data[i].phone+"</td><td>"
								+"<a href='cancelBooking?id="+data[i].booking_id+"'><button class='button' type='button'"+"onclick='return del()'"+">取消訂位</button></a></td>"
								+"<td><a href='pullSingle?id="+data[i].booking_id+"'><button class='button' type='button'>更改訂位</button></a></td>"
								+"<td><a href='arrival?id="+data[i].booking_id+"'><button class='button' type='button'>入場</button></a></td>"
								+"</tr>";
								
							}
						txt += "</tbody></table>";
						
						
						$("#ch").html(txt);
						}
					
				}



		
		})
		
});

$("#P").click(function(){
	$.ajax({

			url:"http://localhost:8080" +url +"phoneQuery",
			type:"POST",
			dataType:"JSON",
			data:{
					phone:$("#tel").val()

				},
			success:function(data){

				if(data.length == 0){
					console.log(data);
					}else{

						let txt = "";
						console.log(data);
						txt +="<thead><tr><th>訂單編號<th>訂位人<th>訂位日期<th>訂位時間<th>訂位人數<th>手機<th>取消訂位<th>更改訂位</tr></thead><tbody>";
						for(let i=0;i<data.length;i++){
								txt += "<tr><td>"+data[i].booking_id+"</td><td>"
								+data[i].name+"</td><td>"
								+data[i].date+"</td><td>"+data[i].time+"</td><td>"
								+data[i].people+"</td><td>"+data[i].phone+"</td><td>"
								+"<a href='cancelBooking?id="+data[i].booking_id+"'><button class='button' type='button'"+"onclick='return del()'"+">取消訂位</button></a></td>"
								+"<td><a href='pullSingle?id="+data[i].booking_id+"'><button class='button' type='button'>更改訂位</button></a></td>"
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