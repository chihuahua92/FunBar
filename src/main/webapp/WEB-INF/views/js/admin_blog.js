var requestUrl = $('.requestUrl').val();
let clickArray = new Array();
let pageRow = 5;
let pageRowStart = 0;
let pageRowEnd = 5;
let tododata;
let now = 1;

function init() {
	let txt = "<thead><tr><th>部落格編號<th>部落格縮圖<th>部落格標題<th>部落格內容<th>建立時間<th>焦點文章<th>刪除部落格</tr></thead>";
	blogs = tododata;

	// 每頁最多筆數 ex: 第一頁最大筆數為10
	let maxRow = now * pageRow;

	// 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
	pageRowStart = (now - 1) * pageRow;

	// 計算每頁結束的筆數
	pageRowEnd = (blogs.length < maxRow) ? blogs.length : maxRow;
	console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

	for (let i = pageRowStart; i < pageRowEnd; i++) {
		txt += "<tr><td>" + blogs[i].blogId;
		txt += "<td><img class='card-img-top' src='" + blogs[i].blogImage
				+ "'>";
		txt += "<td class='blog-title'>" + blogs[i].blogTitle;
		txt += "<td class='blog-content overflowH' data-toggle='modal' data-target='#showBlog' " +
				"data-blogfocus='"+ requestUrl + "admin_blog/" + blogs[i].blogId + "'>" 
				+ blogs[i].blogContent;
		txt += "<td>" + blogs[i].blogCreatedTime;
		txt += "<td><div class='custom-control custom-switch'><input type='checkbox' class='custom-control-input' id='customSwitch" + i +"'>" +
				"<label class='customSwitch custom-control-label' data-switchurl='" + requestUrl + "admin_switch/" + blogs[i].blogId +"' data-switch='" + blogs[i].blogIsHot +"' for='customSwitch"+ i +"'></label></div>";
		txt += "<td><a href='javascript:;' class='deleteData' data-deleteid='"+ blogs[i].blogId +"'>刪除</a>";
	}
	$("#demo").html(txt);
	hiddenContent();
	$("td").css({
		"width" : "200px",
		"height" : "110px"
	});
	
	// 刪除文章
	$(".deleteData").click(function() {
		let deleteId = $(this).data("deleteid");
		if(confirm('確定刪除此篇文章嗎?')) {
			$.ajax({
				url: requestUrl + "admin_delete/" + deleteId,
				method: "POST",
				dataType: "JSON",
				success: function() {
					$("#demo").html("");
					$("#show").html("");
					generate();
				}
			})
		}
	})

	// 取得頁數
	let pageNum = Math.ceil(blogs.length / pageRow);
	for (var i = 0; i < pageNum; i++) {
		let ulElement = $("#show");
		ulElement
				.append("<li class='page-item'><a class='page-link' href='javascript:;'>"
						+ (i + 1) + "</a></li>");
	}

	$("#show li").click(function() {
		// 頁數起始筆數 結束筆數
		console.log($(this).index());
		now = $(this).index() + 1;
		console.log("目前頁數:" + now);
		$("#demo").html("");
		$("#show").html("");
		init();
	});
	
	// 判斷焦點文章開關
	$(".customSwitch").each(function(i) {
		let blogIsHot = $(this).data("switch");
		let switchNum = i;
		if(now>1){
			switchNum = (now - 1) * pageRow + i;
			console.log("第二頁之後:" + switchNum);
		}
		if(blogIsHot) {
			$("#customSwitch" + switchNum).attr("checked", "checked");
		} else {
			$("#customSwitch" + switchNum).removeAttr("checked");
		}
	})
}
function generate() {
	$.ajax({
		url : requestUrl + "admin_blog",
		method : "post",
		dataType : "JSON",
		success : function(data) {
			tododata = data.blogs;
			init();
		}
	});
}
generate();

function hiddenContent() {
	$(".blog-title").each(function() {
		let len = 10;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}
		$(this).html(txt);
	});

	$(".blog-content").each(function() {
		let id = $(this).attr('data-id');
		let len = 20;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}
		$(this).html(txt + " ......");
	});

	$(".blog-content").click(function() {
		let showBlogUrl = $(this).data("blogfocus");
		$.ajax({
			url: showBlogUrl,
			method: "POST",
			success: function(res) {
				let blog = res.blog;
				console.log("文章標題:" + blog.blogTitle);
				$(".blogTitle").text(blog.blogTitle);
				$(".memberName").text(blog.memberName);
				$(".blogCreatedTime").text(blog.blogCreatedTime);
				$(".blogImage").text(blog.blogImage);
				$(".blogContent").html(blog.blogContent);
			}
		})
	})
	
	$(".customSwitch").click(function() {
		let switchUrl = $(this).data("switchurl");
		let blogIsHot = $(this).data("switch");
		
		if(blogIsHot==1) {
			$.ajax({
				url: switchUrl,
				method: "POST",
				dataType: "JSON",
				data: { blogIsHot: 0},
				success: function() {
					$("#demo").html("");
					$("#show").html("");
					generate();
				}
			})
		} else {
			$.ajax({
				url: switchUrl,
				method: "POST",
				dataType: "JSON",
				data: { blogIsHot: 1},
				success: function() {
					$("#demo").html("");
					$("#show").html("");
					generate();
				}
			})
		}
	})
}