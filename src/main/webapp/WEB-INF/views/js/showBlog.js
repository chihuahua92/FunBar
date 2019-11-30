var parentCommentId = -1;
var parentCommentName = "";
var requestUrl = $('.requestUrl').text();
var id = $("#blogId").val();
let sessionScopeMemberId = $(".sessionScopeMemberId").val();
if(sessionScopeMemberId == "") sessionScopeMemberId = 0;

$(".commentClick").click(function () {
	submit();
})


$("#replySubmit").click(function () {
	replySubmit();
})

function submit() {
	$.ajax({
		url: requestUrl + "/commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: $("#parentCommentId").val(),
			commentContent: $("#commentContent").val()
		},
		dataType: "JSON",
		success: function (res) {
			if(JSON.stringify(res)=="{}") window.location.href= requestUrl + "/signin";
			$("#commentBlock").html("");
			$("#commentContent").val("");
			generateTemplate();
			setTimeout(function() {
				let index = $("#commentBlock h5").length-1;
				$("html,body").animate({
					scrollTop: $("#commentBlock h5").eq(index).offset().top
				}, 1000);
			},1000);
			
		}
	});
}

function replySubmit() {
	$.ajax({
		url: requestUrl + "/commentInsert",
		method: "POST",
		data: {
			memberId: $("#memberId").val(),
			blogId: $("#blogId").val(),
			parentCommentId: parentCommentId,
			commentContent: $("#replyComment").val()
		},
		dataType: "JSON",
		success: function (res) {
			if(JSON.stringify(res)=="{}") window.location.href= requestUrl + "/signin";
			$("#commentBlock").html("");
			$("#replyComment").val("");
			generateTemplate();
			setTimeout(function() {
				$("html,body").animate({
					scrollTop: $("#commentBlock h5").eq(replyIndex).offset().top
				}, 1000);
			},1000);
		}
	});
}

function reportSubmit(reportcommentid) {
	$("#reportSubmit").click(function() {
		$.ajax({
			url: requestUrl + "/reportInsert",
			method: "POST",
			data: {
				commentId: reportcommentid,
				reportContent: $("#reportContent").val(),
				reportMemberId: $("#memberId").val()
			},
			success: function() {
				$("#reportModalClick").click();
				$("#reportContent").val("");
			}
		})
	})
}

var firstComment = [];
var replyIndex = -1;
var cancelReport;
function generateTemplate() {
	$.ajax({
		url: requestUrl + "/blog/" + id,
		method: "POST",
		dataType: "JSON",
		success: function(res) {
			//console.log(res);
			let commentData = res.comments;
			cancelReport = new Array();

			// 取得第一層評論
			firstComment = [];
			for(let i=0;i<commentData.length;i++) {
				if(commentData[i].parentComment == null) {
					firstComment.push(commentData[i]);
				}
			}
			generateComment();

			$(".replyClick").click(function () {
				replyIndex = $(this).data("replyindex");
				parentCommentId = $(this).data("comment");
				parentCommentName = $(this).data("commentname");
				console.log("parentCommentId:" + parentCommentId);
				console.log("parentCommentName:" + parentCommentName);
				$("#replyComment").attr("placeholder", "@" + parentCommentName).focus();
			});
			
			clearReport();
		}
	})

	var firstTemplate = "<h5 class='media mt-4 animated fadeIn'><img width='50px' height='50px' class='d-flex mr-3 rounded-circle' src='{{comment.memberId}}'>{{comment.commentName}}</h5>{{comment.commentContent}}" +
						"<div><label for='replyComment' class='replyClick' data-replyindex={{replyindex}} data-comment='{{comment.commentId}}' data-commentname='{{comment.name}}'><a class='mgl5' href='javascript:;'>回覆</a></label>" +
						"<a class='mgl5 reportComment' data-toggle='modal' data-target='#reportModal' data-reportcommentid='{{comment.reportcommentid}}' href='javascript:;'>檢舉</a></div>";

	var secondTemplate = "<div style='padding-left: 100px'>" +
					     "<div class='media mt-4 animated fadeIn'><img width='50px' height='50px' class='d-flex mr-3 rounded-circle' src='{{comment.memberId}}'>" +
					     "<h5 class='mt-0'>{{comment.commentName}}</h5></div>" +
					     "<div>{{comment.commentContent}}</div>" +
					     "<div><label for='replyComment' class='replyClick' data-replyindex={{replyindex}} data-comment='{{comment.commentId}}' data-commentname='{{comment.name}}'><a class='mgl5' href='javascript:;'>回覆</a></label>" +
					     "<a class='reportComment' class='mgl5' data-toggle='modal' data-target='#reportModal' data-reportcommentid='{{comment.reportcommentid}}' href='javascript:;'>檢舉</a></div>";
	var tmp;
	var count = 0;
	function generateComment() {
		for(let i=0;i<firstComment.length;i++) {
			var first_html;
			if(firstComment[i].commentName) {
				first_html = firstTemplate
				.replace("{{comment.memberId}}", requestUrl + "/membergetPicture/" +firstComment[i].memberId)
				.replace("{{replyindex}}", count)
				.replace("{{comment.commentIds}}", firstComment[i].commentId)
				.replace("{{comment.commentName}}", firstComment[i].commentName)
				.replace("{{comment.commentContent}}", firstComment[i].commentContent)
				.replace("{{comment.commentId}}", firstComment[i].commentId)
				.replace("{{comment.name}}", firstComment[i].commentName)
				.replace("{{comment.reportcommentid}}", firstComment[i].commentId);
				
				if(sessionScopeMemberId == firstComment[i].memberId) {
					cancelReport.push(count);
					console.log(cancelReport);
				}
			}

			$("#commentBlock").append(first_html);
			count++;
			if(firstComment[i].replyComment.length>0) {
				tmp = firstComment[i].replyComment;
				var second_html;
				recursively(tmp);
			}
			
		}
		
		$(".reportComment").click(function() {
			if(sessionScopeMemberId==0) window.location.href = requestUrl + "/signin";
			let reportcommentid = $(this).data("reportcommentid");
			$("#reportSubmit").unbind("click");
			reportSubmit(reportcommentid);
		})
	}
	var replys;
	function recursively(tmp) {
		for(let j=0;j<tmp.length;j++) {	
			second_html = secondTemplate
				.replace("{{comment.memberId}}", requestUrl + "/membergetPicture/" +tmp[j].memberId)
				.replace("{{replyindex}}", count)
				.replace("{{comment.commentIds}}", tmp[j].commentId)
				.replace("{{comment.commentName}}", tmp[j].commentName)
				.replace("{{comment.commentContent}}", tmp[j].commentContent)
				.replace("{{comment.commentId}}", tmp[j].commentId)
				.replace("{{comment.name}}", tmp[j].commentName)
				.replace("{{comment.reportcommentid}}", tmp[j].commentId);
			
			if(sessionScopeMemberId == tmp[j].memberId) {
				console.log(count);
				cancelReport.push(count);
				console.log(cancelReport);
			}
			
			$("#commentBlock").append(second_html);
			replys = tmp[j].replyComment;
			count++;
			recursively(replys);
		}
	}
}

//cancel reportComment
function clearReport(){
	console.log("產生:" + cancelReport);
	for(let i=0;i<cancelReport.length;i++) {
		$(".reportComment").eq(cancelReport[i]).html("");
	}
}
generateTemplate();

