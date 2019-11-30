<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>後台管理</title>

  <script src="/FunBar/ad_vendor/jquery/jquery.min.js"></script>

<style>
 html {
            height: 100%;
        }

body {
            background-image:url(images/check_in.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
           	
            
 
            
        }
        
 #bg{
 
position: absolute;
left:18%;
right: 0;
top: 0;
bottom: 0;
width: 82%;
height: 100%;
margin-top:55px;

background: linear-gradient(-160deg, rgba(255,255,255,.6) 0%,rgba(255,255,255,.7) 50%,rgba(255,255,255,.6) 100%) no-repeat;

 
 }

</style>
</head>
<body id="page-top">
	<jsp:include page="admin_header.jsp" />
	<div id="bg">
	
	<div class="row container col-md-9" style="height:500px;margin-left:20px;float:left;margin-top:20px;width:750px">
	
		<div class="row container col-md-12">
	<c:forEach var="r" items="${allroom}" begin="0" step="1" varStatus="i">
	<div style="float:left">
		
<c:choose>
	
   <c:when test="${r.status =='1' }">
   <button class="room" data-room="${i.index}" value="${r.order_id}" data-toggle="modal" data-target="#myModalF" type="button"  style="width:130px;height:60px;border:1px solid #79FF79;background-color:white;margin-right:5px;border-radius:5px">${r.room}<br>${r.room_number}</button>
   </c:when>
   
   <c:otherwise>
   <button class="room" data-room="${i.index}"value="${r.order_id}" data-toggle="modal" data-target="#myModalF" type="button"  style="width:130px;height:60px;border:1px solid black;margin-right:5px;background-color:#6C6C6C;border-radius:5px">${r.room}<br>${r.room_number}</button> 
   </c:otherwise>
  
</c:choose>
		
		
	<input type="hidden" class="roomname" value="${r.order_name}">
	<input type="hidden" class="roomnumber" value="${r.room_number}">

	</div>
	</c:forEach>
	
	
	</div>
	</div>
	
	
	
	
	<div class="row" style="margin-top:20px;">
	<c:forEach var="o" items="${orders}" begin="0" step="1" varStatus="i">
	
	<c:choose>
	
   <c:when test="${o.check_in == o.rooms}">
    <button class="bt" data-order="${i.index}" data-toggle="modal" data-target="#myModal" type="button" disabled="disabled" value="${o.order_id}"style="border:1px solid black;color:#000079; height:30px;width:300px;margin-bottom:2px;margin-right:10px;border-radius:10px;background-color:#53FF53;text-align:left;">${o.room.room_type}-${o.order_name}-${o.rooms}間-${o.room_number}</button>
	</c:when>
	
	
	
	 <c:otherwise>
		<button class="bt" data-order="${i.index}" data-toggle="modal" data-target="#myModal" type="button" value="${o.order_id}"style="border:1px solid #FF9797;background-color:white ;border-radius:10px;height:30px;width:300px;margin-bottom:2px;margin-right:10px;text-align:left;">${o.room.room_type}-${o.order_name}-${o.rooms}間</button>
	 </c:otherwise>
	</c:choose>
	
	<input type="hidden" class="on" value="${o.order_name}">
	</c:forEach>
	
	<button style="border:1px solid black;border-radius:10px; height:30px;width:300px;margin-top:100px;margin-right:10px;" type="button" onclick="javascript:location.href='http://localhost:8080/FunBar/clear_all_room'">清空所有房間</button>
	</div>
	
	
</div>
	
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:350px;">
        <div class="modal-content" style="background-color:#FCFCFC;border:1px solid #02DF82">
            <div class="modal-header" style="text-align:center;">
                <h4 class="modal-title" id="myModalLabel"> Check in</h4>
            </div>
            <form id="form_data" method="post" action="update_room_status">
            <div class="modal-body">
 
                
                              <table style="text-align: center;margin:0 auto">
						<tr><td>訂房編號:</td><td><input class="od" type="text" name="order_id" ></td></tr>
						<tr><td>入住人:</td><td><input class="name" type="text" name="name" ></td></tr>
						<tr><td>入住房號:</td><td><input type="text" id="room_number" name="room_number"/></td></tr>
						</table>
           
           
            </div>
            <div class="modal-footer" style="text-align: center">
            	<button type="submit"  class="btn btn-primary" style="background-color:#FCFCFC;border:1px solid #02DF82;color:black">入住</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
                
            </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


<div class="modal fade" id="myModalF" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:250px;">
        <div class="modal-content" style="background-color:#FCFCFC;border:1px solid red">
            <div class="modal-header" style="text-align:center;">
                <h4 class="modal-title" id="myModalLabel">客房狀況</h4>
            </div>
            <form id="form_data" method="post" action="check_out">
            <div class="modal-body">
                 <input type="hidden" id="order_id" class="rnn" name="order_id"/><br>
               	 <input type="hidden" id="room_name" class="rnmm" name="room_name"/>
               	 <input type="hidden" id="room_number" class="rnmb" name="room_number"/>
               
               
               
               <table style="text-align: center;margin:0 auto">
						<tr><td>訂房編號:</td><td class="rn"></td></tr>
						<tr><td>入住人:</td><td class="rnm"></td></tr>
						
						</table>
            
            </div>
            <div class="modal-footer" style="margin:0 auto">
                <button type="submit" class="btn btn-primary" style="background-color:#FCFCFC;border:1px solid red;color:black ">退房</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
               
            </div>
            </form>
        </div>/.modal-content
    </div>/.modal
</div>

<script>

$(".bt").click(function(){

		let index = $(this).data("order");
	
		let od = $(".bt").eq(index).val();
		let name = $(".on").eq(index).val();

		
		
		$(".od").val(od);
		$(".name").val(name);


		
		

})

$(".room").click(function(){

		let index = $(this).data("room");


		let room = $(".room").eq(index).val();

		let roomname = $(".roomname").eq(index).val();

		let roomnumber = $(".roomnumber").eq(index).val();

		

		console.log(room);

		$(".rnn").val(room);

		$(".rnmm").val(roomname);

		$(".rnmb").val(roomnumber);
		
		$(".rn").text(room);

		$(".rnm").text(roomname);

		
	
})





</script>


  	<script type="text/javascript"
		src="<c:url value='/ad_vendor/animsition/js/animsition.min.js' />"></script>
   <!-- Bootstrap core JavaScript-->
   
   
  <script src="<c:url value='/ad_vendor/jquery/jquery.min.js' />"></script>


  <script src="<c:url value='/ad_vendor/bootstrap/js/bootstrap.bundle.min.js' />"></script>
  <script src="<c:url value='/ad_vendor/jquery-easing/jquery.easing.min.js' />"></script>

  <!-- Page level plugin JavaScript-->
  <script src="<c:url value='/ad_vendor/chart.js/Chart.min.js' />"></script>
  <script src="<c:url value='/ad_vendor/datatables/jquery.dataTables.js' />"></script>
  <script src="<c url value='/ad_vendor/datatables/dataTables.bootstrap4.js' />"></script>

  <!-- Custom scripts for all pages-->
  <script src="<c:url value='/ad_js/sb-admin.min.js' />"></script>

  <!-- Demo scripts for this page-->
  <script src="<c:url value='/ad_js/demo/datatables-demo.js' />"></script>
  <script src="<c url value='/ad_js/demo/chart-area-demo.js' />"></script>
</body>
</html>