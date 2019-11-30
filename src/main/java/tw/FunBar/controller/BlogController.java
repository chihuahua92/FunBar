package tw.FunBar.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;

import tw.FunBar.model.Blog;
import tw.FunBar.model.Category;
import tw.FunBar.model.Comment;
import tw.FunBar.model.Member;
import tw.FunBar.service.BlogService;
import tw.FunBar.service.CommentService;
import tw.FunBar.util.JSONFileUpload;

@Controller
public class BlogController {
	@Autowired
	BlogService blogService;
	
	@Autowired
	CommentService CommentService;
	
	@Autowired
	ServletContext context;

	@RequestMapping("/blogs")
	public String blogs(Model model) {
		List<Category> categoryList = blogService.getCategories();
		model.addAttribute("categoryList", categoryList);
		return "blogs";
	}
	
	@RequestMapping("/blogsByCategoryId/{categoryId}")
	public String findBlogsByCategoryId(@PathVariable Integer categoryId, Model model) {
		List<Blog> blogs = blogService.findBlogsByCategoryId(categoryId);
		model.addAttribute("blogsByCategory", blogs);
		return "/blogsByCategoryId";
	}
	
	@RequestMapping(value = "/blogJson", produces = "application/json")
	public String blogJson(Model model) {
		List<Blog> blogs = blogService.queryAllBlogs();
		model.addAttribute("blogs", blogs);
		return "blogJson";
	}
	
	@RequestMapping("/blogInsert")
	public void blogInsert(@RequestParam("upload") MultipartFile upload,
							 HttpServletRequest request,
							 HttpServletResponse response) throws ServletException, IOException {
		String ext = context.getMimeType(upload.getOriginalFilename());
		ext = ext.substring(6);
		Date date = new Date();
		String filename = String.valueOf(date.getTime() + "." + ext);
        
        InputStream in = upload.getInputStream();
        String basePath = "C:\\FunBar\\imgUpload\\";
        System.out.println("basePath:" + basePath);
		File baseFile = new File(basePath);
		if (!baseFile.exists()) baseFile.mkdirs();

        File outputFilePath = new File(basePath + filename);
        OutputStream output = new FileOutputStream(outputFilePath);
        byte[] buff = new byte[1024];
        int length;
        while ((length = in.read(buff)) != -1) {
            output.write(buff, 0, length);
        }
        output.close();
        in.close();
        
        Gson gson = new Gson();
        PrintWriter out = response.getWriter();
        out.print(gson.toJson(new JSONFileUpload(basePath + filename)));
        out.flush();
        out.close();
	}
	
	@RequestMapping("/blogBrowse")
	public String blogBrowse(HttpServletRequest request, Model model) {
		String basePath = "C:\\FunBar\\imgUpload\\";
        File folder = new File(basePath);
        model.addAttribute("files", folder.listFiles());
        model.addAttribute("CKEditorFuncNum", request.getParameter("CKEditorFuncNum"));

		return "browsefile";
	}
	
	@RequestMapping("/blogPost")
	public String blogPost(@RequestParam MultipartFile blogImage,
						   @RequestParam String blogTitle,
						   @RequestParam String blogContent,
						   @RequestParam Integer categoryId, HttpServletRequest request, HttpSession session) throws IOException {
		
		String sourceFileName = blogImage.getOriginalFilename();
        
		String path = "";
        if(sourceFileName.length()>0) {
        	String ext = context.getMimeType(sourceFileName);
    		ext = ext.substring(6);
    		Date date = new Date();
    		String filename = String.valueOf(date.getTime() + "." + ext);
        	InputStream in = blogImage.getInputStream();
        	String basePath = "C:\\FunBar\\imgUpload\\";
            System.out.println("basePath:" + basePath);
			File baseFile = new File(basePath);
			if (!baseFile.exists()) baseFile.mkdirs();

            File outputFilePath = new File(basePath + filename);
            OutputStream output = new FileOutputStream(outputFilePath);
            byte[] buff = new byte[1024];
            int length;
            while ((length = in.read(buff)) != -1) {
                output.write(buff, 0, length);
            }
            output.close();
            in.close();

            path = request.getContextPath() + "/imgUpload/" + filename;
        } else {
        	path = request.getContextPath() + "/ProductImages/noImage.png";
        }
        
		Blog blog = new Blog();
		blog.setBlogImage(path);
		blog.setBlogTitle(blogTitle);
		blog.setBlogContent(blogContent);
		blog.setBlogIsHot(0);
		
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createdTime = sdf.format(d);
		blog.setBlogCreatedTime(createdTime);

		Category category = blogService.findByIdCategory(categoryId);
		blog.setCategory(category);
		
		// 登入才可以新增文章
		session = request.getSession(false);
		Member member = (Member)session.getAttribute("member");
		if(member==null) return "redirect:/signin";
		
		blog.setMemberId(member.getId());
		blog.setMemberName(member.getMemberName());
		
		blogService.insertBlog(blog);

		return "redirect:/blogs";
	}
	
	@RequestMapping("/blog/{id}")
	public String blog(@PathVariable Integer id, Model model) {
		List<Category> categoryList = blogService.getCategories();
		Blog blog = blogService.findByIdBlog(id);
		List<Comment> comments = CommentService.findCommentByBlog(id);
		
		model.addAttribute("blog", blog);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("comments", comments);
		return "showBlog";
	}
	
	@RequestMapping("/admin_blog")
	public String adminBlog(Model model) {
		List<Blog> blogs = blogService.queryAllBlogsByASC();

		model.addAttribute("blogs", blogs);
		return "admin_blog";
	}
	
	@RequestMapping("/admin_blog/{id}")
	public String adminBlogById(@PathVariable Integer id, Model model) {
		Blog blog = blogService.findByIdBlog(id);

		model.addAttribute("blog", blog);
		return "adminBlogById";
	}
	
	@RequestMapping("/admin_delete/{id}")
	public String adminBlogDelete(@PathVariable Integer id) {
		Blog blog = blogService.findByIdBlog(id);
		blogService.deleteBlog(blog);
		return "redirect:/admin_blog";
	}
	
	@RequestMapping("/search")
	public String searchKey(@RequestParam String searchKey, Model model) {
		System.out.println("Controller:" + searchKey);
		List<Blog> blogs = blogService.searchBlogs(searchKey);
		model.addAttribute("blogs", blogs);
		return "searchKey";
	}
	
	@RequestMapping("/getmodifyBlog/{id}")
	public String modifyBlog(@PathVariable Integer id, Model model) {
		Blog blog = blogService.findByIdBlog(id);
		model.addAttribute("modifyBlog", blog);
		return "/getmodifyBlog";
	}
	
	@RequestMapping("/modifyBlog")
	public String updateModifyBlog(@RequestParam Integer blogId,
								   @RequestParam Integer categoryId,
								   @RequestParam MultipartFile blogImage,
								   @RequestParam String blogTitle,
								   @RequestParam String blogContent,
								   HttpServletRequest request) throws IOException {
		String modifyFileName = blogImage.getOriginalFilename();
		Blog blog = blogService.findByIdBlog(blogId);
		if(modifyFileName.length()!=0) {
			String ext = context.getMimeType(blogImage.getOriginalFilename());
			ext = ext.substring(6);
			Date date = new Date();
			String filename = String.valueOf(date.getTime() + "." + ext);
			InputStream in = blogImage.getInputStream();
        	String basePath = "C:\\FunBar\\imgUpload\\";
            System.out.println("basePath:" + basePath);
			File baseFile = new File(basePath);
			if (!baseFile.exists()) baseFile.mkdirs();

            File outputFilePath = new File(basePath + filename);
            OutputStream output = new FileOutputStream(outputFilePath);
            byte[] buff = new byte[1024];
            int length;
            while ((length = in.read(buff)) != -1) {
                output.write(buff, 0, length);
            }
            output.close();
            in.close();
			
            // modify
            String path = request.getContextPath() + "/imgUpload/" + filename;
            blog.setBlogImage(path);
		} else {
			blog.setBlogImage(blog.getBlogImage());
		}
		
		
		blog.setBlogTitle(blogTitle);
		blog.setBlogContent(blogContent);
		Category category = blogService.findByIdCategory(categoryId);
		blog.setCategory(category);
		
		blogService.modifyBlog(blog);
			
		
		return "redirect:/blog/" + blogId;
	}
	
	@RequestMapping("/admin_switch/{id}")
	public String adminSwitch(@PathVariable Integer id, @RequestParam Integer blogIsHot) {
		Blog blog = blogService.findByIdBlog(id);
		blog.setBlogIsHot(blogIsHot);
		blogService.modifyBlog(blog);

		return "adminSwitch";
	}
}
