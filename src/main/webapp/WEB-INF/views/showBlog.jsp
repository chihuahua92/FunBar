<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>showBlog</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
<style>
	.mgl5 { margin-left: 5px;}

	.blogContent img {
		max-width: 650px !important;
		max-height: auto !important;
	}

	.categoryBlock:hover { background-color: #eee;}

	@media(max-width: 600px) {
		.blogContent img {
			max-width: 480px !important;
		}
	}
</style>
<body>
	<!-- Header -->
	<jsp:include page="header.jsp" />

	<!-- content 區塊 -->
	<div style="padding: 50px" class="container row page animsition">
		<!-- Post Content Column -->
		<div class="col-md-8" style="margin: 0 auto;">
			<!-- Title -->
			<h1 style="word-break: break-all;" class="mt-4">${blog.blogTitle}</h1>
			<!-- Author -->
			<p class="lead">
				by<a href="#">${blog.memberName}</a>
			</p>
			<hr>
			<!-- Date/Time -->
			<p>${blog.blogCreatedTime}</p>
			<hr>
			<!-- Preview Image -->
			<img class="img-fluid rounded" src="${blog.blogImage}" alt="">
			<hr>
			<!-- Post Content -->
			<div class="blogContent">${blog.blogContent}</div>
			<hr>

			<!-- Comments Form -->
			<c:if test="${sessionScope.member.id!=null}">
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<div class="form-group">
						<textarea id="commentContent" name="commentContent" class="form-control" rows="3"></textarea>
					</div>
					<input type="hidden" id="memberId" name="memberId" value="${sessionScope.member.id}" />
					<input type="hidden" id="blogId" name="blogId" value="${blog.blogId}" />
					<input type="hidden" id="parentCommentId" name="parentCommentId" value="-1" />
					<button class="btn btn-primary commentClick">Submit</button>
				</div>
			</div>
			</c:if>

			<!-- Comment with nested comments -->
			<c:if test="${sessionScope.member.id!=null}">
			<div class="media mb-4">
				<div id="commentBlock" class="media-body">

				</div>
			</div>
			<div class="media mt-4 row">
				<textarea id="replyComment" class="col-md-8 form-control" placeholder="請輸入評論訊息..."></textarea>
				<input type="hidden" id="replyMemberId" name="memberId" value="${sessionScope.member.memberId}" />
				<button id="replySubmit" class="btn btn-primary">送出</button>
			</div>
			</c:if>
		</div>
	</div>


  <!-- Report Modal -->
  <div  class="modal fade" id="reportModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">檢舉評論</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
        	<form>
        		<div class="form-group row">
                    <label for="reportContent" class="col-md-3">檢舉內容:</label>
                    <textarea id="reportContent" name="reportContent" class="form-control col-md-8"></textarea>
                </div>
        	</form>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<input type="hidden" id="replyMemberId" name="memberId" value="${sessionScope.member.memberId}" />
            <button id="reportSubmit" class="btn btn-primary">送出</button>
          	<button id="reportModalClick" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<input type="hidden" class="sessionScopeMemberId" value="${sessionScope.member.id}" />
<jsp:include page="footer.jsp" />
<script src="<c:url value='/js/showBlog.js'/>"></script>
</body>
</html>