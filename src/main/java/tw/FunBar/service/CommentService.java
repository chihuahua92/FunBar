package tw.FunBar.service;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Comment;

public interface CommentService {
	public Blog findByBlogId(int id);
	
	public List<Comment> findCommentByBlog(int blogId);
	
	public Comment findByCommentId(int id);
	
	public void insertComment(Comment comment);
}
