<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix='form' uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

    .login {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        padding: 20px;
        margin-bottom: 10px;
        font-weight: bold;
        border-radius: 5px;
    }

    .registerBox {
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        padding: 10px;
        font-weight: bold;
    }

    .registerBox a {
        text-decoration: none;
    }
    
    .error { color: red}
</style>


<body>
<!-- header -->
<jsp:include page="header.jsp" />

<!-- Content -->
<div class="row contentPage">
    <div class="login col-sm-2">
        <h2>FunBar</h2>
        <form action="forget" method="post">
            <fieldset>
                <div class="form-group">
                    <label for="memberId">帳號:</label>
                    <input id="user" type="text" class="form-control" name="memberId" placeholder="請輸入帳號">
                    <span class="error">${errorMsg.errUserName}</span>
                </div>
               
            </fieldset>
            <button type="submit" id="findpass" class="btn btn-info col-md-12">尋找密碼</button>
        </form>
    </div>

    
</div>
<!--     <script type="text/javascript" -->
<%-- 		src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"> --%>
		
<!-- 	</script> -->
	<jsp:include page="footer.jsp" />
    <script>

$("#findpass").click(function() {
	if($("#user").val().length>0) {
		alert("請到信箱收取驗證信");
	}
})
</script>
</body>
</html>