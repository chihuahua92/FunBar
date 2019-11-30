package tw.FunBar.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.FunBar.dao.BlogDAO;
import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;
import tw.FunBar.service.BlogService;

@Service
@Transactional
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	BlogDAO blogDao;

	@Override
	public void insertBlog(Blog blog) {
		blogDao.insertBlog(blog);
	}

	@Override
	public List<Category> getCategories() {
		return blogDao.getCategories();
	}

	@Override
	public Category findByIdCategory(int id) {
		return blogDao.findByIdCategory(id);
	}

	@Override
	public List<Blog> queryAllBlogs() {
		return blogDao.queryAllBlogs();
	}

	@Override
	public Blog findByIdBlog(int id) {
		return blogDao.findByIdBlog(id);
	}

	@Override
	public List<Comment> getComments() {
		return blogDao.getComments();
	}

	@Override
	public List<Blog> queryAllBlogsByASC() {
		return blogDao.queryAllBlogsByASC();
	}

	@Override
	public List<Blog> findBlogsByCategoryId(int id) {
		return blogDao.findBlogsByCategoryId(id);
	}

	@Override
	public void deleteBlog(Blog blog) {
		blogDao.deleteBlog(blog);
	}

	@Override
	public List<Blog> searchBlogs(String searchKey) {
		return blogDao.searchBlogs(searchKey);
	}

	@Override
	public void modifyBlog(Blog blog) {
		blogDao.modifyBlog(blog);
	}

	@Override
	public List<Blog> queryAllHotBlogs() {
		return blogDao.queryAllHotBlogs();
	}

}
