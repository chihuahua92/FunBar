package tw.FunBar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import tw.FunBar.model.Member;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.ProductBean;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.service.BookingService;
import tw.FunBar.service.OrderHandleService;
import tw.FunBar.service.RoomService;

@Controller
public class AdminController {

		
	@Autowired
	RoomService roomService;
	
	@Autowired
	BookingService bookingService;
	
	
	@Autowired
	OrderHandleService orderService;
		
	@RequestMapping("/admin")
	public String admin(Model model,HttpSession session,HttpServletRequest req) {
		
		session = req.getSession(false);
		
		Member member = (Member)session.getAttribute("member");
		
		if(member==null) {
			return "redirect:/";
		}
		
		int level = member.getMemberLevel();
		if(level<9){
			
			return "redirect:/";
		}
		
		
		ArrayList<RoomOrder> orders = roomService.getLatestOrders();	
		int	roomTotalIncome = roomService.getRoomTotalIncome();
		

		int arrival = bookingService.todayArrival();
		
		model.addAttribute("arrival",arrival);

		List<ProductBean> list = orderService.getLessStockProduct();
		int productTotalIncome = orderService.getProductTotalIncome();
		
		model.addAttribute("pb", list);
		model.addAttribute("productTotalIncome", productTotalIncome);
		

		model.addAttribute("orders", orders);
		model.addAttribute("roomTotalIncome", roomTotalIncome);
		
		return "admin";
	}
}
