package tw.FunBar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.FunBar.chat.ParticipantRepository;
import tw.FunBar.model.Friendship;
import tw.FunBar.model.LikePK;
import tw.FunBar.model.LikePost;
import tw.FunBar.model.Member;
import tw.FunBar.model.Post;
import tw.FunBar.service.DiscussService;
import tw.FunBar.service.MemberService;

@Controller
public class DiscussController {

	@Autowired
	DiscussService service;

	@Autowired
	MemberService memberService;

	@Autowired
	private ParticipantRepository participantRepository;
//	@Autowired
//	private SimpMessagingTemplate messagingTemplate;
	
	private Integer contentNum = 6;

	@RequestMapping(value = "/discuss", method = RequestMethod.GET)
	public String discuss(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member == null)
			return "redirect:/signin";
		participantRepository.add(member.getId(), member);
		//上下線不能用同個channel
//		messagingTemplate.convertAndSend("/topic/friends/participants", participantRepository.getActiveMember().values());
		model.addAttribute("title", "討論區");
		model.addAttribute("member", member);
		return "discuss";
	}

	@RequestMapping(value = "/discussJson", produces = "application/json")
	public String discussJson(Model model) {
		List<Post> postList = service.getAllPostDetail();
		model.addAttribute("Post", postList);
		return "discussJson";
	}

	@RequestMapping(value = "createPost", method = RequestMethod.POST)
	public void createPost(@RequestParam String postContent, @RequestParam Integer memberId) {
		Post post = new Post();
		post.setPostContent(postContent);
		post.setMemberId(memberId);
		service.createPost(post);
//		return "redirect:/discuss";
	}

	@RequestMapping(value = "replyComment", method = RequestMethod.POST)
	public String replyComment(@RequestParam String postContent, @RequestParam Integer parentPostId,
			@RequestParam Integer memberId) {
		Post parentPost = service.findByIdPost(parentPostId);
		Post post = new Post();
		post.setPostContent(postContent);
		post.setParentPostId(parentPost);
		post.setMemberId(memberId);
		service.createPost(post);
		return "redirect:/discuss";
	}

	@RequestMapping(value = "updateContent", method = RequestMethod.POST)
	public void updateContent(@RequestParam String postContent, @RequestParam Integer postId) {
		Post post = new Post();
		post.setPostContent(postContent);
		post.setPostId(postId);
		service.updatePostContent(post);
//		return "redirect:/discuss";
	}

	@RequestMapping(value = "reportContent", method = RequestMethod.GET)
	public String reportContent(@RequestParam Integer postId) {
		Post temp = service.getPostById(postId);
		Integer status = temp.getPostStatus();
		Post post = new Post();
		post.setPostId(postId);
		status++;
		post.setPostStatus(status);
		service.reportPostContent(post);
		return "redirect:/discuss";
	}

	@RequestMapping(value = "deleteContent", method = RequestMethod.GET)
	public String deleteContent(@RequestParam Integer postId) {
		Post post = service.getPostById(postId);
		service.deletePostContent(post);
		return "redirect:/discuss";
	}

	@RequestMapping(value = "/likeJson", produces = "application/json")
	public String likeJson(@RequestParam(value = "memberId") Integer memberId, Model model) {
		List<LikePost> likeList = service.getLikesById(memberId);
		model.addAttribute("like", likeList);
		return "likeJson";
	}

	@GetMapping(value = "Like")
	public @ResponseBody long getLikes(@RequestParam(value = "postId") Integer postId) {
		long count = service.getLikeByPostId(postId);
		return count;
	}

	@GetMapping(value = "addLike")
	public @ResponseBody void addLike(@RequestParam(value = "postId") Integer postId,
			@RequestParam(value = "memberId") Integer memberId) {
		Post post = service.findByIdPost(postId);
		LikePK likepk = new LikePK();
		likepk.setMemberId(memberId);
		likepk.setPostId(postId);
		LikePost like = new LikePost();
		like.setLikePK(likepk);
		service.addLike(like);
	}

	@GetMapping(value = "unLike")
	public @ResponseBody void unLike(@RequestParam(value = "postId") Integer postId,
			@RequestParam(value = "memberId") Integer memberId) {
		LikePK likepk = new LikePK();
		likepk.setPostId(postId);
		likepk.setMemberId(memberId);
		LikePost like = new LikePost();
		like.setLikePK(likepk);
		service.unLike(like);
	}

	@RequestMapping(value = "/admin_discuss", method = RequestMethod.GET)
	public String admin_discuss(Model model) {
		List<Post> sortList = service.getReportSort(0);
		Integer count = sortList.size();
		Integer countPage = (int) (Math.ceil(count / contentNum));
		if (count % contentNum > 0) {
			countPage++;
		}
		model.addAttribute("page", countPage);
		return "admin_discuss";
	}

	@RequestMapping(value = "/memberJson", produces = "application/json")
	public String memberJson(@RequestParam(value = "memberName") String memberName, Model model) {
		List<Member> member = service.searchMember(memberName);
		model.addAttribute("member", member);
		return "memberJson";
	}

	@RequestMapping(value = "/allMemberJson", produces = "application/json")
	public String allMemberJson(Model model) {
		List<Member> member = memberService.getAllmembers();
		model.addAttribute("allMember", member);
		return "allMemberJson";
	}

	@GetMapping(value = "sendFriendRequest")
	public void sendFriendRequest(@RequestParam(value = "memberId") Integer memberId,
			@RequestParam(value = "memberIdf") Integer memberIdf) {
		Friendship friendship = new Friendship();
		friendship.setSender_memberId(memberId);
		friendship.setReceiver_memberId(memberIdf);
		service.sendFriendRequest(friendship);
	}

	@GetMapping(value = "confirmFriendRequest")
	public void confirmFriendRequest(@RequestParam(value = "memberId") Integer memberId,
			@RequestParam(value = "memberIdf") Integer memberIdf,
			@RequestParam(value = "friendStatus") Integer friendStatus, Integer check) {
		if (friendStatus == 2 && check == 2) {
			Friendship friendshipStatus = new Friendship();
			friendshipStatus.setSender_memberId(memberIdf);
			friendshipStatus.setReceiver_memberId(memberId);
			friendshipStatus.setFriendStatus(friendStatus);
			service.confirmFriendRequest(friendshipStatus);

			Friendship friendshipInsert = new Friendship();
			friendshipInsert.setSender_memberId(memberId);
			friendshipInsert.setReceiver_memberId(memberIdf);
			friendshipInsert.setFriendStatus(friendStatus);
			service.sendFriendRequest(friendshipInsert);
		} else if (friendStatus == 4 && check == 3) {
			Friendship friendshipStatus = new Friendship();
			friendshipStatus.setSender_memberId(memberIdf);
			friendshipStatus.setReceiver_memberId(memberId);
			friendshipStatus.setFriendStatus(friendStatus);
			service.confirmFriendRequest(friendshipStatus);

			Friendship blockFriend = new Friendship();
			blockFriend.setSender_memberId(memberId);
			blockFriend.setReceiver_memberId(memberIdf);
			blockFriend.setFriendStatus(check);
			service.confirmFriendRequest(blockFriend);
		} else if (friendStatus == 2 && check == 4) {
			Friendship unBlockFriend = service.getFriendRequest(memberIdf, memberId);
			Integer checkStatus = unBlockFriend.getFriendStatus();
			if (checkStatus == 4 || checkStatus == 5) {
				Friendship unBlockFriend1 = new Friendship();
				unBlockFriend1.setSender_memberId(memberIdf);
				unBlockFriend1.setReceiver_memberId(memberId);
				unBlockFriend1.setFriendStatus(friendStatus);
				service.confirmFriendRequest(unBlockFriend1);
				Friendship unBlockFriend2 = new Friendship();
				unBlockFriend2.setSender_memberId(memberId);
				unBlockFriend2.setReceiver_memberId(memberIdf);
				unBlockFriend2.setFriendStatus(friendStatus);
				service.confirmFriendRequest(unBlockFriend2);
			}
			if (checkStatus == null) {
				Friendship deleteFriend = service.getFriendRequest(memberId, memberIdf);
				service.cancelFriendRequest(deleteFriend);
			}
		}

	}

	@RequestMapping(value = "/friendJson", produces = "application/json")
	public void friendJson(Model model) {
		List<Friendship> friendList = service.getAllFriendRequest();
		model.addAttribute("friend", friendList);
	}

	@GetMapping(value = "sortJson", produces = "application/json")
	public void sortReport(@RequestParam(value = "sort") Integer sort, Model model) {
		List<Post> sortList = service.getReportSort(sort);
		model.addAttribute("sortList", sortList);
	}

}
