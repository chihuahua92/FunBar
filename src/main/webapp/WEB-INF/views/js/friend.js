var friendshipListTable = "<tr class='list'><th scope='row'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.id}}'></th>"
		+ "<td class='contentName'>{{member.memberName}}</td>" 
		+ "<td>{{member.memberBirth}}</td>"
		+ "<td>{{member.memberEmail}}</td>"
		+ "<td><button type='button' class='btn btn-info' id='unBlockBtn{{member.id}}' style='display:none'>unBlock</button>"
		+ "<button type='button' class='btn btn-warning ml-2' id='blockBtn{{member.id}}' style='display:none'>Block</button>" 
		+ "<button type='button' class='btn btn-danger ml-2' id='deleteBtn{{member.id}}' style='display:none'>Delete</button>" 
		+ "</td></tr>"

var receiverTable = "<tr class='list' id='list{{member.id}}'><th scope='row'>"
		+ "<img class='card-img-top rounded-circle' style='height: 40px; width: 40px' src='{{requestUrl}}membergetPicture/{{member.id}}'></th>"
		+ "<td class='contentName'>{{member.memberName}}</td>"
		+ "<td>{{member.memberBirth}}</td>"
		+ "<td><button type='button' class='btn btn-info' id='confirmbtn{{member.id}}'>Confirm</button>"
		+ "<button type='button' class='btn btn-danger ml-2' id='cancelbtn{{member.id}}'>Cancel</button></td></tr>"

var requestUrl = ""
var loginMemberName = $('#loginMemberName').text();
var loginMemberid = $('#loginMemberid').text();

var mbrData = null;

function getMemberData() {
	var mdata = null;
	$.ajax({
		url : requestUrl + "getAllMemberJson",
		method : "POST",
		dataType : "JSON",
		async : false,
		success : function(memberData) {
			mdata = memberData.Member;

		}
	})
	return mdata;
}

function init() {
						requestUrl = $('#requestUrl').text();
						mdata = getMemberData();

						$.ajax({
								url : requestUrl + "friendJson",
								method : "POST",
								dataType : "JSON",
								async : false,
								success : function(friendData) {
									var count = 0;
									let receiverTableArea = "";
									let friendshipListTableArea = "";
									var fdata = friendData.friend;
									
									for (let j = 0; j < mdata.length; j++) {
										let member = mdata[j];
										if(member.memberName != loginMemberName){
											for(let i = 0; i < fdata.length; i++) {
													let friend = fdata[i];
											if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 2) {
												let temp = member.memberBirth.slice(5)
												friendshipListTable_html = friendshipListTable
																			.replace(/\{{member.memberName}}/g, member.memberName)
																			.replace(/\{{member.memberBirth}}/g, temp)
																			.replace(/\{{member.memberEmail}}/g, member.memberEmail)
																			.replace(/\{{member.id}}/g, member.id)
																			.replace(/\{{requestUrl}}/g, requestUrl);
												
												console.log("memberId == " + member.id)
												console.log("Status == " + friend.friendStatus)
												console.log("MemberName == " + member.memberName)

													friendshipListTableArea += friendshipListTable_html
												
											}else if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 3){
												let temp = member.memberBirth.slice(5)
												friendshipListTable_html = friendshipListTable
															.replace(/\{{member.memberName}}/g, member.memberName)
															.replace(/\{{member.memberBirth}}/g, temp)
															.replace(/\{{member.memberEmail}}/g, member.memberEmail)
															.replace(/\{{member.id}}/g, member.id)
															.replace(/\{{requestUrl}}/g, requestUrl);
												
												friendshipListTableArea += friendshipListTable_html
												
											}else if (loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 1){
													$("#friendRequest" + member.id).text("Confirm");
													let temp2 = member.memberBirth.slice(5)
													receiverTable_html = receiverTable
																		.replace(/\{{member.id}}/g, member.id)
																		.replace(/\{{member.memberName}}/g, member.memberName)	
																		.replace(/\{{member.memberBirth}}/g, temp2)
																		.replace(/\{{member.id}}/g, member.id)
																		.replace(/\{{requestUrl}}/g, requestUrl);

																receiverTableArea += receiverTable_html;
																count++;
													}
											}							
										}
									}

										$("#friendshipTable").html("").append(receiverTableArea);
										$("#friendshipList").html("").append(friendshipListTableArea);
										$("#friendRequest" + loginMemberid).text(count);
										$("#friendRequest2" + loginMemberid).text(count);
										for (let j = 0; j < mdata.length; j++) {
											let member = mdata[j];
											if(member.id != loginMemberid){
												for(let i = 0; i < fdata.length; i++) {
														let friend = fdata[i];
												if(loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 1) {
														confirmFriendRequest(loginMemberid, member.id)
														cancelFriendRequest(member.id)
													}else if(loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 2) {
														blockFriend(loginMemberid, member.id)
														deleteFriend(loginMemberid, member.id)
													}else if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus == 3) {
														unBlockBtn(member.id)
														deleteFriend(loginMemberid, member.id)
													}else if(loginMemberid == friend.sender_memberId && member.id == friend.receiver_memberId && friend.friendStatus > 3 && friend.friendStatus < 5) {
														deleteFriend(loginMemberid, member.id)
													}else if(loginMemberid == friend.receiver_memberId && member.id == friend.sender_memberId && friend.friendStatus == 5 ) {
														unBlockBtn(member.id)
														$("#deleteBtn" + member.id).show().unbind().attr("disabled", true);
													}
												
												}
											}
										}
								}
							})
						searchName()
				}

$(document).ready(function(){
	init();
	
//	$('.list:lt(10)').animate({'opacity':'1'},1000);
//	//Test
//	$(window).scroll( function(){
//	$('.list').each( function(){
//        
//        var bottom_of_object = $(this).offset().top + $(this).outerHeight();
//        var bottom_of_window = $(window).scrollTop() + $(window).height();
//        console.log("bottom_of_object == " +  bottom_of_object)
//        console.log("bottom_of_window == " + bottom_of_window)
//        
//        /* If the object is completely visible in the window, fade it it */
//        if( bottom_of_window > bottom_of_object ){
//            console.log("有捲動到")
//            $(this).animate({'opacity':'1'},1000);
//                
//        }
//        
//    }); 
//})
})

function confirmFriendRequest(loginMemberid, memberIdf) {
	$("#confirmbtn" + memberIdf).unbind().click(function() {
		var status = 2;
		var check = 2;
		$.ajax({
			url : requestUrl + "confirmFriendRequest",
			method : "GET",
			dataType : "JSON",
			data : {
				memberId : loginMemberid,
				memberIdf : memberIdf,
				friendStatus : status,
				check : check
			},
			async : false,
			success : function() {
		
	}
			
})
			$(this).text("Friend")
			$(this).attr('disabled', true);
			$("#cancelbtn" + memberIdf).hide()
})
}

function cancelFriendRequest(memberIdf){
	$("#cancelbtn" + memberIdf).unbind().click(function() {
		$.ajax({
			url : requestUrl + "cancelFriendRequest",
			method : "GET",
			dataType : "JSON",
			data : {
				sender_memberId : memberIdf,
				receiver_memberId : loginMemberid
			},
			async : false,
			success : function() {
				
			}
	})
	$("#list" + memberIdf).hide();
		init()
	
})
}

function blockFriend(loginMemberid, memberIdf){
	$("#blockBtn" + memberIdf).show().unbind().click(function() {
		var status = 4;
		var check = 3;
		$.ajax({
			url : requestUrl + "confirmFriendRequest",
			method : "GET",
			dataType : "JSON",
			data : {
				memberId : loginMemberid,
				memberIdf : memberIdf,
				friendStatus : status,
				check : check
			},
			async : false,
			success : function() {
			}
	})
	$(this).attr("disabled", true);
		init();
})
}

function unBlockBtn(memberIdf){
	$("#unBlockBtn" + memberIdf).show().unbind().click(function() {
		var status = 2;
		var check = 4;
		$.ajax({
			url : requestUrl + "confirmFriendRequest",
			method : "GET",
			dataType : "JSON",
			data : {
				memberId : loginMemberid,
				memberIdf : memberIdf,
				friendStatus : status,
				check : check
			},
			async : false,
			success : function() {
			}
	})
	$(this).attr("disabled", true);
		init()
})
}

function deleteFriend(loginMemberid, memberIdf){
	$("#deleteBtn" + memberIdf).show().unbind().click(function() {
		$.ajax({
			url : requestUrl + "deleteFriend",
			method : "GET",
			dataType : "JSON",
			data : {
				sender_memberId : loginMemberid,
				receiver_memberId : memberIdf
			},
			async : false,
			success : function() {
			}
	})
	$(this).attr("disabled", true);
		init()
})
}


function searchName(){
	$("#searchName").bind("keyup", function() {
		let searchName = $("#searchName").val().toLowerCase();
		$(".contentName").each(function(){
			var contentName = $(this).text();
			var ignoreCaseContentName = contentName.toLowerCase();
			console.log("Search == " + searchName)
			console.log("Search == " + ignoreCaseContentName)
			console.log("Search Result == " + ignoreCaseContentName.indexOf(searchName) == -1)
			if(ignoreCaseContentName.indexOf(searchName) == -1){
				$(this).parent().hide();
			}else{
				$(this).parent().show();
			}
		})
	})
}