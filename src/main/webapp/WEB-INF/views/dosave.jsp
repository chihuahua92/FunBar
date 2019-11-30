<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>showBlog</title>
</head>
<style>
.blogContent img {
	max-width:650px!important;
	max-height: auto!important;
}

@media(max-width: 600px) {
	.blogContent img {
		max-width: 480px!important;
	}
}
</style>
<body>
	<!-- Header -->
	<jsp:include page="header.jsp" />

	<!-- content 區塊 -->
	<div class="container row page">
		<!-- Post Content Column -->
		<div class="col-lg-8">
			<!-- Title -->
			<h1 class="mt-4">${blog.blogTitle}</h1>
			<!-- Author -->
			<p class="lead">
				by<a href="#">allen</a>
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
			<div class="card my-4">
				<h5 class="card-header">Leave a Comment:</h5>
				<div class="card-body">
					<form>
						<div class="form-group">
							<textarea class="form-control" rows="3"></textarea>
						</div>
						<input type="hidden" id="memberId" name="memberId" value="${sessionScope.member.memberId}" />
						<input type="hidden" id="blogId" name="blogId" value="${blog.blogId}" />
						<input type="hidden" id="parentCommentId" name="parentCommentId" value="-1" />
						<button type="submit" class="btn btn-primary commentClick">Submit</button>
					</form>
				</div>
			</div>

			<!-- Single Comment -->
			<div class="media mb-4">
				<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
				<div class="media-body">
					<h5 class="mt-0">Commenter Name</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio,
					vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate
					fringilla. Donec
					lacinia congue felis in faucibus.
				</div>
			</div>

			<!-- Comment with nested comments -->
			<div class="media mb-4">
				<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
				<div class="media-body">
					<h5 class="mt-0">Commenter Name</h5>
					Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras
					purus odio,
					vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate
					fringilla. Donec
					lacinia congue felis in faucibus.

					<div class="media mt-4">
						<img class="d-flex mr-3 rounded-circle" src="http://placehold.it/50x50" alt="">
						<div class="media-body">
							<h5 class="mt-0">Commenter Name</h5>
							Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin.
							Cras purus
							odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi
							vulputate
							fringilla. Donec lacinia congue felis in faucibus.
						</div>
					</div>
				</div>
			</div>

		</div>

		<!-- Sidebar Widgets Column -->
		<div class="col-md-4">

			<!-- Search Widget -->
			<div class="card my-4">
				<h5 class="card-header">Search</h5>
				<div class="card-body">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search for...">
						<span class="input-group-btn">
							<button class="btn btn-secondary" type="button">Go!</button>
						</span>
					</div>
				</div>
			</div>

			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">Categories</h5>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<li>
									<a href="#">Web Design</a>
								</li>
								<li>
									<a href="#">HTML</a>
								</li>
								<li>
									<a href="#">Freebies</a>
								</li>
							</ul>
						</div>
						<div class="col-lg-6">
							<ul class="list-unstyled mb-0">
								<li>
									<a href="#">JavaScript</a>
								</li>
								<li>
									<a href="#">CSS</a>
								</li>
								<li>
									<a href="#">Tutorials</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>


	<!-- Footer -->
	<jsp:include page="footer.jsp" />
	<script>
	var requestUrl = "/FunBar/";
	$(".commentClick").click(function() {
		$.ajax(function() {
			url: "http://localhost:8080" + requestUrl + "/commentInsert",
			method: "POST",
			data: {
				memberId: $("#memberId").val(),
				blogId: $("#blogId").val(),
				parentCommentId: $("#parentCommentId").val()
			},
			dataType: "JSON",
			success: function(res) {
				
			}
		})
	})
	</script>
</body>

</html>