package tw.FunBar.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.CommentDAO;
import tw.FunBar.model.Blog;
import tw.FunBar.model.Comment;
import tw.FunBar.service.CommentService;

@Service
@Transactional
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDAO commentDao;
	
	@Override
	public Blog findByBlogId(int id) {
		return commentDao.findByIdBlog(id);
	}

	@Override
	public void insertComment(Comment comment) {
		commentDao.insertComment(comment);
	}

	@Override
	public Comment findByCommentId(int id) {
		return commentDao.findByIdComment(id);
	}

	@Override
	public List<Comment> findCommentByBlog(int blogId) {
		return commentDao.findCommentByBlog(blogId);
	}

}
