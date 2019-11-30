package tw.FunBar.model;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Comment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer commentId;
	private String commentName;
	private String commentEmail;
	private String commentContent;
	private String commentCreatedTime;

	@Transient
	private Integer commentStatus;

	@JsonIgnoreProperties("comments")
	@ManyToOne
	@JoinColumn(name = "BLOGID")
	private Blog blog;

	@JsonIgnoreProperties("parentComment")
	@OneToMany(mappedBy = "parentComment", cascade = CascadeType.ALL)
	@OrderBy("commentCreatedTime ASC")
	private Set<Comment> replyComment = new LinkedHashSet<Comment>();

	@JsonIgnoreProperties("replyComment")
	@ManyToOne
	@JoinColumn(name = "PARENTCOMMENTID")
	private Comment parentComment;

	@Transient
	private Integer blogId;

	private Integer memberId;

	@JsonIgnoreProperties("comment")
	@OneToMany(mappedBy = "comment", cascade = CascadeType.ALL)
	private Set<Report> reports = new LinkedHashSet<Report>();

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public String getCommentName() {
		return commentName;
	}

	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}

	public String getCommentEmail() {
		return commentEmail;
	}

	public void setCommentEmail(String commentEmail) {
		this.commentEmail = commentEmail;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public String getCommentCreatedTime() {
		return commentCreatedTime;
	}

	public void setCommentCreatedTime(String commentCreatedTime) {
		this.commentCreatedTime = commentCreatedTime;
	}

	public Integer getCommentStatus() {
		return commentStatus;
	}

	public void setCommentStatus(Integer commentStatus) {
		this.commentStatus = commentStatus;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	public Set<Comment> getReplyComment() {
		return replyComment;
	}

	public void setReplyComment(Set<Comment> replyComment) {
		this.replyComment = replyComment;
	}

	public Comment getParentComment() {
		return parentComment;
	}

	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public Set<Report> getReports() {
		return reports;
	}

	public void setReports(Set<Report> reports) {
		this.reports = reports;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}
}
