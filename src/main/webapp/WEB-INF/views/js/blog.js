var requestUrl_blog = $('.requestUrl').text();
var blogTemplate = "<div class='row blogMargin box'><span class='blogMore' data-memberid='{{blog.memberId}}' data-click='{{data-click}}'><i class='fas fa-align-center'></i></span><div class='col-md-5 blogBlock'><img src='{{blogImage}}' /></div><div class='col-md-7'><div class='blog-title'>{{blogTitle}}</div><p><span>{{blogUser}}</span><span>{{blogCreatedTime}}</span><span>文章分類:{{categoryName}}</span></p><div class='blog-content'  data-id='{{data-id}}'>{{blogContent}}</div></div></div>";
let pageRow = 5;
let pageRowStart = 0;
let pageRowEnd = 5;
let tododata;
let now = 1;
let sessionScopeMemberId = 0;

//Sweet Alert Plugin
//自訂預設值
swal.setDefaults({
    confirmButtonText: "確定",
    cancelButtonText: "取消"
});

// init()
$.ajax({
	url: requestUrl_blog + "/blogJson",
	method: "POST",
	dataType: "JSON",
	success: function (res) {
		tododata = res.blogs;
		init();
	}
})

// refresh
function refresh() {
	$.ajax({
		url: requestUrl_blog + "/blogJson",
		method: "POST",
		dataType: "JSON",
		success: function (res) {
			tododata = res.blogs;
			init();
		}
	})
}

function init() {
	let blogs = tododata;
	// 每頁最多筆數 ex: 第一頁最大筆數為10
    let maxRow = now * pageRow;

    // 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
    pageRowStart = (now - 1) * pageRow;
    
    // 計算每頁結束的筆數
    pageRowEnd = (blogs.length < maxRow) ? blogs.length : maxRow;
    console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

	for (let i = pageRowStart; i < pageRowEnd; i++) {
		let blog = blogs[i];
		var blog_html = blogTemplate
			.replace("{{blog.memberId}}", blog.memberId)
			.replace("{{data-click}}", blog.blogId)
			.replace("{{data-id}}", blog.blogId)
			.replace("{{blogImage}}", blog.blogImage)
			.replace("{{blogTitle}}", blog.blogTitle)
			.replace("{{blogUser}}", blog.memberName)
			.replace("{{blogCreatedTime}}", blog.blogCreatedTime)
			.replace("{{categoryName}}", blog.category.categoryName)
			.replace("{{blogContent}}", blog.blogContent);
		$(".blogs").append(blog_html);
	}
	$(".box").addClass("animated zoomIn");
	blogContent = hiddenContent();
	
	// 取得頁數
    let pageNum = Math.ceil(blogs.length / pageRow);
    for (var i = 0; i < pageNum; i++) {
        let ulElement = $("#show");
        ulElement.append("<li class='page-item'><a class='page-link' href='javascript:;'>" + (i + 1) + "</a></li>");
    }

    $("#show li").click(function () {
    	$(".fade.show").css({"opacity":0});
        // 頁數起始筆數 結束筆數
        console.log($(this).index());
        now = $(this).index() + 1;
        console.log("目前頁數:" + now);
        $(".blogs").html("");
        $("#show").html("");
        init(); 
    });
    
    // 整合會員進行編輯/刪除文章
    $(".blogMore").each(function() {
    	let id = $(this).data('click');
    	sessionScopeMemberId = $('.sessionScopeMemberId').val();
    	let userBlogMemberId = $(this).data("memberid");
    	if(userBlogMemberId == sessionScopeMemberId) {
    		$(this).popover({
    	    	html: true,
    	    	content: "Blabla",
    	    	trigger: "click",
    	    	content: "<div class='modifyData' data-toggle='modal' data-target='#modifyBlog' data-blog='"+id+"'>編輯文章</div>" +
    	    			 "<div class='deleteData' data-blog='"+id+"'>刪除文章</div>"
    	    });
    	} else {
    		$(this).css({"display":"none"});
    	}
	});
    
	// 編輯文章
    // blogMore 點擊事先綁定還未產生的 .modifyData .deleteData click
	$(".blogMore").click(function(){
		$(".modifyData").click(function() {
	    	let modifyBlogId = $(this).data("blog");
	    	console.log("modify = " + modifyBlogId);
	    	$.ajax({
	    		url: requestUrl_blog + "/getmodifyBlog/" + modifyBlogId,
	    		method: "POST",
	    		dataType: "JSON",
	    		success: function(res) {
	    			let modifyData = res.modifyBlog;
	    			console.log(modifyData.blogId);
	    			
	    			CKEDITOR.instances["blogContent2"].destroy(true);
    				CKEDITOR.replace('blogContent2', {
	    		        height: 400,
	    		        filebrowserUploadUrl: requestUrl_blog + '/blogInsert',
	    		        filebrowserBrowseUrl: requestUrl_blog + '/blogBrowse'
	    		    });
	    			
	    			
	    			$("#blogTitle2").val(modifyData.blogTitle);
	    			$("#blogContent2").val(modifyData.blogContent);
	    			$("#modifyBlogId").val(modifyData.blogId);
	    		}
	    	})
	    	
	    	$('#blog_img2').on('change', function () {
	    		updatePreview(this);
	    	});
		})
		
		$(".deleteData").click(function() {
	    		let deleteBlogId = $(this).data("blog");

	    		swal({
		   	         title: "確定要刪除嗎?",
		   	         html: "按下確定後刪除文章",
		   	         type: "warning",
		   	         showCancelButton: true//顯示取消按鈕
	   	     	}).then(function (result) {
	   	             if (result.value) {
	   	                 //使用者按下「確定」要做的事
	   	                 swal("成功", "文章刪除完畢", "success");
	   	                 
		   	              $.ajax({
				    			url: requestUrl_blog + "/admin_delete/" + deleteBlogId,
				    			method: "POST",
				    			dataType: "JSON",
				    			success: function(res){
				    				$(".fade.show").css({"opacity":0});
				    				$(".blogs").html("");
				    		        $("#show").html("");
				    				refresh();
				    			}
				    		})
	   	             } else if (result.dismiss === "cancel") {
	   	                  //使用者按下「取消」要做的事
	   	                 swal("取消", "文章未刪除", "error");
	   	             }//end else  
	   	     	});//end then 
	    		
	    		
	    })
	})
}


// categoryinit()
$(".categoryClick").click(function() {
	let categoryId = $(this).data("category");
	$.ajax({
		url: requestUrl_blog + "/blogsByCategoryId/" + categoryId,
		method: "POST",
		dataType: "JSON",
		success: function(res) {
			tododata = res.blogsByCategory;
			$(".blogs").html("");
	        $("#show").html("");
	        $(".fade.show").css({"opacity":0});

	        // 回歸第一頁
	        now = 1;
	        console.log("目前頁數" + now);
			init();
		}
	})
})


function hiddenContent() {
	$(".blog-title").each(function() {
		let len = 10;
		let txt=$(this).text().trim();
		if(txt.length>len){
			txt=txt.substr(0,len);
		}
		$(this).html(txt);
	});

	$(".blog-content").each(function(){
		let id = $(this).attr('data-id');
		let len = 100;
		let txt=$(this).text().trim();
	  if(txt.length>len){
		txt=txt.substr(0,len);
	  }
	  $(this).html(txt+" ......<div><a class='btn btn-info page-btn' href='" + requestUrl_blog + "/blog/" + id + "'>閱讀詳細內容</a></div>");
  });
}

function preview(input) {
	if (input.files && input.files[0] && input.files.length>0) {
		var reader = new FileReader();
		reader.onload = function (e) {
			var resultArea = '#imgArea img';
			$(resultArea).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		$("#imgArea img").removeAttr("src");
	}
}

function updatePreview(input) {
	if (input.files && input.files[0] && input.files.length>0) {
		var reader = new FileReader();
		reader.onload = function (e) {
			var resultArea = '#imgArea2 img';
			$(resultArea).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	} else {
		$("#imgArea2 img").removeAttr("src");
	}
}

$('#blog_img').on('change', function () {
	preview(this);
});

$(".allBlogs").click(function() {
	$(".blogs").html("");
    $("#show").html("");
    $.ajax({
    	url: requestUrl_blog + "/blogJson",
    	method: "POST",
    	dataType: "JSON",
    	success: function (res) {
    		tododata = res.blogs;
    		init();
    	}
    })
})

// Like
$(".searchClick").click(function() {
	$.ajax({
		url: requestUrl_blog + "/search",
		method: "POST",
		data:{
			searchKey: $(".searchValue").val()
		},
		dataType: "JSON",
		success: function(res) {
			tododata = res.blogs;
			console.log(tododata);
			$(".blogs").html("");
	        $("#show").html("");
	        
	        // 回歸第一頁
	        now = 1;
			init();
		}
	})
})

// 新增部落格發送通知
$("#sendBlogMessage").click(function(){
	sessionScopeMemberId = $('.sessionScopeMemberId').val();
	let sessionScopeMemberName = $('.sessionScopeMemberName').val();
	let blogTitle = $("#blogTitle").val();
	stompClient.send("/topic/notification", {},
		 JSON.stringify({
			 'notification' : sessionScopeMemberName + "剛剛新增一篇新文章:" + blogTitle,
			 'icon': requestUrl_blog + '/membergetPicture/' + sessionScopeMemberId,
			 'url': requestUrl_blog + '/blogs',
			 'sessionScopeMemberId' : sessionScopeMemberId
			 
		})
	);
})



