<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="<c:url value='/vendor/slick/slick.css' />">
	<link rel="stylesheet" href="<c:url value='/vendor/slick/slick-theme.css' />">
	<link rel="stylesheet" href="<c:url value='/css/index_blog.css' />">
	<link rel="stylesheet" href="<c:url value="/css/hotProduct.css" />" >
</head>

<body class="animsition">

	<!-- Header -->
	<jsp:include page="header.jsp" />



	<!-- Slide1 輪播 -->
	<section class="section-slide">
		<div class="wrap-slick1">
			<div class="slick1">
				<div class="item-slick1 item1-slick1" style="background-image: url(images/slide1-01.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="fadeInDown">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;" data-appear="fadeInUp">
							Fun Bar
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="zoomIn">
							<!-- Button1 -->
<!-- 							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4"> -->
<!-- 								Look Menu -->
<!-- 							</a> -->
						</div>
					</div>
				</div>

				<div class="item-slick1 item2-slick1" style="background-image: url(images/slides-02.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15" data-appear="rollIn">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;"
							data-appear="lightSpeedIn">
							Fun Bar
						</h2>

						<div class="wrap-btn-slide1 animated visible-false" data-appear="slideInUp">
							<!-- Button1 -->
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div>
					</div>
				</div>

				<div class="item-slick1 item3-slick1" style="background-image: url(images/slide1-03.jpg);">
					<div class="wrap-content-slide1 sizefull flex-col-c-m p-l-15 p-r-15 p-t-150 p-b-170">
						<span class="caption1-slide1 txt1 t-center animated visible-false m-b-15"
							data-appear="rotateInDownLeft">
							Welcome to
						</span>

						<h2 class="caption2-slide1 tit1 t-center animated visible-false m-b-37" style="font-family: 'Sarina', cursive;"
							data-appear="rotateInUpRight">
							Fun Bar
						</h2>

						<!-- <div class="wrap-btn-slide1 animated visible-false" data-appear="rotateIn">
							Button1
							<a href="menu.html" class="btn1 flex-c-m size1 txt3 trans-0-4">
								Look Menu
							</a>
						</div> -->
					</div>
				</div>

			</div>

			<div class="wrap-slick1-dots"></div>
		</div>
	</section>

	<!-- Blog -->
	<section class="sectionBlock section1">
		<div class="row container-fluid">
			<div class="col-md-1">
				<h2 style="writing-mode: vertical-lr;">焦點文章</h2>
			</div>
			
			<div class="blogSlick col-md-11">
				<c:forEach var="blog" items="${blogs}">
					<div style="height:400px; overflow: hidden;" class="card col-md-3">
						<div class="blogBlock">
							<img class="card-img-top" src="${blog.blogImage}" >
						</div>
						<div class="card-body">
					    	<h4 class="card-title">
					       		<a href="#" class="blog-title">${blog.blogTitle}</a>
					    	</h4>
					    	<div class="card-text blog-content" data-blogid="${blog.blogId}">${blog.blogContent}</div>
				   		</div>
					</div>
				</c:forEach>
			</div>					
		</div>
	</section>

	<section class="sectionBlock section2">
		<h2 class="title">最新商品</h2>
 
		<div id="productOffset"  class="row container-fluid">
			<div class="productCard" style="display: flex;">
				<c:forEach var="pb" items="${all}" begin="0" step="1" varStatus="i">
				<div class="prodlist">
					<p class="prodtitle">${pb.productName}</p>
					<figure>
						<a href="<c:url value='/product?id=${pb.productId}' />" ">
							<img src="<c:url value='/ProductPicture/${pb.productId}'/>" />
						</a>						
					</figure>
					<figcaption>
						<p>Unit Price:<span style="color:#FF44AA;font-weight:bold;font-size:20px">$ ${pb.unitPrice}</span></p>
						
						<c:choose>
						<c:when test="${pb.discount==10.0}">
							<p>
								<fmt:formatNumber type="number" value="${pb.discount}" maxFractionDigits="0" var="discount" />
								<span style="font-weight:bold;color:#CE0000;font-size:20px;visibility:hidden;">${discount}</span>
							</p>
						</c:when>
						<c:otherwise>
							<p>discount:
								<fmt:formatNumber type="number" value="${pb.discount}" maxFractionDigits="0" var="discount" />
								<span style="font-weight:bold;color:#CE0000;font-size:20px">${100-discount*10}%off </span>		
							</p>			
						</c:otherwise>		
						</c:choose>
						
	     				<label for="selectCount" style="font-size: 18px; padding: 10px 5px; color: #000">Quantity：</label>
	     				<select class="selectCount" id="selectCount" name="count" data-product="${i.index}">
	      					<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select> 
						<input class="pdid" type="hidden" name="productId" value="${pb.productId}">
						<button type="button" class="btn button-add" data-product="${i.index}" data-productimage="<c:url value='/ProductPicture/${pb.productId}'/>" style="margin:10px 0;padding:5px 10px;background-color:#019858;color: #fff;border-radius:5px;">Add to Cart</button>
						<div id="snackbar">已加入購物車</div>
					</figcaption>	
				</div> 
				<!-- .prodlist --> 
				</c:forEach>
			</div>
		</div>
	</section>

<!-- Footer -->
<div class="requestUrl" style="display: none;">${pageContext.request.contextPath}</div>
<jsp:include page="footer.jsp" />
<script type="text/javascript"
src="<c:url value="/vendor/jquery/jquery.mousewheel.min.js"/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TweenMax.min.js"></script>
<script>
function myFunction() {
 var x = document.getElementById("snackbar");
 x.className = "show";
 setTimeout(function() {
  
  x.className = x.className.replace("show", "");
 }, 1000);
}

function changeCartNum(){
	$.ajax({
		url : "http://localhost:8080/FunBar/buyCartJson",
		method : "POST",
		dataType : "JSON",
		contentType : "application/x-www-form-urlencoded; charset=UTF-8",
		success :function(data){
			$(".cart").text(data.length);
		}
	})
}

// Add To Cart Click Event
$(".button-add").click(function(evt) {
	let clickEvent = $(this);
	let index = $(this).data("product");
	let productImage = $(this).data("productimage");
	console.log("productImage:" + productImage);
	console.log("btn index:" + index);
  
	var url = "/FunBar/";
	$.ajax({
			url : "http://localhost:8080" + url + "cart",
			data:{
			count:$(".selectCount").eq(index).val(),
			productId:$(".pdid").eq(index).val()
		},
		type:"POST",
			dataType:"JSON",
			success:function(data){
			// 加入購物車失敗 /cart 會回傳 1
			let check = 0;
			if(data.status!=null) {
				console.log(data.status);
				console.log(data.status[1]);
				check = data.status[1];
			} else if(data.redirect!=null) {
				window.location.href = "http://localhost:8080/FunBar/signin"; 
			}

			if(check) {
				alert("庫存不足");
   			} else {
   				// success animation
    			myFunction();
   				
   				// Fly To Cart
   				// 避免使用者連續重複點擊導致位置位移
   				$(".buyBox").css({"top":0, "left":0, "opacity":0});
   				$(".buyBox").css({
   					"background-image": "url(" + productImage + ")",
   					"background-size": "contain",
   					"background-position": "center center",
   					"background-repeat": "no-repeat"
   				});

   				TweenMax.from(".buyBox",0.8,{
   					left: clickEvent.offset().left-915,
   					top: clickEvent.offset().top-1200,
   					opacity: 1,
   		          	ease: Power1.easeIn
   				})
   				console.log("Add To Cart left => " + clickEvent.offset().left);
   				console.log("Add To Cart top => " + clickEvent.offset().top);

   				// Change Session Cart Num
    			changeCartNum();
			}
 			}
		})
})

//  滑鼠滾輪事件
let sum = 0;
let productWheel = 0;
$("#productOffset").bind("mousewheel",function(event){
	console.log(event.deltaY);
	event.preventDefault();
	if(event.deltaY==1) {
		console.log("sum 向下拉 => " + $(".productCard").offset().left);
		if($(".productCard").offset().left == -830 || $(".productCard").offset().left < -830) { 
			productWheel = 0;
		} else {
			productWheel = -100;
		}
		
		TweenMax.to(".productCard",0.1,{
	        left: "+="+productWheel+"px"
	     })

	} else if(event.deltaY == -1) {
		
		console.log("sum 向上拉 => " + $(".productCard").offset().left);
		if($(".productCard").offset().left == 0 || $(".productCard").offset().left > 0) { 
			productWheel = 0;
		} else {
			productWheel = 100;
		}
		
    	TweenMax.to(".productCard",0.1,{
	        left: "+="+productWheel+"px"
	     })
	 }
})
</script>

<script src="<c:url value='/js/main_blog.js' />"></script>
</body>

</html>