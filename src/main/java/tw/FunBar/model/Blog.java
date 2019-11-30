package tw.FunBar.model;

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
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Blog {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blogId;
	private String blogImage;
	private String blogTitle;
	private String blogContent;
	private Integer blogIsHot;
	private String blogCreatedTime;

	@JsonIgnoreProperties("blogs")
	@ManyToOne
	@JoinColumn(name = "CATEGORYID")
	private Category category;

	@JsonIgnore
	@OneToMany(mappedBy = "blog", cascade = CascadeType.ALL)
	private Set<Comment> comments = new LinkedHashSet<Comment>();

	private Integer memberId;
	private String memberName;

	public Integer getBlogId() {
		return blogId;
	}

	public void setBlogId(Integer blogId) {
		this.blogId = blogId;
	}

	public String getBlogImage() {
		return blogImage;
	}

	public void setBlogImage(String blogImage) {
		this.blogImage = blogImage;
	}

	public String getBlogTitle() {
		return blogTitle;
	}

	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}

	public String getBlogContent() {
		return blogContent;
	}

	public void setBlogContent(String blogContent) {
		this.blogContent = blogContent;
	}

	public Integer getBlogIsHot() {
		return blogIsHot;
	}

	public void setBlogIsHot(Integer blogIsHot) {
		this.blogIsHot = blogIsHot;
	}

	public String getBlogCreatedTime() {
		return blogCreatedTime;
	}

	public void setBlogCreatedTime(String blogCreatedTime) {
		this.blogCreatedTime = blogCreatedTime;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

}
