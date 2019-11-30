package tw.FunBar.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.CommentDAO;
import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public Blog findByIdBlog(int id) {
		Session session = sessionFactory.getCurrentSession();
		Blog blog = session.get(Blog.class, id);
		return blog;
	}

	@Override
	public void insertComment(Comment comment) {
		Session session = sessionFactory.getCurrentSession();
		session.save(comment);
	}

	@Override
	public Comment findByIdComment(int id) {
		Session session = sessionFactory.getCurrentSession();
		Comment comment = session.get(Comment.class, id);
		return comment;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Comment> findCommentByBlog(int blogId) {
		System.out.println("blogId:" + blogId);
		String hql = "From Comment Where blogId = :blogId Order By commentCreatedTime ASC";
		Session session = sessionFactory.getCurrentSession();
		List<Comment> comments = session.createQuery(hql).setParameter("blogId", blogId).getResultList();

		return comments;
	}

}
