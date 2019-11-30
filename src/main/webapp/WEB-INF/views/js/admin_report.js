var requestUrl = $(".requestUrl").text();
let clickArray = new Array();
let pageRow = 10;
let pageRowStart = 0;
let pageRowEnd = 10;
let tododata;
let now = 1;

$(".nav-tabs a").click(function(){
	$(this).tab('show');
});

function init() {
	let txt = "<thead><tr><th>留言編號<th>留言內容<th>檢舉人<th>檢舉原因<th>檢舉時間<th>被檢舉人</tr></thead>";
	reports = tododata;

	// 每頁最多筆數 ex: 第一頁最大筆數為10
	let maxRow = now * pageRow;

	// 每頁開始筆數的索引 ex: 第一頁開始筆數的索引為 0
	pageRowStart = (now - 1) * pageRow;

	// 計算每頁結束的筆數
	pageRowEnd = (reports.length < maxRow) ? reports.length : maxRow;
	console.log("Start:" + pageRowStart + " End:" + pageRowEnd);

	for (let i = pageRowStart; i < pageRowEnd; i++) {
		txt += "<tr><td>" + reports[i].comment.commentId;
		txt += "<td class='tdcommentContent'>" + reports[i].comment.commentContent;
		txt += "<td>" + reports[i].reportName;
		txt += "<td><a class='tdshowComment' data-toggle='modal' data-target='#showComment' data-showcomment='" + requestUrl 
				+ "/admin_showComment/" + reports[i].reportId + "/" + reports[i].comment.commentId + "'>" + reports[i].reportContent;
		txt += "<td>" + reports[i].reportCreatedTime;
		txt += "<td>" + reports[i].commentReportName;
		txt += "<td><a class='lockData btn btn-info' data-lock='" + requestUrl
				+ "/admin_lock/" + reports[i].comment.commentId + "'>刪除留言</a>";
	}
	$("#reportProcess").html(txt);
	hiddenContent();
	$("td").css({
		"width" : "200px",
		"height" : "80px"
	});

	// 取得頁數
	let pageNum = Math.ceil(reports.length / pageRow);
	for (var i = 0; i < pageNum; i++) {
		let ulElement = $("#showProcess");
		ulElement
				.append("<li class='page-item'><a class='page-link' href='javascript:;'>"
						+ (i + 1) + "</a></li>");
	}

	$("#showProcess li").click(function() {
		// 頁數起始筆數 結束筆數
		console.log($(this).index());
		now = $(this).index() + 1;
		console.log("目前頁數:" + now);
		$("#reportProcess").html("");
		$("#showProcess").html("");
		init();
	});
	
	$(".tdshowComment").click(function() {
		let showCommentUrl = $(this).data("showcomment");
		$.ajax({
			url: showCommentUrl,
			method: "POST",
			success: function(res) {
				let report = res.report;
				console.log("文章標題:" + report.comment.blog.blogTitle);
				$(".blogTitle").text(report.comment.blog.blogTitle);
				$(".commentId").text(report.comment.commentId);
				$(".commentName").text(report.comment.commentName);
				$(".commentCreatedTime").text(report.comment.commentCreatedTime);
				$(".commentContent").text(report.comment.commentContent);
				$(".reportName").text(report.reportName);
				$(".reportContent").text(report.reportContent);
			}
		})
	})
	
	$(".lockData").click(function() {
		let lockUrl = $(this).data("lock");
		if(confirm("確定刪除此留言嗎?")){
			$.ajax({
				url: lockUrl,
				method: "POST",
				dataType: "JSON",
				success: function() {
					$("#reportProcess").html("");
					$("#showProcess").html("");
					generateReport();
				}
			})
		}
	})
}

function generateReport() {
	$.ajax({
		url : requestUrl + "/reportProcess",
		method : "post",
		dataType : "JSON",
		success : function(data) {
			tododata = data.reports;
			init();
		}
	});
}

generateReport();
function hiddenContent() {
	$(".tdcommentContent").each(function() {
		let len = 10;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}

		$(this).html(txt);
	});

	$(".tdshowComment").each(function() {
		let len = 20;
		let txt = $(this).text().trim();
		if (txt.length > len) {
			txt = txt.substr(0, len);
		}
		$(this).html(txt + " ......");
	});
}

$("#searchKeyUp").bind("keyup", function(event) {
	if (event.keyCode == 13){
		$.ajax({
			url: requestUrl + "/admin_reportSearch",
			method: "POST",
			data: {
				searchKey: $(".searchValue").val(),
				searchOption: $(".custom-select").val()
			},
			dataType: "JSON",
			success: function(data) {
				tododata = data.reports;
				$("#reportProcess").html("");
				$("#showProcess").html("");
				$(".searchValue").val("");
				init();
			}
		})
    }
})