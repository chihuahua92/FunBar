package tw.FunBar.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.FunBar.dao.ReportDAO;
import tw.FunBar.model.Comment;
import tw.FunBar.model.Report;
import tw.FunBar.service.ReportService;

@Service
@Transactional
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	ReportDAO reportDao;

	@Override
	public void insertReport(Report report) {
		reportDao.insertReport(report);
	}
	
	@Override
	public Comment findCommentById(int id) {
		return reportDao.findCommentById(id);
	}

	@Override
	public Report findCommentReportById(int commentId, int reportId) {
		return reportDao.findCommentReportById(commentId, reportId);
	}

	@Override
	public List<Report> queryReportProcess() {
		return reportDao.queryReportProcess();
	}

	@Override
	public List<Report> queryReportResult() {
		return reportDao.queryReportResult();
	}

	@Override
	public void deleteComment(Comment comment) {
		reportDao.deleteComment(comment);
	}

	@Override
	public void resolveReport(Report report) {
		reportDao.resolveReport(report);
	}

	@Override
	public Report findReportById(int id) {
		return reportDao.findReportById(id);
	}

	@Override
	public List<Report> searchReports(String searchKey, Integer searchOption) {
		return reportDao.searchReports(searchKey, searchOption);
	}
}
