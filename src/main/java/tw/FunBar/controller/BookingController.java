package tw.FunBar.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.FunBar.model.Alltime;
import tw.FunBar.model.BookingData;
import tw.FunBar.service.BookingService;
import tw.FunBar.service.EmailService;

@Controller
public class BookingController {

	@Autowired
	BookingService bookingService;
	
	@Autowired
	EmailService emailService;


	@RequestMapping("/booking")
	public String booking() {
		
		return "booking";
	}

	@RequestMapping(value = "/pulltime",method=RequestMethod.POST)
	@ResponseBody
	public ArrayList<Alltime> displayTime(@RequestParam(name = "date") String date,
			@RequestParam(name = "people") Integer people, Model model) {
		ArrayList<Alltime> oktime = bookingService.okTime(date, people);
		model.addAttribute("oktime", oktime);
		return oktime;
	}

	@RequestMapping("/confirm")
	public String confirm(@RequestParam(name = "date") String date, @RequestParam(name = "people") Integer people,
			@RequestParam(name = "time") String time, Model model) {

		model.addAttribute("date", date);
		model.addAttribute("people", people);
		model.addAttribute("time", time);
		return "confirm";
	}
	
	@RequestMapping("/adConfirm")
	public String adConfirm(@RequestParam(name = "date") String date, @RequestParam(name = "people") Integer people,
			@RequestParam(name = "time") String time, Model model) {

		model.addAttribute("date", date);
		model.addAttribute("people", people);
		model.addAttribute("time", time);
		return "adConfirm";
	}
	


	@RequestMapping("/addReservations")
	public String addrReservations(@RequestParam(name = "date") String date,
			@RequestParam(name = "people") Integer people, @RequestParam(name = "time") String time,
			@RequestParam(name = "name") String name, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "email") String email,String remark, Model model,HttpSession session) {
		

		bookingService.addReservations(date,people,time,name,phone,email,remark);
		
		BookingData data = bookingService.getBookingByphone(phone);
		
		session.setAttribute("data",data);
		
		
		//model.addAttribute("date", date);
		//model.addAttribute("number",data.getBooking_id());
		session.setAttribute("date",date);
		session.setAttribute("number",data.getBooking_id());
		
		return "redirect:/complete_ok";
	}
	
	@RequestMapping("/complete_ok")
	public String completeOk(HttpSession session,HttpServletRequest req,Model model) {
		
		session = req.getSession(false);
		
		BookingData data = (BookingData) session.getAttribute("data");
		
		//emailService.sendBookingEmail(data);
		
		String date = (String)session.getAttribute("date");
		
		Integer number = (Integer)session.getAttribute("number");
		
		model.addAttribute("date",date);
		model.addAttribute("number",number);
		
		return "completeOk";
		
	}
	

	
	@RequestMapping("/ad_addReservations")
	public String adAddrReservations(@RequestParam(name = "date") String date,
			@RequestParam(name = "people") Integer people, @RequestParam(name = "time") String time,
			@RequestParam(name = "name") String name, @RequestParam(name = "phone") String phone,
			@RequestParam(name = "email") String email,String remark, Model model) {
		

		bookingService.addReservations(date,people,time,name,phone,email,remark);
		
		model.addAttribute("date", date);
		return "admin_booking";
	}
	
	@RequestMapping("/allbooking")
	public String queryAllBooking(Model model) {
		ArrayList<BookingData> all = bookingService.queryAllBooking();
		model.addAttribute("All", all);
		return "allbooking";
	}
	
	
	@RequestMapping("/arrival")
	public String arrival(@RequestParam Integer id) {
		
		
		bookingService.arrival(id);
		
		return "redirect:/todaybooking";
	}
	
	@RequestMapping("/todaybooking")
	public String todayBooking(Model model) {
		
		ArrayList<BookingData> all = bookingService.todayBooking();
		
		model.addAttribute("All",all);
		
		return "todaybooking";
		
	}
	
	
	@RequestMapping("/ad_booking")
	public String adminBooking() {
		return "admin_booking";
	}
	
	@RequestMapping(value = "/pullTodayStatus",method=RequestMethod.POST)
	public String pullTodayStatus(@RequestParam(name = "date")String date,Model model) {
		ArrayList<Alltime> fulltime = bookingService.pullTime();
		ArrayList<Alltime> todayStatus = bookingService.pullTodayStatus(date);
		
		model.addAttribute("fulltime", fulltime);
		model.addAttribute("todayStatus", todayStatus);
		
		return "pullTodayStatus";
		
	}
	
	@RequestMapping("/reset_time_people")
	public String showTimePeople(Model model) {
		ArrayList<Alltime> alltime = bookingService.pullTime();
		model.addAttribute("alltime", alltime);
		return "reset_time_people";
	}
	
	@RequestMapping("/reset_time_people_ok")
	public String resetTimePeople(@RequestParam String time0,@RequestParam String time1,@RequestParam String time2,@RequestParam String time3,@RequestParam String time4,
	@RequestParam String time5,@RequestParam String time6,@RequestParam String time7,@RequestParam String time8,
	@RequestParam Integer people0,@RequestParam Integer people1,@RequestParam Integer people2,@RequestParam Integer people3,@RequestParam Integer people4,@RequestParam Integer people5,@RequestParam Integer people6,@RequestParam Integer people7,@RequestParam Integer people8,Model model) {

		bookingService.resetTimePeople(time0,time1,time2,time3,time4,time5,time6,time7,time8,people0,people1,people2,people3,people4,people5,people6,people7,people8);
		
		return "redirect:/reset_time_people";
	}
	
	
	@RequestMapping(value="/cancelBooking",method=RequestMethod.GET)
	public String cancelBooking(@RequestParam Integer id) {
		bookingService.cancelBooking(id);
		return "redirect:/allbooking";
	}
	
	@RequestMapping(value="/pullSingle",method=RequestMethod.GET)
	public String pullSingle(@RequestParam Integer id,Model model) {
		BookingData data = bookingService.pullSingle(id);
		model.addAttribute("data", data);
		return "pullSingle";
	}
	
	
	@RequestMapping("/modifyBooking")
	public String modifyBooking(Integer id,String name,@RequestParam String phone,@RequestParam String date,@RequestParam String time,@RequestParam Integer people,@RequestParam String remark) {
		bookingService.modifyBooking(id,name,phone,date,time,people,remark);
		return "redirect:/allbooking";
	}
	
	@RequestMapping("/dateQuery")
	@ResponseBody
	public ArrayList<Alltime> dateQuery(@RequestParam String date) {
		ArrayList<Alltime> dq = bookingService.dateQuery(date);
		
		return dq ;
	}
	
	@RequestMapping("/phoneQuery")
	@ResponseBody
	public ArrayList<Alltime> phoneQuery(@RequestParam String phone){
		ArrayList<Alltime> pq = bookingService.phoneQuery(phone);
		
		return pq ;
	}
	
	
	@RequestMapping(value="/bookingNumQuery",method = RequestMethod.POST)
	@ResponseBody
	public BookingData bookingNumQuery(@RequestParam Integer number,Model model) {
		BookingData data = bookingService.bookingNumQuery(number);
		
		return data ;
	}
	

}
