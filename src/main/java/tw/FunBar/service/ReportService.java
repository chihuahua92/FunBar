package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;

public interface ReportService {
	public void insertReport(Report report);
	
	public Comment findCommentById(int id);

	public Report findCommentReportById(int commentId, int reportId);
	
	public Report findReportById(int id);
	
	public List<Report> queryReportProcess();
	
	public List<Report> queryReportResult();
	
	public void deleteComment(Comment comment);
	
	public void resolveReport(Report report);
	
	public List<Report> searchReports(String searchKey, Integer searchOption);
}
