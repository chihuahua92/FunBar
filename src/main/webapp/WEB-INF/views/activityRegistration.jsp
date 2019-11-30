<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活動報名</title>
<style>
	.mx-auto{
		border:1px gray solid;
	 	font-family:微軟正黑體;
	 	padding:10px;
	 	border-radius:15px; 
	}
</style>
</head>
<body>

	<jsp:include page="header.jsp" />
	<div class="container-fluid" style="margin-top: 150px;">
		<div class="row no-gutter">
			<div class="d-none d-md-flex col-md-4 col-lg-6 bg-image">
			
				<div class="card-body">
				<img style="height:400px; width:700px" class="card-img-top" 
				src="${pageContext.request.contextPath}/ActivitygetPicture/${activity.activityId}"/>
					<h4 class="card-title">
						<a
							href="<spring:url value='/activity?id=${activity.activityId}' />">${activity.eventName}</a>
					</h4>
					<p class="card-text">${activity.eventDate}</p>
					<p class="card-text">${activity.introduction}</p>

				</div>

			</div>
			<div class="col-md-8 col-lg-6">
				<div class="login d-flex align-items-center py-5">
					<div class="container">
						<div class="row">
							<div style="" class="col-md-9 col-lg-8 mx-auto">
								<h3 class="login-heading mb-4">填寫報名資訊</h3>
								<form action="applicantSignup" method='POST'>
									<div class="form-label-group">
										<label for="name">姓名:</label> <input name="applicantName"
											type="text" class="form-control" value="${member.memberName}"
											id="name" required autofocus />
									</div>
									<br>
									<div class="form-label-group">
										<label for="gender">性別:</label> <br> 
										<input type="radio" name="gender" value="女" id="gender" CHECKED />女 
										<input type="radio" name="gender" value="男" id="gender" />男
									</div>
									<br>

									<div class="form-label-group">
										<label for="phone">手機號碼:</label> <input name="applicantPhone"
											type="text" class="form-control"
											value="${member.memberPhone}" id="phone" required />
									</div>
									<br>


									<div class="form-label-group">
										<label for="email">e-mail:</label> <input
											name="applicantEmail" type="text" class="form-control"
											value="${member.memberEmail}" id="email" required />
									</div>
									<br> <br> <input name="activityId" type="hidden"
										class="form-control" value="${activity.activityId}" id="id" />
									<input name="memberId" class="form-control"
										value="${member.memberId}" id="mid" type="hidden" />

									<button
										class="btn btn-lg btn-primary btn-block btn-login text-uppercase font-weight-bold mb-2"
										type="submit">確認報名</button>
									<div class="text-center">
										<a class="small" href="#">活動資訊</a>
									</div>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>