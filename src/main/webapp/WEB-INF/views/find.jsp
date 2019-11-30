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
<title>login</title>
</head>
<style>
* {
	font-family: 微軟正黑體;
}

 .login {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        padding: 20px;
        margin-bottom: 10px;
        font-weight: bold;
        border-radius: 5px;
        background-color: :blue;
		
    }
.contentPage{
		width: 100%;
		height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;
		background-image: url('/FunBar/images/001.jpg');
		background-position: top center;
		background-size: cover;
		
	}
	button{
	background-color: green;
	}
	
</style>

<body>
<jsp:include page="header.jsp" />
<div class="row contentPage">
<div class="login col-sm-2">
<h2>更換新密碼</h2>
	<form action="findyou" method="post">
                <fieldset>
                    <div class="form-group">
                        <label for="memberPwd">新密碼:</label>
                        <input  id="memberPwd" type="password" class="form-control" name="memberPwd" placeholder="請輸入新密碼">
                        <span class="error">${errorMsg.errUserName}</span>
                        <div id="noPwd"></div>
                    </div>  
                </fieldset>
                <div class="button">
					<input type="hidden" name="memberId" value="${one.memberId}" />
					<input type="submit" class="btn btn-outline-secondary" value="送出">

					<a href="${pageContext.request.contextPath}">
						<button type="button" class="btn btn-outline-secondary">回首頁</button>
					</a>
				</div>
            </form>
            <script src="${pageContext.request.contextPath }/js/forgetmem.js"></script> 
            </div>
            </div>
             <jsp:include page="footer.jsp" />
		</body>
</html>