package tw.FunBar.model;

import java.io.Serializable;
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

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Entity
public class Post implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer postId;
	private String postContent;
	private String postTime;
	private Integer memberId;
	private Integer postStatus;

	@JsonIgnoreProperties("post")
	@OneToMany(mappedBy = "likePK.postId", cascade = CascadeType.ALL)
	private Set<LikePost> likePosts = new LinkedHashSet<>();

	@JsonIgnoreProperties("parentPostId")
	@OneToMany(mappedBy = "parentPostId", cascade = CascadeType.ALL)
	@OrderBy("postTime ASC")
	private Set<Post> replyPost = new LinkedHashSet<Post>();

	@JsonIgnoreProperties("replyPost")
	@ManyToOne
	@JoinColumn(name = "parentPostId")
	private Post parentPostId;

	

	public Set<LikePost> getLikePosts() {
		return likePosts;
	}

	public void setLikePosts(Set<LikePost> likePosts) {
		this.likePosts = likePosts;
	}

	public Set<Post> getReplyPost() {
		return replyPost;
	}

	public void setReplyPost(Set<Post> replyPost) {
		this.replyPost = replyPost;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getPostContent() {
		return postContent;
	}

	public void setPostContent(String postContent) {
		this.postContent = postContent;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Post getParentPostId() {
		return parentPostId;
	}

	public void setParentPostId(Post parentPostId) {
		this.parentPostId = parentPostId;
	}

	public Integer getPostStatus() {
		return postStatus;
	}

	public void setPostStatus(Integer postStatus) {
		this.postStatus = postStatus;
	}

}
