package tw.FunBar.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import tw.FunBar.model.Comment;
import tw.FunBar.model.Member;
import tw.FunBar.model.Report;
import tw.FunBar.service.MemberService;
import tw.FunBar.service.ReportService;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	
	@Autowired
	MemberService memberService;

	@RequestMapping("/reportInsert")
	public String reportInsert(@RequestParam Integer commentId,
							   @RequestParam String reportContent,
							   @RequestParam Integer reportMemberId,
							   HttpServletRequest request, HttpSession session) {
		
		Report report = new Report();
		
		// 判斷是否有 Session 於 Session 取得檢舉人的 reportMemberId
		// 登入才可以進行檢舉
		session = request.getSession(false);
		Member sessionMember = (Member)session.getAttribute("member");
		if(sessionMember==null) return null;

		Member member = memberService.getONEmember(reportMemberId);
		report.setReportName(member.getMemberName());
		report.setReportContent(reportContent);

		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String reportCreatedTime = sdf.format(d);
		report.setReportCreatedTime(reportCreatedTime);
		
		// 檢舉人的 memberId
		report.setReportMemberId(reportMemberId);
		
		// 被檢舉人的評論 commentId && 被檢舉人的留言者 commentReportName
		Comment comment = reportService.findCommentById(commentId);
		report.setComment(comment);
		report.setCommentReportName(comment.getCommentName());
		report.setReportStatus(0);

		reportService.insertReport(report);
		
		return "reportInsert";
	}
	
	@RequestMapping("/admin_report")
	public String adminReport() {
		return "admin_report";
	}
	
	@RequestMapping("/reportProcess")
	public String reportProcess(Model model) {
		List<Report> reports = reportService.queryReportProcess();

		model.addAttribute("reports", reports);
		return "reportProcess";
	}
	
	@RequestMapping("/reportResult")
	public String reportResult(Model model) {
		List<Report> reportsResult = reportService.queryReportResult();

		model.addAttribute("reportsResult", reportsResult);
		return "reportResult";
	}
	
	@RequestMapping("/admin_lock/{commentId}")
	public String lockData(@PathVariable Integer commentId) {

		Comment comment = reportService.findCommentById(commentId);
		reportService.deleteComment(comment);

		return "lockData";
	}
	
	@RequestMapping("/admin_showComment/{reportId}/{commentId}")
	public String adminShowComment(
						   @PathVariable Integer reportId,
						   @PathVariable Integer commentId,
						   Model model) {

		Report report = reportService.findCommentReportById(commentId, reportId);
		model.addAttribute("report", report);

		return "adminShowComment";
	}
	
	@RequestMapping("/admin_reportSearch")
	public String adminReportSearch(@RequestParam String searchKey,
									@RequestParam Integer searchOption, Model model) {
		
		List<Report> reports = reportService.searchReports(searchKey, searchOption);
		model.addAttribute("reports", reports);

		return "adminReportSearch";
	}
}
