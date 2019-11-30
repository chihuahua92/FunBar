package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Comment;

public interface CommentDAO {
	public Blog findByIdBlog(int id);
	
	public List<Comment> findCommentByBlog(int blogId);
	
	public Comment findByIdComment(int id);
	
	public void insertComment(Comment comment);
}
