package tw.FunBar.controller;


import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.ShoppingService;
import tw.FunBar.model.Blog;
import tw.FunBar.service.BlogService;

@Controller
public class IndexController {
	@Autowired
	ShoppingService shoppingService;
	
	
	@Autowired
	BlogService blogService;
	
	@RequestMapping("/")
	public String index(Model model) {
		List<Blog> blogs = blogService.queryAllHotBlogs();
		model.addAttribute("blogs", blogs);
		
		List<ProductBean> show = shoppingService.showNewProducts();
		model.addAttribute("all", show);

		return "index" ;
	}

	
}
