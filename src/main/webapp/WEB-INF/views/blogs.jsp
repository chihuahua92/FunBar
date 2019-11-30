<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>blog</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <script src="https://kit.fontawesome.com/c523dff261.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
    <link rel="stylesheet" type="text/css" href="<c:url value="/css/blog.css"/>">
</head>
<style>
	.box {
		width: 90%;
		padding: 5px 15px;
		position: relative;
	    box-shadow: 0 0 5px rgba(0,0,0,0.2);
	    transition: 1s;
	}

	.categoryBlock { 
		border: 1px solid #eee;
		text-align: center; padding: 2px 10px;
		margin: 1px;
		cursor: pointer;
		transition: .5s;
	}

	.categoryBlock:hover { background-color: #eee;}
	
	.fa-align-center { font-size: 1.1em;}

	.blogMore { position: absolute; top: 5px; right: 5px; display: block; width: 25px; height:25px; z-index:999;}
	
	#closeLeftModal { padding: 5px; border-radius: 2px;}
	
	.blogBlock {height: 200px; overflow: hidden;}
	.blogBlock img {display: block; width: 100%; height: 100%; transition: all 1s; margin: 0 -15px;}
	.blogBlock img:hover{transform: scale(1.1,1.1);}
	
	.uploadBlock {
		cursor: pointer;
		background-color: #eee;
		padding: 5px;
		border-radius: 5px;
		border: 1px solid black;
		margin-top: 10px;
	}
</style>
<body>
<!-- Header -->
<jsp:include page="header.jsp" />

<!-- content 區塊 -->
<div class="container page">
    <div class="row col-md-12">
        <div class="row col-md-9 blogs">
        </div>
        <div class="col-md-3">
        	<c:if test="${sessionScope.member.memberName!=null}">
            <button type="button" class="btn btn-info page-btn" data-toggle="modal"
                data-target="#createBlog">新增文章</button>
			</c:if>
            <button type="button" class="btn btn-light page-btn allBlogs">全部文章</button>
            
            <!-- Sidebar Widgets Column -->
            
            <!-- Search Widget -->
	        <div class="card my-4">
	          <h5 class="card-header">Search</h5>
	          <div class="card-body">
	            <div class="input-group">
	              <input type="text" class="form-control searchValue" placeholder="Search for...">
	              <span class="input-group-btn">
	                <button class="btn btn-secondary searchClick" type="button">Go!</button>
	              </span>
	            </div>
	          </div>
	        </div>
			
			<!-- Categories Widget -->
			<div class="card my-4">
				<h5 class="card-header">Categories</h5>
				<div class="card-body">
					<div class="row">
						<div class="col-lg-12">
							<ul class="list-unstyled mb-0 row">
								<c:forEach var="category" items="${categoryList}">
									<li class="categoryBlock categoryClick col-md-3" data-category="${category.categoryId}">
										<a href="javascript:;">${category.categoryName}</a>
									</li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			
        </div>
    </div>
    <ul id="show" class="pagination"></ul>
</div>

<!-- Insert Modal -->
<div class="modal right fade" id="createBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
            </div>

            <div class="modal-body">
                <form enctype="multipart/form-data" method="post" action="blogPost">
                    <div class="row">
                        <div class="col-md-2">
							<!-- Logo 區域  -->
							<img src="${pageContext.request.contextPath}/images/icons/logo5.png" width="150px" height="180px" />
                            <!-- 圖片顯示區塊 -->
                            <div id="imgArea" title="" style="padding: 20px;">
                                <img class="imgArea" style="width: 300px; height: auto">
                            </div>
                        </div>

                        <div class="col-md-10">
                            <div class="form-group row">
                                <label for="categoryId" class="col-md-2">文章分類:</label> <select
                                    class="form-control col-md-5" id="categoryId" name="categoryId">
                                    <c:forEach var="category" items="${categoryList}">
                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                    </c:forEach>

                                </select>
                            </div>

                            <div class="form-group row">
                                <label for="blogTitle" class="col-md-2">文章標題:</label> <input type="text"
                                    id="blogTitle" name="blogTitle" class="form-control col-md-5">
                            </div>

                            <div class="form-group row">
                                <label for="blogContent" class="col-md-2">
                                	文章內容:
	                                <label class="uploadBlock">
	                                	<input type="file" name="blogImage" id="blog_img" style="display: none;">
	                                	<span><i class="fa fa-photo"></i>封面圖片</span>
	                            	</label>
                                </label>
                                <textarea id="blogContent" name="blogContent"></textarea>
                            </div>

                            <hr>
                            <div class="row">
                            	<div class="col-md-4"></div>
                            	<div class="col-md-4">
                            		<button id="sendBlogMessage" style="display: block; width: 100px; height: 50px; margin: 0 auto;" class="btn btn-outline-secondary" type="submit">提交</button>
                            	</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->


<!-- Update Modal -->
<div class="modal right fade" id="modifyBlog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span 
                        aria-hidden="true">&times;</span></button>
            </div>

            <div class="modal-body">
                <form enctype="multipart/form-data" method="post" action="modifyBlog">
                    <div class="row">
                        <div class="col-md-2">
                            <!-- Logo 區域  -->
							<img src="${pageContext.request.contextPath}/images/icons/logo5.png" width="150px" height="180px" />
                            <!-- 圖片顯示區塊 -->
                            <div id="imgArea2" title="" style="padding: 20px;">
                                <img class="imgArea" style="width: 300px; height: auto">
                            </div>
                        </div>

                        <div class="col-md-10">
                            <div class="form-group row">
                                <label for="categoryId" class="col-md-2">文章分類:</label> <select
                                    class="form-control col-md-5" id="categoryId" name="categoryId">
                                    <c:forEach var="category" items="${categoryList}">
                                        <option value="${category.categoryId}">${category.categoryName}</option>
                                    </c:forEach>

                                </select>
                            </div>

                            <div class="form-group row">
                                <label for="blogTitle" class="col-md-2">文章標題:</label>
                                <input type="text" id="blogTitle2" name="blogTitle" class="form-control col-md-5">
                            </div>

                            <div class="form-group row">
                                <label for="blogContent2" class="col-md-2">
                                	文章內容:
                                	<label class="uploadBlock">
                                		<input type="file" name="blogImage" id="blog_img2" style="display: none;">
                                		<span><i class="fa fa-photo"></i>封面圖片</span>
                            		</label>
                                </label>
                                <textarea id="blogContent2" name="blogContent"></textarea>
                            </div>
                            <input id="modifyBlogId" type="hidden" name="blogId" value="" />
                            <hr>
                            <div class="row">
                            	<div class="col-md-4"></div>
                            	<div class="col-md-4">
                            		<button style="display: block; width: 100px; height: 50px; margin: 0 auto;" id="closeLeftModal" class="btn btn-outline-secondary" type="submit">修改</button>
                            	</div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div><!-- modal-content -->
    </div><!-- modal-dialog -->
</div><!-- modal -->
	
<!-- Footer -->
<div style="display:none; " class="requestUrl">${pageContext.request.contextPath}</div>
<input type="hidden" class="sessionScopeMemberId" value="${sessionScope.member.id}" />
<input type="hidden" class="sessionScopeMemberName" value="${sessionScope.member.memberName}" />
<jsp:include page="footer.jsp" />
<script src="<c:url value='/vendor/ckeditor/ckeditor.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<script>
$(document).ready(function () {
	// CKEditor Plugin
	$('#createBlog').on('shown.bs.modal', function() {
        $(document).off('focusin.modal');
    });
	
	$('#modifyBlog').on('shown.bs.modal', function() {
        $(document).off('focusin.modal');
    });

    CKEDITOR.replace('blogContent', {
        height: 400,
        filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
        filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'
    });
    
    CKEDITOR.replace('blogContent2', {
        height: 400,
        filebrowserUploadUrl: '${pageContext.request.contextPath}/blogInsert',
        filebrowserBrowseUrl: '${pageContext.request.contextPath}/blogBrowse'
    });
})
</script>
<script src="<c:url value='/js/blog.js'/>"></script>
</body>
</html>