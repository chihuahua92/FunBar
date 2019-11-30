package tw.FunBar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.chat.ParticipantRepository;
import tw.FunBar.model.Friendship;
import tw.FunBar.model.Member;
import tw.FunBar.service.DiscussService;
import tw.FunBar.service.MemberService;

@Controller
public class FriendController {

	@Autowired
	MemberService memberService;
	@Autowired
	DiscussService service;
	@Autowired
	private ParticipantRepository participantRepository;
//	@Autowired
//	private SimpMessagingTemplate messagingTemplate;

	@RequestMapping(value = "/friend", method = RequestMethod.GET)
	public String friend(Model model, HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		System.out.println(member);
		if (member == null)
			return "redirect:/signin";
		participantRepository.add(member.getId(), member);
//		messagingTemplate.convertAndSend("/topic/friends/participants", participantRepository.getActiveMember().values());
		model.addAttribute("title", "好友");
		model.addAttribute("member", member);
		return "friend";
	}

	@RequestMapping(value = "/getAllMemberJson", produces = "application/json")
	public String getAllMemberJson(Model model) {
		List<Member> member = memberService.getAllmembers();
		model.addAttribute("Member", member);
		return "getAllMemberJson";
	}

	@GetMapping(value = "cancelFriendRequest")
	public void cancelFriendRequest(@RequestParam(value = "sender_memberId") Integer sender_memberId,
			@RequestParam(value = "receiver_memberId") Integer receiver_memberId) {
		Friendship friendship = service.getFriendRequest(sender_memberId, receiver_memberId);
		service.cancelFriendRequest(friendship);
	}

	@GetMapping(value = "deleteFriend")
	public void deleteFriend(@RequestParam(value = "sender_memberId") Integer sender_memberId,
			@RequestParam(value = "receiver_memberId") Integer receiver_memberId) {
		Friendship friendship = service.getFriendRequest(receiver_memberId, sender_memberId);
		Integer check = friendship.getFriendStatus();
		System.out.println("Check == " + check);
		if (check == 4) {
			System.out.println("有到這");
			friendship.setFriendStatus(5);
			service.confirmFriendRequest(friendship);
		} else {
			service.cancelFriendRequest(friendship);
			Friendship friendshipf = service.getFriendRequest(sender_memberId, receiver_memberId);
			service.cancelFriendRequest(friendshipf);
		}
	}

//	@GetMapping(value = "unBlockFriend")
//	public void unBlockFriend(@RequestParam(value = "sender_memberId") Integer sender_memberId,
//									@RequestParam(value = "receiver_memberId") Integer receiver_memberId) {
//		Friendship friendship1 = service.getFriendRequest(sender_memberId, receiver_memberId);
//		System.out.println(friendship1);
//		service.cancelFriendRequest(friendship1);
//		Friendship friendship2 = service.getFriendRequest(receiver_memberId, sender_memberId);
//		service.cancelFriendRequest(friendship2);
//	}	

}
