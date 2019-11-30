<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin_discuss</title>
</head>
<body class="animsition">
	<!-- Header -->
	<jsp:include page="admin_header.jsp" />
	<a href="" class="list-group-item list-group-item-action" id="requestUrl" style="display: none">${pageContext.request.contextPath}/</a>
	<a id="pageNum" style="display: none">${page}</a>
	<a id="pageNumNow" style="display: none">1</a>
	<a id="sortType" style="display: none">2</a>
	<section class="container page">
		<!-- Table area -->
		<div class="mt-5" style="margin-bottom: 100px">
			<h2 class="mb-3">貼文管理</h2><span id="numberOfReport"></span>

			<table class='table table-striped table-dark table-hover rounded'>
				<thead class='thead-dark rounded-top'>
					<tr class=''>
						<th scope='col'>貼文編號</th>
						<th scope='col'>會員編號</th>
						<th scope='col'>貼文內容</th>
						<th scope='col'>貼文時間<i id="sortTime" class="fa fa-angle-double-down ml-2"></i></th>
						<th scope='col'>按讚數</th>
						<th scope='col'>檢舉次數<i id="sortReport" class="fa fa-angle-double-down ml-2"></i></th>
						<th scope='col'><form class="form-inline mr-right">
								<div class="md-form my-0">
									<input id="searchContent" class="form-control input-sm" type="text" placeholder="Search By Content" aria-label="Search">
									<i class="fa fa-search ml-2" aria-hidden="true" id="search"></i>
								</div>
							</form></th>
					</tr>
				</thead>
				<tbody id='discussTable'>
				</tbody>
			</table>

			<div aria-label="Page navigation">
				<ul class="pagination justify-content-center" id="reportPage">
					<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" id="Previous">Previous</a></li>
						<c:forEach begin="1" end="${page}" varStatus="i">
							<li class="page-item" id="pageBtn"><a class="page-link" id="page${i.index}" href="#">${i.index}</a></li>
						</c:forEach>
					<li class="page-item"><a class="page-link" href="#" id="Next">Next</a></li>
				</ul>
			</div>
		</div>


	</section>


	<!-- Footer -->
	<jsp:include page="admin_footer.jsp" />
	<script type="text/javascript"
		src="<c:url value='/js/admin_discuss.js'/>"></script>
</body>
</html>