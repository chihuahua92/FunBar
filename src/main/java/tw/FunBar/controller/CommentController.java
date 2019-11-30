package tw.FunBar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Comment;
import tw.FunBar.model.Member;
import tw.FunBar.service.CommentService;

@Controller
public class CommentController {
	
	@Autowired
	CommentService commentService;

	@RequestMapping("/commentInsert")
	public String commentInsert(@RequestParam Integer memberId,
								@RequestParam Integer blogId,
								@RequestParam Integer parentCommentId,
								@RequestParam String commentContent,HttpServletRequest request, HttpSession session) {
		
		// 登入才可以留言以及回覆評論
		session = request.getSession(false);
		Member member = (Member)session.getAttribute("member");
		if(member==null) return null;
		
		Blog blog = commentService.findByBlogId(blogId);

		Comment parentComment = null;
		if(parentCommentId == -1) {
			parentComment = null;
		} else {
			parentComment = commentService.findByCommentId(parentCommentId);
		}
		
		Comment comment = new Comment();
		comment.setCommentName(member.getMemberName());
		comment.setCommentEmail(member.getMemberEmail());
		comment.setCommentContent(commentContent);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createdTime = sdf.format(d);
		comment.setCommentCreatedTime(createdTime);

		comment.setBlog(blog);
		comment.setParentComment(parentComment);
		comment.setMemberId(memberId);
		
		commentService.insertComment(comment);
		return "redirect:/blog/" + blogId;
	}
}
