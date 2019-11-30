<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="/css/adminIndex.css"/>">
<title>後台管理</title>  
      
</head>
<body id="page-top">

<jsp:include page="admin_header.jsp" />

<!-- Content -->
<div class="container" style="margin-top:10px;margin-bottom:120px">

 <content>
  <div class="overview" style="">
   <div class="date">
          <p>2019/6/17 <i class="fas fa-caret-right" style="color:#000"></i> 2019/11/29</p>
   </div>
  </div>
  
  <!-- overview -->
  <div class="overviewBox">
             <div class="n3">
                 <h2><i class="fas fa-hand-holding-usd"></i>TOTAL REVENUE</h2>
                 <p style="color:#7ED321">${roomTotalIncome+productTotalIncome}</p>
             </div>

             <div class="n3 sub">
                 <h2><i class="fas fa-boxes"></i>當日入場人數</h2>
                 <p style="color:#D0021B">${arrival}</p>

             </div>

             <div class="n3 sub">
                 <h2><i class="fas fa-money-bill-wave"></i>NET INCOME</h2>
                 <p style="color:#4A90E2">41,880</p>
             </div>
         </div>
         
         <!-- activity -->
         <div class="activity" style="margin-top: 30px;">
             <div class="n1">
                 <h2>Activity</h2>
                 <div id="chart"></div>
             </div>
         </div>

         <!-- panel -->
         <div class="n2">
            <!-- panel left -->
                <div class="panel right">
                <h2>The Less Stock Products</h2>
                <div class="list">
                <c:forEach var="pb" items="${pb}">
                    <div class="item">
                        <div class="pic">
       
                            <img height="100%"  src="<c:url value='/ProductPicture/${pb.productId}'/>" />
     </div>
                        <div class="info">
                            <h3 class="prdouctName">${pb.productName}</h3>
                            <span><i class="fas fa-id-card" style="font-size:14px"></i>${pb.productId}</span> 
                            <span><i class="fas fa-dollar-sign" style="font-size:14px"></i>${pb.unitPrice}</span>                                    
                        </div>
                        <div class="total">
                            <p >Stock</p>
                            <div align="left">                      
                            <b>${pb.stock}</b>
                            </div>
                        </div>
                    </div>            
                        </c:forEach>
                    </div>
                </div>

         
            <!-- panel right -->
          
            <div class="panel right">
                <h2>Latest Orders</h2>
                <div class="list">
                <c:forEach var="o" items="${orders}">
                    <div class="item">
                        <div class="pic">
                            <img style="height:100%;width:200px" src="room/${o.room.room_id}"></div>
                        <div class="info">
                            <h3>${o.room.room_type}*${o.rooms}</h3>
                            <span><i class="fas fa-clock"></i>${o.check_in_time}
                            </span>
                             <span><i class="fas fa-clock"></i>${o.check_out_time}
                            </span>
                            <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>${o.order_name}</span>
                        </div>
                        <div class="total">
                            <p>Toatal</p>
                            <div align="left">                   
                            <b>${o.total}</b>
                             </div>
                        </div>
                    </div>
                    </c:forEach>
                    </div>
                   
<!--                     <div class="item"> -->
<!--                         <div class="pic"> -->
<!--                             <img src="https://upload.cc/i1/2018/06/18/hOEJGW.png"></div> -->
<!--                         <div class="info"> -->
<!--                             <h3>Cowboy Jacket</h3> -->
<!--                             <span><i class="fas fa-clock"></i>2018/6/13 13:42</span> -->
<!--                             <span><i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Bangtan -->
<!--                                 Boys</span> -->
<!--                         </div> -->
<!--                         <div class="total"> -->
<!--                             <p>Toatal</p><b>3,200</b> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                     <div class="item" style="border-bottom: none"> -->
<!--                         <div class="pic"> -->
<!--                             <img src="https://upload.cc/i1/2018/06/18/3T7qFR.png"></div> -->
<!--                         <div class="info"> -->
<!--                             <h3>Coach Coat</h3> -->
<!--                             <span><i class="fas fa-clock"></i>2018/6/13 13:42</span> -->
<!--                             <span> -->
<!--                                 <i class="fas fa-male" style="font-size:20px;margin-left:4px;"></i>Super -->
<!--                                 Junior</span> -->
<!--                         </div> -->
<!--                         <div class="total"> -->
<!--                             <p>Total</p><b>3,200</b> -->
<!--                         </div> -->
<!--                     </div> -->
                </div>
        </div>   
        </div> 
            <!-- panel right -->

 </content>
</div>


<jsp:include page="admin_footer.jsp" />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
google.charts.load('current', { 'packages': ['corechart'] });
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Month', '活動數', '平均參與人數'],
        ['六月', 5, 22],
        ['七月', 4, 32],
        ['八月', 3, 26],
        ['九月', 4, 21],
        ['十月', 6, 19],
        ['十一月', 6,29]
    ]);

    var options = {
        title: '',
        height: 346,
        legend: { position: 'bottom' }
    };

    var chart = new google.visualization.LineChart(document.getElementById('chart'));

    chart.draw(data, options);
}
</script>
</body>
</html>