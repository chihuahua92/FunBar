//Post area

var newPost = "<div class='card-header'>Create Post</div>"
		+ "<div class='media p-4 bg-light'>" 
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{sessionScope.member.id}}'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'>"
		+ "<textarea id='createPostContent' name='postContent' class='form-control mt-1' placeholder='What is on your mind, {{sessionScope.member.memberName}} ?'></textarea>"
		+ "<input id='createMemberId' name='memberId' class='form-control' type='hidden' value='{{sessionScope.member.id}}'></input>"
		+ "<div class='text-right'><button class='btn btn-info lg mt-3' type='button' name='submitPost' id='createPostBtn'>POST</button></div>"
		+ "</div></div>";

var firstLevelComment = "<div class='card firstComment{{post.memberId}} mb-4' style='display:none;'>"
		+ "<div class='media p-4 bg-light'>" 
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{post.memberId}}'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0' id='firstCommentBody{{post.postId}}'>"
		+ "<a href='' class='text-primary'><h5 class='memberName{{post.memberId}}'></h5></a>"
		+ "<div class='media-date'>{{post.postTime}}"
		+ "<button type='button' id='drop{{post.postId}}' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#edit{{post.postId}}'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#delete{{post.postId}}'>Delete</a>"
		+ "<a class='dropdown-item' id='report{{post.postId}}' href='#report{{post.postId}}'>Report</a>"
		+ "</div></div>"
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 mr-4 post-description'>{{post.postContent}}</div></blockquote>"
		+ "</form>"
		+ "<form method='post' action='replyComment'>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}' style='font-size:20px;'></div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-danger' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "<a class='btn btn-outline-success btn-circle ml-2 text-uppercase' data-toggle='collapse' href='#comment{{post.postId}}'>"
		+ "<span class='glyphicon glyphicon-comment' id='commentCount{{post.postId}}'>0 comment</span></a>"
		+ "<a class='btn btn-outline-info btn-circle ml-2 text-uppercase' href='#replyComment{{post.postId}}' data-toggle='collapse' id='reply'>"
		+ "<span class='glyphicon glyphicon-share-alt'>Reply</span></a>"
		+ "<div class='collapse' id='replyComment{{post.postId}}'>"
		+ "<div class='input-group card-body'>"
		+ "<input id='postContent' name='postContent' class='form-control' type='text' placeholder='Reply...'></input>"
		+ "<input id='parentPostId' name='parentPostId' class='form-control' type='hidden' value='{{post.postId}}'></input>"
		+ "<input id='memberId' name='memberId' class='form-control' type='hidden' value='{{sessionScope.member.id}}'></input>"
		+ "<button class='btn btn-info' type='submit' name='submitPost' id='replyPost{{post.postId}}'>Post</button>"
		+ "</div></div></div></form></div></div></div>";

var level = "<div class='collapse' id='comment{{post.postId}}'>"

var secondLevelComment = "<div class='card mt-3' id='secondComment'>"
		+ "<div class='media p-4 bg-light'>" 
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{post.memberId}}'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'id='secondCommentBody{{post.postId}}' >"
		+ "<a href='' class='text-primary'><h5 class='memberName{{post.memberId}}'></h5></a>"
		+ "<div class='media-date'>{{post.postTime}}"
		+ "<button type='button' id='drop{{post.postId}}' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#edit{{post.postId}}'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#delete{{post.postId}}'>Delete</a>"
		+ "<a class='dropdown-item' id='report{{post.postId}}' href='#report{{post.postId}}'>Report</a>"
		+ "</div></div>"
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 post-description'>{{post.postContent}}</div></blockquote>"
		+ "</form>"
		+ "<form method='post' action='replyComment'>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}' style='font-size:20px;'></div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-danger' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "<a class='btn btn-outline-success btn-circle ml-2 text-uppercase' data-toggle='collapse' href='#comment{{post.postId}}'>"
		+ "<span class='glyphicon glyphicon-comment' id='commentCount{{post.postId}}'>0 comment</span></a>"
		+ "<a class='btn btn-outline-info btn-circle ml-2 text-uppercase' href='#replyComment{{post.postId}}' data-toggle='collapse' id='reply'>"
		+ "<span class='glyphicon glyphicon-share-alt'></span>Reply</a><div class='collapse' id='replyComment{{post.postId}}'>"
		+ "<div class='input-group card-body'>"
		+ "<input id='postContent' name='postContent' class='form-control' type='text' placeholder='Reply...'></input>"
		+ "<input id='parentPostId' name='parentPostId' class='form-control' type='hidden' value='{{post.postId}}'></input>"
		+ "<input id='memberId' name='memberId' class='form-control' type='hidden' value='{{sessionScope.member.id}}'></input>"
		+ "<button class='btn btn-info' type='submit' name='submitPost' onclick='reloadPage()'>Post</button>"
		+ "</div></div></form></div></div></div></div>";

var thirdLevelComment = "<div class='card mt-3 ml-5' id='thirdComment'>"
		+ "<div class='media p-4 bg-light'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{post.memberId}}'>"
		+ "<div class='media-body text-md-left ml-md-2 ml-0'>"
		+ "<a href='' class='text-primary'><h5 class='memberName{{post.memberId}}'></h5></a>"
		+ "<div class='media-date'>{{post.postTime}}<button type='button' id='drop{{post.postId}}' class='btn-sm ml-2 btn-secondary dropdown-toggle' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'></button>"
		+ "<div class='dropdown-menu'><a class='dropdown-item' id='edit{{post.postId}}' href='#edit{{post.postId}}'>Edit</a>"
		+ "<a class='dropdown-item' id='delete{{post.postId}}' href='#delete{{post.postId}}'>Delete</a>"
		+ "<a class='dropdown-item' id='report{{post.postId}}' href='#report{{post.postId}}'>Report</a>"
		+ "</div></div> "
		+ "<form method='post' action='updateContent'>"
		+ "<blockquote class='blockquote mb-5'><div id='postContent{{post.postId}}' class='font-weight-bold mt-2 post-description'>{{post.postContent}}</div></blockquote>"
		+ "</form>"
		+ "<div class='text-right'>"
		+ "<div class='position:absolute; mr-2' id='likeCount{{post.postId}}' style='font-size:20px;'></div>"
		+ "<button id='likebtn{{post.postId}}' type='button' class='btn btn-outline-danger' value='{{post.postId}}'>"
		+ "<span id='likeStatus{{post.postId}}'>Like</span></button>"
		+ "<button type='button' style='display:none' value='{{post.memberId}}'></button>"
		+ "</div></div></div></div>";

var requestUrl = "";
var loginMemberName = $('#loginMemberName').text();
var loginMemberid = $('#loginMemberid').text();

var data;
var firstLevelComment_html = null;
var secondLevelComment_html = null;
var secondLevel_html = null;
var thirdLevelComment_html = null;
var thirdLevel_html = null;
var like;
var mdata;
var pdata;

function refreshAllPost(){
$.ajax({
	url : requestUrl + "discussJson",
	method : "POST",
	dataType : "JSON",
	async : false,
	success : function(postData) {

		newPost_html = newPost.replace(/\{{sessionScope.member.memberName}}/g, loginMemberName)
							  .replace(/\{{sessionScope.member.id}}/g, loginMemberid)
							  .replace(/\{{requestUrl}}/g, requestUrl)
						
		$("#newPost").html("").append(newPost_html);
		data = postData.Post
		$("#firstLevelComment").html("")
		for (let i = 0; i < data.length; i++) {
			let post = data[i];

			if (post.parentPostId == null && post.postStatus == 0) {
				firstLevelComment_html = firstLevelComment
									.replace(/\{{post.memberId}}/g, post.memberId)
									.replace(/\{{post.postTime}}/g, post.postTime)
									.replace(/\{{post.postContent}}/g, post.postContent)
									.replace(/\{{post.postId}}/g, post.postId)
									.replace(/\{{sessionScope.member.memberName}}/g,loginMemberName)
									.replace(/\{{sessionScope.member.id}}/g, loginMemberid)
									.replace(/\{{requestUrl}}/g, requestUrl)

				$("#firstLevelComment").append(firstLevelComment_html);

				if(loginMemberid == post.memberId){
					$(".firstComment" + loginMemberid).show();
				}
				
				if (post.replyPost.length > 0 ) {
					let second = "";
					let commentPostId = "";

					for (let j = 0; j < post.replyPost.length; j++) {
						let comment = post.replyPost[j];
					
						secondLevelComment_html = secondLevelComment
								.replace(/\{{post.parentPostId}}/g, comment.parentPostId)
								.replace(/\{{post.memberId}}/g, comment.memberId)
								.replace(/\{{post.postTime}}/g, comment.postTime)
								.replace(/\{{post.postContent}}/g, comment.postContent)
								.replace(/\{{post.postId}}/g, comment.postId)
								.replace(/\{{sessionScope.member.memberName}}/g,loginMemberName)
								.replace(/\{{sessionScope.member.id}}/g, loginMemberid)
								.replace(/\{{requestUrl}}/g, requestUrl)
								
								second += secondLevelComment_html;

//						if (comment.replyPost.length > 0) {
//							let third = "";
//							for (let k = 0; k < comment.replyPost.length; k++) {
//								let thirdComment = comment.replyPost[k];
//
//								thirdLevelComment_html = thirdLevelComment
//										.replace(/\{{post.parentPostId}}/g, thirdComment.parentPostId)
//										.replace(/\{{post.memberId}}/g, thirdComment.memberId)
//										.replace(/\{{post.postTime}}/g, thirdComment.postTime)
//										.replace(/\{{post.postContent}}/g, thirdComment.postContent)
//										.replace(/\{{post.postId}}/g, thirdComment.postId)
//										.replace(/\{{sessionScope.member.memberName}}/g,loginMemberName)
//										.replace(/\{{sessionScope.member.id}}/g, loginMemberid)
//										.replace(/\{{requestUrl}}/g, requestUrl)
//
//								third += thirdLevelComment_html;
//
//							}
//
//							thirdLevel_html = level.replace(/\{{post.postId}}/g, comment.postId)
//							thirdLevel_html = thirdLevel_html + third;
//
//							commentPostId = comment.postId;
//
//						}

						

					}

					secondLevel_html = level.replace(/\{{post.postId}}/g, post.postId)
					secondLevel_html = secondLevel_html + second;

					$("#firstCommentBody" + post.postId).append(secondLevel_html);
//					$("#secondCommentBody" + commentPostId).append(thirdLevel_html);

				}
			}

		}
		
	}
})
}

function thirdLevel(){
	$.ajax({
		url : requestUrl + "discussJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(postData) {
			data = postData.Post

			for (let i = 0; i < data.length; i++) {
				let post = data[i];

				if (post.parentPostId == null && post.postStatus == 0) {
					if (post.replyPost.length > 0) {
						let second = "";
						let commentPostId = "";

						for (let j = 0; j < post.replyPost.length; j++) {
							let comment = post.replyPost[j];
							
							if (comment.replyPost.length > 0) {
								let third = "";
								for (let k = 0; k < comment.replyPost.length; k++) {
									let thirdComment = comment.replyPost[k];
									
									
									thirdLevelComment_html = thirdLevelComment
									.replace(/\{{post.parentPostId}}/g, thirdComment.parentPostId)
									.replace(/\{{post.memberId}}/g, thirdComment.memberId)
									.replace(/\{{post.postTime}}/g, thirdComment.postTime)
									.replace(/\{{post.postContent}}/g, thirdComment.postContent)
									.replace(/\{{post.postId}}/g, thirdComment.postId)
									.replace(/\{{sessionScope.member.memberName}}/g,loginMemberName)
									.replace(/\{{sessionScope.member.id}}/g, loginMemberid)
									.replace(/\{{requestUrl}}/g, requestUrl)

										third += thirdLevelComment_html;
									
								}
								thirdLevel_html = level.replace(/\{{post.postId}}/g, comment.postId)
								thirdLevel_html = thirdLevel_html + third;

								commentPostId = comment.postId;
								
								$("#secondCommentBody" + commentPostId).append(thirdLevel_html);
							}
						}
					}
				}
			}
		}
	})
}

function checkAllBtn(){
	$.ajax({
		url : requestUrl + "discussJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(postData) {
			for (let i = 0; i < data.length; i++) {
				let post = data[i];
				
				checkLikeBtn(post.postId)
				refreshCommentNumber(post.postId, post.replyPost.length)
				editContent(post.postId, post.postContent)
				deleteContent(post.postId)
				checkDropBtn(post.postId, loginMemberid, post.memberId)
				reportContent(post.postId)
				
			}
		}
	})
}


function showFriendsPost(){
$.ajax({
		url : requestUrl + "friendJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(friendData) {
			fdata = friendData.friend
			for (let i = 0; i < fdata.length; i++) {
				let friend = fdata[i];
				if(friend.sender_memberId == loginMemberid && friend.friendStatus == 2){
					$(".firstComment" + friend.receiver_memberId).show();
				}
			}
		}
	})
}

function getAllMemberName(){
	$.ajax({
		url : requestUrl + "allMemberJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(allMemberData) {
			var allMember = allMemberData.allMember
			for (let i = 0; i < allMember.length; i++) {
				let member = allMember[i];
				$(".memberName" + member.id).text(member.memberName);
			}
		}
	})
}

// like 
function refreshLikeNumber(postId) {
	$.get("Like", {
		postId : postId
	}, function(data) {
		$("#likeCount" + postId).html(data + "&nbsp;<i class='fa fa-heart' style='color:red; font-size:20px'></i>")
	})
}

function addLike(postId, memberId) {
	$("#likebtn" + postId).unbind();
	$("#likebtn" + postId).mousedown(function() {
		$.ajax({
			url : requestUrl + "addLike",
			data : {postId : postId, memberId : memberId},
			async : false,
			success : function() {
			}
		})
	})
	$("#likebtn" + postId).mouseup(function() {
		$(this).text("unLike");
		$(this).attr("id","unLikebtn" + postId);
		$(this).unbind();
		unLike(postId, loginMemberid);
		refreshLikeNumber(postId);
	})
}
function unLike(postId, memberId) {
	$("#unLikebtn" + postId).unbind();
	$("#unLikebtn" + postId).mousedown(function() {
		$.ajax({
			url : requestUrl + "unLike",
			data : {postId : postId, memberId : memberId},
			async:false,
			success : function() {
			}
		})
	})
	$("#unLikebtn" + postId).mouseup(function() {
		$(this).text("Like");
		$(this).attr("id","likebtn" + postId);
		$(this).unbind();
		addLike(postId, loginMemberid);
		refreshLikeNumber(postId);
	})
}

function checkLikeBtn(postId){
	$.ajax({
		url : requestUrl + "likeJson",
		method : "POST",
		dataType : "JSON",
		data : { memberId : loginMemberid },
		async : false,
		success : function(likeData) {
			like = likeData.like
			if(like.length == 0){
				addLike(postId, loginMemberid)
			}else{
			for (let i = 0; i < like.length; i++) {
				let likes = like[i];
				if(likes.likePK.postId == postId){
					$("#likebtn" + postId).text("unLike").attr("id", "unLikebtn" + postId)
					unLike(postId, loginMemberid)
					}
				}
			}
			refreshLikeNumber(postId);
		}
	})
	addLike(postId, loginMemberid)	
}


function editContent(postId, postContent) {
	$("#edit" + postId).unbind().click(function() {
						$("#postContent" + postId).html("<textarea id='editPost' name='postContent' class='form-control mt-3'>"
												+ postContent
												+ "</textarea>"
												+ "<div class='text-right mt-2'><button class='btn btn-primary' type='button' name='editContent' id='edit'>Edit</button>"
												+ "<button class='btn btn-warning ml-2' name='cancel' id='cancel"
												+ postId
												+ "'>Cancel</button></div>");
						$("#cancel" + postId).click(function() {
							$("#postContent" + postId).html(postContent);
						})
						
						$("#edit").click(function(){
							var editPost = $("#editPost").val();
							$.ajax({
								url : requestUrl + "updateContent",
								method : "POST",
								dataType : "JSON",
								data : {postContent : editPost, postId : postId},
								async:false,
								success : function() {
									init();
				
								}
						})	

					})
		})
}

function checkDropBtn(postId, loginMemberid, memberId){
	if(loginMemberid != memberId){
		$("#delete" + postId).hide();
		$("#edit" + postId).hide();
	}else if(loginMemberid == memberId){
		$("#report" + postId).hide();
	}
	
}

function reportContent(postId) {
	$("#report" + postId).unbind().click(function() {
		if (confirm("真的要檢舉此則留言為不當留言嗎？")) {
			$.get("reportContent", {
				postId : postId
			}, function() {
				$(this).attr('disabled', true);
			})	
		}
	})
}

function deleteContent(postId) {
	$("#delete" + postId).unbind().click(function() {
		if (confirm("真的要刪除此則留言嗎？")) {
			$.get("deleteContent", {
				postId : postId
			}, function() {
				window.location.reload();
			})
		}
	})

}

function refreshCommentNumber(postId, commentCount) {
	$("#commentCount" + postId).text(commentCount + "  Comments");

}


var memberList = "<div class='list-group-item justify-content-between align-items-center' style='position:relative' id='div{{member.memberId}}'>"
				+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.memberId}}'>"
				+ "<span class='ml-3'>{{member.memberName}}</span><button class='badge badge-primary badge-pill btn-primary btn-sm' style='position:absolute; right:10px; top:23px;' id='friendRequest{{member.memberId}}'>"
				+ "{{friendStatus}}</button></div>";


function init(){
	requestUrl = $('#requestUrl').text();
	fdata = getFriendShip();
	refreshAllPost();
	showFriendsPost();
	thirdLevel();
	getAllMemberName();
	checkAllBtn();
	createPostBtn()
	$("#searchMember").mousedown(function(){
$.ajax({
	url : requestUrl + "memberJson",
	method : "POST",
	dataType : "JSON",
	data : {memberName : $("#searchMemberName").val()},
	async : false,
	success : function(memberData) {
					$("#searchResult").empty();
					var searchMemberName = $("#searchMemberName").val();
					let memberListAll = "";
					mdata = memberData.member
					if(searchMemberName.length != 0){
					for (let i = 0; i < mdata.length; i++) {
						let member = mdata[i];
						if(member.memberName != loginMemberName){

									memberList_html = memberList.replace(/\{{member.memberName}}/g, member.memberName)
																.replace(/\{{member.memberId}}/g, member.id)
																.replace(/\{{friendStatus}}/g, "")
																.replace(/\{{requestUrl}}/g, requestUrl)
																
									memberListAll += memberList_html
						}

					}
					$("#searchResult").html("").append(memberListAll);
					
			}
	}
})

$("#searchMember").mouseup(function(){
	fdata = getFriendShip();
					for (let j = 0; j < mdata.length; j++) {
							let member = mdata[j];
							if(member.id != loginMemberid){
								sendFriendRequest(loginMemberid, member.id);
								for(let i = 0; i < fdata.length; i++) {
										let friend = fdata[i];
								if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 2) {
									$("#friendRequest" + member.id).text("Friend").attr("class" , "badge badge-primary badge-pill btn btn-success btn-sm");
									$("#friendRequest" + member.id).attr('disabled', true);
								} else if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 1) {
									$("#friendRequest" + member.id).text("Sent")
									$("#friendRequest" + member.id).attr('disabled', true);
									} else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 1){
										$("#friendRequest" + member.id).text("Confirm").attr("class" , "badge badge-primary badge-pill btn btn-info btn-sm");
										confirmFriendRequest(loginMemberid, friend.sender_memberId);
									}  else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus > 3){
										$("#friendRequest" + member.id).text("Blocked").attr("class" , "badge badge-primary badge-pill btn btn-danger btn-sm");
										$("#friendRequest" + member.id).attr('disabled', true);
									}else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 3){
										$("#div" + member.id).hide();
									}
									
							}
															
					}
							
				}
})

})




}

$(document).ready(function(){
	init()
//	$('.card:lt(4)').animate({'opacity':'1'},1000);
//	//Test
//	$(window).scroll( function(){
//	$('.card').each( function(){
//        
//        var bottom_of_object = $(this).offset().top + $(this).outerHeight();
//        var bottom_of_window = $(window).scrollTop() + $(window).height();
//        
//        /* If the object is completely visible in the window, fade it it */
//        if( bottom_of_window > bottom_of_object ){
//
//            $(this).animate({'opacity':'1'},1000);
//                
//        }
//        
//    }); 
//})
})

function sendFriendRequest(memberId, memberIdf) {
	$("#friendRequest" + memberIdf).text("Add Friend")
	$("#friendRequest" + memberIdf).unbind().click(function() {
		$.get("sendFriendRequest", {
			memberId : memberId,
			memberIdf : memberIdf
		}, function() {
		})
		$(this).text("Sent")
		$(this).attr('disabled', true);
	})
}

function confirmFriendRequest(loginMemberid, memberIdf) {
	$("#friendRequest" + memberIdf).unbind().click(function() {
		var status = 2;
		var check = 2;
		$.get("confirmFriendRequest", {
			memberId : loginMemberid,
			memberIdf : memberIdf,
			friendStatus : status,
			check : check
		}, function() {
		})
		$(this).text("Friend")
		$(this).attr('disabled', true);
	})
}

function getMemberById(memberid){
	mdata = memberData.member
	for (let i = 0; i < mdata.length; i++) {
		let member = mdata[i];
		if(member.id == memberid){
			
		}
	}
}


function getFriendShip(){
	$.ajax({
		url : requestUrl + "friendJson",
		method : "POST",
		dataType : "JSON",
		async:false,
		success : function(friendData) {
			fdata = friendData.friend
			var count = 0;
			for (let i = 0; i < fdata.length; i++) {
				let friend = fdata[i];
				if(friend.receiver_memberId == loginMemberid && friend.friendStatus == 1){
					count++;
				}
			}
			if(count != 0 ){
			$("#friendRequest" + loginMemberid).text(count);
			}
		}
	})
	return fdata;
}

//Test
function createPostBtn(){
	$("#createPostBtn").click(function(){
		var createPostContent = $("#createPostContent").val();
		var createMemberId = $("#createMemberId").val();
		$.ajax({
			url : requestUrl + "createPost",
			method : "POST",
			dataType : "JSON",
			data : { memberId : createMemberId, postContent : createPostContent},
			async:false,
			success : function() {
				init();
				
			}
		})
	})
}

//function replyPost(){
//	$("#replyPost").click(function(){
//		
//		$.ajax({
//			url : requestUrl + "createPost",
//			method : "POST",
//			dataType : "JSON",
//			data : { memberId : createMemberId, postContent : createPostContent},
//			async:false,
//			success : function() {
//				init();
//				
//			}
//		})
//	})
//}

//else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 3){
//	$("#friendRequest" + member.id).text("Friend").attr("class" , "badge badge-primary badge-pill btn btn-success btn-sm");
//	$("#friendRequest" + member.id).attr('disabled', true);
//}