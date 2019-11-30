package tw.FunBar.dao;

import java.util.List;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;

public interface BlogDAO {
	public List<Blog> queryAllBlogs();
	
	public List<Blog> queryAllBlogsByASC();
	
	public Blog findByIdBlog(int id);

	public void insertBlog(Blog blog);
	
	public void deleteBlog(Blog blog);
	
	public List<Category> getCategories();
	
	public List<Blog> findBlogsByCategoryId(int id);

	public Category findByIdCategory(int id);
	
	public List<Comment> getComments();
	
	public List<Blog> searchBlogs(String searchKey);
	
	public void modifyBlog(Blog blog);
	
	public List<Blog> queryAllHotBlogs();
}
