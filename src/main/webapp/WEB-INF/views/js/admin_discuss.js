//admin_Post
var requestUrl = "";
var table = "<tr><th scope='row'>{{post.postId}}</th>"
		+ "<td>{{post.memberId}}</td>" 
		+ "<td class='content'>{{post.postContent}}</td>"
		+ "<td>{{post.postTime}}</td>"
		+ "<td id='like{{post.postId}}'>0</td>"
		+ "<td id='report{{post.postId}}'>1</td>"
		+ "<td><button type='button' class='btn btn-danger ml-2' id='delete{{post.postId}}'>刪除</button></td>"
		+ "</tr>";

var data;
var pageNum;
var NumberOfPage;

function textContent() {
    var len = 25; // 超過字數以"..."取代
    $(".content").each(function (i) {
      if ($(this).text().length > len) {
        $(this).attr("title", $(this).text());
        var text = $(this).text().substring(0, len - 1) + "...";
        $(this).text(text);
      }
    });
  }

function refreshLikeNumber(postId) {
	$.get("Like", {
		postId : postId
	}, function(data) {
		$("#like" + postId).text(data)
	})
}

function checkNumbers(){
	$.ajax({
		url : requestUrl + "sortJson",
		method : "GET",
		dataType : "JSON",
		data : {sort : 0},
		async : false,
		success : function(postData) {
			data = postData.sortList
			for (let i = 0; i < data.length; i++) {
				let post = data[i];
				if(post.postStatus > 0){
				refreshLikeNumber(post.postId)
				refreshReportNumber(post.postId, post.postStatus)
				deleteContent(post.postId)
				}
				
			}
		}
	})
}

function refreshReportNumber(postId, postStatus){
	$("#report" + postId).text(postStatus)
}

function deleteContent(postId) {
	$("#delete" + postId).unbind().click(function() {
		if (confirm("真的要刪除此則留言嗎？")) {
			$.get("deleteContent", {
				postId : postId
			}, function() {
				$(this).attr('disabled', true);
				window.location.reload();
			})
		}
	})

}
	
function sortReportNumber(sort, page){
		$.ajax({
			url : requestUrl + "sortJson",
			method : "GET",
			dataType : "JSON",
			data : {sort : sort},
			async : false,
			success : function(sortData) {
				$("#discussTable").html("")
				let tableArea = "";
				data = sortData.sortList
				let start = (page - 1) * 8;
				let temp = data.length;
				let end = (page * 8);
				if(temp < end){
					end = temp;
				}
				for (let i = start; i < end; i++) {
					let post = data[i];
					if (post.postStatus > 0) {
						table_html = table.replace(/\{{post.memberId}}/g,
								post.memberId).replace(/\{{post.postTime}}/g,
								post.postTime).replace(/\{{post.postContent}}/g,
								post.postContent).replace(/\{{post.postId}}/g,
								post.postId)

						tableArea += table_html;

					}
				}
				$("#discussTable").append(tableArea);
				$("#numberOfReport").text("共" + temp + "則被檢舉貼文")
			}
			
			
		})
		checkNumbers()
	}

function bindsort0(pageNumNow) {
	$("#sortReport").unbind();
	$("#sortReport").click(function() {
		sortReportNumber(1,pageNumNow)
		$(this).attr("class","fa fa-angle-double-up ml-2");
		bindsort1(pageNumNow)
		$("#sortType").text(1)
		pageBtn(1, pageNum)
		pageBtnNext(1, pageNumNow, pageNum)
		textContent()
	})
}

function bindsort1(pageNumNow) {
	$("#sortReport").unbind();
	$("#sortReport").click(function() {
		sortReportNumber(0,pageNumNow)
		$(this).attr("class","fa fa-angle-double-down ml-2");
		bindsort0(pageNumNow)
		$("#sortType").text(0)
		pageBtn(0, pageNum)
		pageBtnNext(0, pageNumNow, pageNum)
		textContent()
	})
}

function bindsort2(pageNumNow) {
	$("#sortTime").unbind();
	$("#sortTime").click(function() {
		sortReportNumber(3,pageNumNow)
		$(this).attr("class","fa fa-angle-double-up ml-2");
		bindsort3(pageNumNow)
		$("#sortType").text(3)
		pageBtn(3, pageNum)
		pageBtnNext(3, pageNumNow, pageNum)
		textContent()
	})
}

function bindsort3(pageNumNow) {
	$("#sortTime").unbind();
	$("#sortTime").click(function() {
		sortReportNumber(2,pageNumNow)
		$(this).attr("class","fa fa-angle-double-down ml-2");
		bindsort2(pageNumNow)
		$("#sortType").text(2)
		pageBtn(2, pageNum)
		pageBtnNext(2, pageNumNow, pageNum)
		textContent()
	})
}

function search(){
	$("#searchContent").bind("keyup", function() {
		let searchContent = $("#searchContent").val().toLowerCase();
		$(".content").each(function(){
			var content = $(this).text();
			var ignoreCaseContent = content.toLowerCase();
			if(ignoreCaseContent.indexOf(searchContent) == -1){
				$(this).parent().hide();
			}else{
				$(this).parent().show();
			}
		})
	})
	textContent()
}

function pageBtn(sortType, pageNum){
	for (let i = 1; i <= pageNum; i++) {
		$("#page" + i).click(function(){
			$("#searchContent").val("")
			sortReportNumber(sortType,i)
			$("#pageNumNow").text(i)
			checkPageBtn()
			pageBtnPrevious(sortType, i, pageNum)
			pageBtnNext(sortType, i, pageNum)
		})
	}
	textContent()
}

function checkPageBtn(){
	let checkPage = $("#pageNumNow").text();
	$("#reportPage li").not("li:last-child").not("li:first-child").attr("class","page-item")
	$("#page" + checkPage).parent().attr("class","page-item active")
}

function pageBtnNext(sortType, pageNumNow, pageNum){
	if(pageNumNow < pageNum){
		$("#Next").parent().attr("class","page-item");
		$("#Next").unbind().click(function(){
			var count = pageNumNow*1+1*1;
			console.log("pageNum == " + count)
			$("#pageNumNow").text(count)
			sortReportNumber(sortType, count);
			pageBtnPrevious(sortType, count, pageNum)
			pageBtnNext(sortType, count, pageNum)
		})
	}else if(pageNumNow == pageNum){
		$("#Next").parent().attr("class","page-item disabled");
	}
	checkPageBtn()
	textContent()
}

function pageBtnPrevious(sortType, pageNumNow, pageNum){
	if(pageNumNow > 1){
		$("#Previous").parent().attr("class","page-item");
		$("#Previous").unbind().click(function(){
			var count = pageNumNow*1-1*1;
			console.log("pageNum == " + count)
			$("#pageNumNow").text(count)
			sortReportNumber(sortType, count);
			pageBtnPrevious(sortType, count, pageNum)
			pageBtnNext(sortType, count, pageNum)
		})
	}else if(pageNumNow == 1){
		$("#Previous").parent().attr("class","page-item disabled");
	}
	checkPageBtn()
	textContent()
}

$(document).ready(function(){
	pageNum = $("#pageNum").text();
	pageNumNow = $("#pageNumNow").text();
	sortType = $("#sortType").text();
	sortReportNumber(sortType,pageNumNow)
	checkNumbers();
	bindsort0(pageNumNow);
	bindsort2(pageNumNow);
	search();
	pageBtn(sortType, pageNum)
	pageBtnNext(sortType, pageNumNow, pageNum)
	$("#pageNumNow").change(function(){
		pageBtnNext(sortType,$(this).val() , pageNum);
		pageBtnPrevious(sortType, $(this).val(), pageNum)
	})
	$("#page1").parent().attr("class","page-item active")
	textContent()
})