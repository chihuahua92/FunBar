<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.mgb5 { margin-bottom: 5px;}
#reportProcess { letter-spacing: 2px;}
#reportProcess .showComment { cursor: pointer;}
#reportProcess .showComment:hover { color: red;}
.box {
	box-shadow: 0 0 5px rgba(0,0,0,0.2);
	padding: 5px 15px;
	margin-bottom: 10px;
}

#reportProcess .tdshowComment { cursor: pointer;}
#reportProcess .tdshowComment:hover{color: red;}
</style>
<body>
<!-- Header -->
<jsp:include page="admin_header.jsp" />

<!-- content 區塊 -->
<div style="margin-top:50px; margin-bottom:120px" class="container">
	<!-- Search Widget -->
	<div class=" col-md-6 mgb5">
	    <div class="card my-6">
	      <h5 class="card-header">Search</h5>
	      <div class="card-body">
	        <div class="input-group">
	        	<div class="input-group">
			  		<select class="custom-select" id="inputGroupSelect04">
			    		<option value="0" selected>所有檢舉</option>
			    		<option value="1">留言編號</option>
			    		<option value="2">檢舉原因</option>
			    		<option value="3">檢舉人</option>
			    		<option value="4">被檢舉人</option>
			  		</select>
			  		<input id="searchKeyUp" type="text" class="form-control searchValue" placeholder="Search for...">
			</div>
	        </div>
	      </div>
	    </div>
    </div>

  	<table id="reportProcess" class="table table-dark table-hover"></table>
  	<ul id="showProcess" class="pagination"></ul>
</div>

<!-- showComment Modal -->
  <div class="modal fade" id="showComment">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header bg-dark" style="color: #fff">
          <h4 class="modal-title blogTitle">文章: {{comment.blog.blogTitle}}</h4>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body row">
          <div class="offset-md-2 col-md-8 box">
			  <label>留言編號: </label>
			  <p class="commentId">{{comment.commentId}}</p>
			  <label>留言者:</label>          
          	  <p class="commentName">{{comment.commentName}}</p>
          	  <label>留言時間: </label>
          	  <p class="commentCreatedTime">{{commentCreatedTime}}</p>
          </div>
          
          <div class="offset-md-2 col-md-8 box">
              <label>留言內容: </label>
          	  <p class="commentContent">{{comment.commentContent}}</p>
          </div>
          
          <div class="offset-md-2 col-md-8 box">
              <label>檢舉人: </label>
          	  <p class="reportName">{{comment.reports[i].reportName}}</p>
          	  <label>檢舉原因: </label>
          	  <p style="word-break: break-all;" class="reportContent"> {{comment.reports[i].reportContent}}</p>
          </div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer bg-dark" style="color: #fff">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>

<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<jsp:include page="admin_footer.jsp" />
<script src="<c:url value='/js/admin_report.js' />"></script>
</body>
</html>