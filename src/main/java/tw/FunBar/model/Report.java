package tw.FunBar.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer reportId;

	// 檢舉人
	private String reportName;
	private String reportContent;
	private String reportCreatedTime;
	private Integer reportStatus;
	private Integer reportMemberId;

	// 檢舉評論 fk
	//@JsonIgnore
	@JsonIgnoreProperties("reports")
	@ManyToOne
	@JoinColumn(name = "COMMENTID")
	private Comment comment;

	@Transient
	private Integer commentId;
	
	// 被檢舉人
	private String commentReportName;

	public Integer getReportId() {
		return reportId;
	}

	public void setReportId(Integer reportId) {
		this.reportId = reportId;
	}

	public String getReportName() {
		return reportName;
	}

	public void setReportName(String reportName) {
		this.reportName = reportName;
	}

	public String getReportContent() {
		return reportContent;
	}

	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}

	public String getReportCreatedTime() {
		return reportCreatedTime;
	}

	public void setReportCreatedTime(String reportCreatedTime) {
		this.reportCreatedTime = reportCreatedTime;
	}

	public Integer getReportStatus() {
		return reportStatus;
	}

	public void setReportStatus(Integer reportStatus) {
		this.reportStatus = reportStatus;
	}

	public Integer getReportMemberId() {
		return reportMemberId;
	}

	public void setReportMemberId(Integer reportMemberId) {
		this.reportMemberId = reportMemberId;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public String getCommentReportName() {
		return commentReportName;
	}

	public void setCommentReportName(String commentReportName) {
		this.commentReportName = commentReportName;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}
}
