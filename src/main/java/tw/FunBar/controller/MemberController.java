package tw.FunBar.controller;

import java.sql.Blob;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import javax.persistence.NoResultException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tw.FunBar.model.Member;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.EmailService;
import tw.FunBar.service.MemberService;

@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	@Autowired
	EmailService emailService;
	ServletContext context;

	// 密碼錯誤
	@RequestMapping(value = "/find", method = RequestMethod.GET)
	public String find(@RequestParam("memberId") String memberId, Model model) {
		System.out.println("帳號:" + memberId);
		model.addAttribute("one", memberService.forget(memberId));
		return "find";

	}

	@RequestMapping(value = "/findyou", method = RequestMethod.POST)
	public String findyou(@RequestParam String memberId, @RequestParam String memberPwd) {
		memberService.newPwd(memberId, memberPwd);
		return "redirect:/";
	}

	// 認證
	@RequestMapping(value = "/check", method = RequestMethod.GET)
	public String check(@RequestParam("id") Integer id) {
		System.out.println("idDDDDDDDDDD" + id);
		int memberLevel = 0;
		memberService.levelup(memberLevel, id);
		return "index";

	}

	// 一般登入
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String signIn() {

		return "signin";
	}

	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String signinto(@RequestParam("memberId") String memberId,
						   @RequestParam("memberPwd") String memberPwd,
						   Model model,
						   RedirectAttributes redirectAttributes,
						   HttpServletRequest request,
						   HttpSession session) {
		HashMap<String,String> errorMsg = new HashMap<String,String>();

		Member member = null;
		try {
			// 判斷使用者輸入是否為空
			if(memberId == null || memberId.length() == 0) {
	            errorMsg.put("errId","請輸入帳號");
	        }
			
			if(memberPwd == null || memberPwd.length() == 0) {
	            errorMsg.put("errPwd","請輸入密碼");
	        }

			if(errorMsg.size()!=0) {
	            model.addAttribute( "errorMsg", errorMsg);
	            return "signin";
			}

			member = memberService.signin(memberId, memberPwd);
			if(member.getMemberLevel()==0) {
				errorMsg.put("errId","此帳號尚未驗證");
				model.addAttribute( "errorMsg", errorMsg);
	            return "signin";
			}
		} catch(NoResultException e) {
			errorMsg.put("errId","請輸入正確的帳號或密碼");
			redirectAttributes.addFlashAttribute("errorMsg", errorMsg);

			return "redirect:/signin";
		}

		int level = member.getMemberLevel();
		System.out.println("level:" + level);

		if (member != null && level == 1) {
			session = request.getSession(false);
			session.setAttribute("member", member);
			return "redirect:/";
		}
		if (member != null && level > 1) {
			session = request.getSession(false);
			session.setAttribute("member", member);
			return "redirect:/";
		}

		return "signin";
		
	}

	// 登出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request, HttpSession session) {

		session = request.getSession(false);
		session.removeAttribute("member");
		session.removeAttribute("Cart");
		// 結束妳要去的頁面
		return "redirect:/signin";
	}

	// 查詢單筆
	@RequestMapping("/getONE1")
	public String getONE1(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("one", memberService.getONEmember(id));

		return "getONE1";
	}

	// 查詢全部
	@RequestMapping("/showAllmember")
	public String list(Model model,@RequestParam Integer index) {

//		List<Member> list = memberService.getAllmembers();
//		model.addAttribute("members", list);
		
		List<Member> members = memberService.getMemberByPage(index);
		int count = memberService.getMemberIndex();
		model.addAttribute("members", members);
		model.addAttribute("count", count);
		return "showAllmember";
	}

	// 新增
	// 這個是對照到jsp的action
	@RequestMapping(value = "/joinus", method = RequestMethod.GET)
	public String savemember(Model model) {
		Member mb = new Member();

		model.addAttribute("Member", mb);
		return "joinus";
	}

	@RequestMapping(value = "/joinus", method = RequestMethod.POST)
	public String dosavemember(@ModelAttribute("Member") Member mb, Model model) {
		HashMap<String, String> errorMsg = new HashMap<String, String>();

		// 驗證每個註冊欄位
		if (mb.getMemberName() == null || mb.getMemberName().length() == 0) {
			errorMsg.put("errUserName", "請輸入您的名子");
		}

		if (mb.getMemberAddress() == null || mb.getMemberAddress().length() == 0) {
			errorMsg.put("errAddress", "請輸入您的地址");
		}

		if (mb.getMemberBirth() == null || mb.getMemberBirth().length() == 0) {
			errorMsg.put("errBirth", "請輸入您的生日");
		}

		if (mb.getMemberPhone() == null || mb.getMemberPhone().length() == 0) {
			errorMsg.put("errPhone", "請輸入您的電話");
		}

		if (mb.getMemberId() == null || mb.getMemberId().length() == 0) {
			errorMsg.put("errId", "請輸入您的帳號");
		}

		if (mb.getMemberPwd() == null || mb.getMemberPwd().length() == 0) {
			errorMsg.put("errPwd", "請輸入您的密碼");
		}

		if (mb.getMemberEmail() == null || mb.getMemberEmail().length() == 0) {
			errorMsg.put("errEmail", "請輸入您的Email");
		}

		if (errorMsg.size() != 0) {

			model.addAttribute("errorMsg", errorMsg);
			return "joinus";
		}

		try {
			MultipartFile IMG = mb.getMemberimg();
			String originalFilename = IMG.getOriginalFilename();
			mb.setMemberfileName(originalFilename);
			if (IMG != null && !IMG.isEmpty()) {
				try {
					byte[] b = IMG.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setMemberPic(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
			memberService.saveMember(mb);
			emailService.sendmembercheck(mb);
		} catch (Exception e) {
			return "redirect:/joinus";
		}
		return "redirect:/";

	}

	// 刪除
	@RequestMapping("/deletemb")
	public String deletemb(@RequestParam("id") Integer id) {
		System.out.println("id=" + id);
		memberService.delete(id);
		// model.addAttribute("mb",memberService.delete(id));
		return "redirect:/showAllmember?index=1";

	}

	// 修改
	@RequestMapping(value = "/getONE", method = RequestMethod.GET)
	public String getONE(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("one", memberService.getONEmember(id));
		return "getONE";
	}

	@RequestMapping(value = "/updatemb", method = RequestMethod.POST)
	public String updatemb(@RequestParam Integer id, @RequestParam("memberName") String memberName,
			@RequestParam("memberAddress") String memberAddress, @RequestParam("memberBirth") String memberBirth,
			@RequestParam("memberPhone") String memberPhone,
			@RequestParam("memberId") String memberId, @RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberLevel") Integer memberLevel, @RequestParam("memberimg") MultipartFile memberimg,
			Model model) throws Exception {
		System.out.println("Id=" + id);
		byte[] b1 = memberimg.getBytes();
		Blob blob = new SerialBlob(b1);
		memberService.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberId,
				memberEmail, memberLevel, blob);
		return "redirect:/showAllmember?index=1";
	}

	// 讀取圖片資料
	@RequestMapping(value = "/membergetPicture/{id}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer id) {
//		String filePath = "/WEB-INF/views/ProductImages/noImage.png";
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String memberfileName = "";
		int len = 0;
		Member mm = memberService.getONEmember(id);
		if (mm != null) {
			Blob memberPic = mm.getMemberPic();
			memberfileName = mm.getMemberfileName();
			if (mm != null) {
				try {
					len = (int) memberPic.length();
					media = memberPic.getBytes(1, len);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, HttpStatus.OK);
		return responseEntity;
	}
		
	//忘記密碼
	@RequestMapping(value = "/getself", method = RequestMethod.GET)
	public String getself(@RequestParam("id") Integer id, Model model) {
		model.addAttribute("one", memberService.getONEmember(id));
		return "getself";
	}

	@RequestMapping(value = "/updatemb1", method = RequestMethod.POST)
	public String updatemb1(@RequestParam Integer id, @RequestParam("memberName") String memberName,
			@RequestParam("memberAddress") String memberAddress, @RequestParam("memberBirth") String memberBirth,
			@RequestParam("memberPhone") String memberPhone, @RequestParam("memberEmail") String memberEmail,
			@RequestParam("memberimg") MultipartFile memberimg, Model model) throws Exception {
		System.out.println("Id=" + id);
		byte[] b1 = memberimg.getBytes();
		Blob blob = new SerialBlob(b1);
		memberService.updateself(id, memberName, memberAddress, memberBirth, memberPhone, memberEmail, blob);
		return "redirect:/";
	}

	// 密碼
	@RequestMapping(value = "/memberforget", method = RequestMethod.GET)
	public String memberforget(Model model) {
		String memberId = null;
		System.out.println("55555666666666" + memberId);

		return "memberforget";
	}

	@RequestMapping(value = "/forget", method = RequestMethod.POST)
	public String forget(@RequestParam("memberId") String memberId) {

		Member pass = memberService.forget(memberId);
		System.out.println("7777777777777777" + memberId);

		emailService.sendpassword(pass);
		return "index";

	}

	// 驗證是否重複帳號
	@RequestMapping(value = "/abc", method = RequestMethod.POST)
	@ResponseBody
	public String mb(@RequestParam("idno") String memberId) {

		Boolean bb = memberService.checkId(memberId);
		if (bb) {
			return "0";
		} else {
			return "1";
		}
	}
	//會員模糊查詢
	@RequestMapping("/getMemberByName")
	public String getMemberByName( @RequestParam String memberName, Model model) {
		List<Member> list = memberService.getMemberByName(memberName);
		

		model.addAttribute("members", list);
		return "showAllmember";

	}
	


}