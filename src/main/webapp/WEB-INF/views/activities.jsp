<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<style>
	@media (min-width: 992px) {
  .pricing .card:hover {
    margin-top: -.25rem;
    margin-bottom: .25rem;
    box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.3);
  }
  .pricing .card:hover .btn {
    opacity: 1;
  }
}	
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
    $(function () {
      var len = 90; // 超過字數以"..."取代
      $(".card-text").each(function (i) {
        if ($(this).text().length > len) {
          $(this).attr("title", $(this).text());
          var text = $(this).text().substring(0, len - 1) + "...";
          $(this).text(text);
        }
      });
    });
  </script>

	<title>Activities</title>
  
</head>

<body>
	<jsp:include page="header.jsp" />

	<div class="container" style="margin: 150px auto">

		<div class="row" style="float: left">

			<div class="col-lg-3">

				<div class="list-group" style="width: 140px">
					<a href="${pageContext.request.contextPath}/activities?index=1" class="list-group-item">所有活動</a>
					<c:forEach var="category" items="${categoryList}">
						<a href="${pageContext.request.contextPath}/activities/${category}"
							class="list-group-item">${category}</a>
					</c:forEach>
					
					<c:choose>
						<c:when test="${sessionScope.member.memberName==null}">
						
						</c:when>
						<c:otherwise>
						<br>
						<a href="${pageContext.request.contextPath}/getsiqnupActivity/${member.memberId}">
						<button style="margin-left:px;" type="button" class="btn btn-outline-dark">我報名的活動</button>
						</a>
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		
		
		<section class="pricing">
			<div class="row">
			<c:if test="${!empty activities}">
				<c:forEach var="activity" items="${activities}" begin="0" step="1" varStatus="i">
					<div class="col-lg-4 col-sm-6 mb-4">
						<div class="card h-100">
							<a href="<spring:url value='/activity?id=${activity.activityId}' />">
								<img class="card-img-top"
									src="<c:url value='/ActivitygetPicture/${activity.activityId }'/>">
							</a>
							<div class="card-body">
								<h4 class="card-title">
									<a
										href="<spring:url value='/activity?id=${activity.activityId}' />">${activity.eventName}</a>
								</h4>
								<p class="card-text">${activity.eventDate}</p><br>
								<p class="card-text">${activity.introduction}</p>


							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			</div>
		</section>

		<ul class="pagination justify-content-center">
			
			<c:forEach begin="1" step="1" end="${listCount}" varStatus="i">
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/activities?index=${i.index}">${i.index}</a></li>
			</c:forEach>
			
		</ul>

	</div>	
	
	<jsp:include page="footer.jsp" />

</body>

</html>