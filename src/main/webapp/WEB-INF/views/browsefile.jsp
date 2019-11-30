<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
body { font-size: 80%;}

#form { width: 600px}

#fileExplorer { 
	float: left;
	width: 680px;
	border-left: 1px solid #dff0ff;
}

.thumbnail {
	float: left;
	margin: 3px;
	padding: 3px;
	border: 1px solid #dff0ff;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

li { padding: 0}
</style>

<body>
	<div id="fileExplorer">
		<c:forEach var="file" items="${files}">
			<div class="thumbnail">
				<img src="<c:url value='/imgUpload/' />${file.name}" 
				alt="thumb" title="${file.name}" width="120" height="100" />
				<br>
				${file.name}
			</div>
		</c:forEach>
	</div>
<script type="text/javascript" src="<c:url value="/vendor/jquery/jquery-3.2.1.min.js"/>"> </script>
<script src="<c:url value='/vendor/ckeditor/ckeditor.js' />"></script>
<script>
$(document).ready(function() {
	var funcNum = ${CKEditorFuncNum};
	$("#fileExplorer").on('click','img', function() {
		var fileUrl = '${pageContext.request.contextPath}' + '/imgUpload/' + $(this).attr('title');
		window.opener.CKEDITOR.tools.callFunction(funcNum, fileUrl);
		window.close();
	}).hover(function() {
		$(this).css('cursor', 'pointer');
	});
});
</script>
</body>
</html>