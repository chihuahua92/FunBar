<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_blog</title>
</head>
<style>
body, title {
		font-family:"微軟正黑體";
}

td	{
	width:200px;
	height: 110px;
	overflow: hidden;
}
.overflowH { white-space: nowrap; overflow: hidden; }

#demo {min-height: 650px;}
.blog-content { cursor: pointer;}
#showBlog .blogContent { cursor: pointer;}
#showBlog .blogContent img {
		max-width: 650px !important;
		max-height: auto !important;
}

#showBlog .modal-dialog {
		max-width: 1000px;
}
</style>
<body>
<!-- Header -->
<jsp:include page="admin_header.jsp" />

<!-- content 區塊 -->
<div style="margin-top:80px;margin-bottom:120px" class="container table-responsive">
    <table class="table table-hover" id="demo"></table>
    <ul id="show" class="pagination"></ul>
</div>

<!-- The Modal -->
<div class="modal fade" id="showBlog">
	<div class="modal-dialog">
		<div class="modal-content">
	        
	        <!-- Modal body -->
	        <div class="modal-body">
	        	<div style="padding: 50px" class="container row page animsition">
					<!-- Post Content Column -->
					<div class="col-md-8" style="margin: 0 auto;">
						<!-- Title -->
						<h1 style="word-break: break-all;" class="mt-4 blogTitle">${blog.blogTitle}</h1>
						<!-- Author -->
						<p class="lead">
							by<a href="#" class="memberName">${blog.memberName}</a>
						</p>
						<hr>
						<!-- Date/Time -->
						<p class="blogCreatedTime">${blog.blogCreatedTime}</p>
						<hr>
						<!-- Preview Image -->
						<img class="img-fluid rounded blogImage" src="${blog.blogImage}" alt="">
						<hr>
						<!-- Post Content -->
						<div class="blogContent">${blog.blogContent}</div>
					</div>
				</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	        </div>
        
		</div>
	</div>
</div>

<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<jsp:include page="admin_footer.jsp" />
<script src="<c:url value='/js/admin_blog.js' />"></script>
</body>
</html>