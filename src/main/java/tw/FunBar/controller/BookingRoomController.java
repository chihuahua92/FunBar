package tw.FunBar.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.FunBar.model.Category;
import tw.FunBar.model.Member;
import tw.FunBar.model.Room;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.model.RoomStatus;
import tw.FunBar.service.EmailService;
import tw.FunBar.service.RoomService;

@Controller
public class BookingRoomController {
	
	@Autowired
	RoomService roomService;
	
	
	
	@Autowired
	EmailService emailService;
	
	
	
	@RequestMapping("/booking_room")
	public String bookingRoom() {
		return "booking_room";
	}
	
	
	@RequestMapping("/chooseRoom")
	public String chooseRoom(@RequestParam String date,@RequestParam Integer stay,Integer rooms, Model model) throws ParseException {
		
		Set<Room> okroom = roomService.pullRoom(date, stay,rooms);
		
		model.addAttribute("okroom", okroom);
		model.addAttribute("date", date);
		model.addAttribute("stay", stay);
		model.addAttribute("rooms", rooms);
		
		return "chooseRoom";
	}
	
	@RequestMapping("/admin_chooseRoom")
	public String adminChooseRoom(@RequestParam String date,@RequestParam Integer stay,Integer rooms, Model model) throws ParseException {
		
		Set<Room> okroom = roomService.pullRoom(date, stay,rooms);
		
		model.addAttribute("okroom", okroom);
		model.addAttribute("date", date);
		model.addAttribute("stay", stay);
		model.addAttribute("rooms", rooms);
		
		return "admin_chooseRoom";
	}
	
	
	@RequestMapping("/room_type")
	public String roomtype(Model model) {
		ArrayList<Room> room = roomService.allRoom();
		model.addAttribute("room",room);
		return "room_type";
	}
	
	@RequestMapping("/add_form")
	public String addform(Model model) {
		model.addAttribute("room",new Room());
		return "add_form";
	}
	
	@RequestMapping("/add_room")
	public String addRoom(@ModelAttribute("room") Room room) {
		roomService.addRoom(room);
		
		return "redirect:/room_type";
	}
	
	@RequestMapping("/room/{room_id}")
	public ResponseEntity<byte[]> getImage(HttpServletResponse resp, @PathVariable Integer room_id){
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		Room room = roomService.getImage(room_id);
		if (room != null) {
			Blob blob = room.getRoom_image();
			filename = room.getRoom_image_filename();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media,HttpStatus.OK);
		return responseEntity;
	}
	
//	@RequestMapping("/add_order")
//	public String addOrder(@RequestParam String date,@RequestParam Integer stay,@RequestParam Integer rooms,Model model) {
//		
//		model.addAttribute("date",date);
//		model.addAttribute("stay",stay);
//		model.addAttribute("rooms", rooms);
//		
//		return "add_order";
//	}
	
	@RequestMapping("/confirm_order")
	public String confirmOrder(@RequestParam Integer room_id,@RequestParam String date,@RequestParam Integer stay,@RequestParam Integer rooms,Model model) {
		
		Room room = roomService.getRoomById(room_id);
		
		model.addAttribute("room",room);
		Integer total = room.getRoom_price() * stay * rooms;
		model.addAttribute("date",date);
		model.addAttribute("stay",stay);
		model.addAttribute("rooms",rooms);
		model.addAttribute("total",total);
		model.addAttribute("room_order", new RoomOrder());
		
		return "confirm_order";
	}
	
	@RequestMapping("/admin_confirm_order")
	public String adminConfirmOrder(@RequestParam Integer room_id,@RequestParam String date,@RequestParam Integer stay,@RequestParam Integer rooms,Model model) {
		
		Room room = roomService.getRoomById(room_id);
		
		model.addAttribute("room",room);
		Integer total = room.getRoom_price() * stay * rooms;
		model.addAttribute("date",date);
		model.addAttribute("stay",stay);
		model.addAttribute("rooms",rooms);
		model.addAttribute("total",total);
		model.addAttribute("room_order", new RoomOrder());
		
		return "admin_confirm_order";
	}
	
	@RequestMapping("/adpay")
	public String adOrder(@ModelAttribute("RoomOrder") RoomOrder room_order,Integer total) throws ParseException {
		
		
		Room room = roomService.getRoomById(room_order.getRoom_id());
		
		room_order.setRoom(room);
		room_order.setCheck_in(0);
		room_order.setTotal(total);
		
		//roomService.addOrderInDays(room_order);
		
		roomService.addRoomOrder(room_order);
		
		
		
		
		return "redirect:/allOrder";
	}
	
	@RequestMapping(value = "/pay")
	public String payByEcPay(@RequestParam Integer room_id, Model model,HttpSession session,
			HttpServletRequest req, RedirectAttributes redirect,@ModelAttribute("RoomOrder") RoomOrder room_order,@RequestParam Integer stay) throws ParseException {
		
		
		
		Room room = roomService.getRoomById(room_order.getRoom_id());
		
		room_order.setRoom(room);
		//roomService.addRoomOrder(room_order);
		
		session.setAttribute("order", room_order);
		session.setAttribute("type", room.getRoom_type());
		session.setAttribute("stay",stay);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Room r = roomService.getRoomById(room_id);
		Timestamp ts = new Timestamp(System.currentTimeMillis());
		Map<String, String> errMsg = new HashMap<>();
		model.addAttribute("errMsg", errMsg);
		
		String base = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort()
				+ req.getContextPath(); // http:localhost:XXXX/eeit108Theater
		// EcPay Begin
		// EcPay對各項method都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime(); // 指定付款方式為信用卡一次付清
		
		int sss=((int)((Math.random()*9+1)*12345));
		
		
		
		
		
		String str = String.valueOf(sss);
		
		//room_order.setOrder_id(sss);
		room_order.setCheck_in(0);
		room_order.setStatus("已付款");
		
		
		
		
		
		//roomService.addOrderInDays(room_order);
		
		obj.setMerchantTradeNo(str); // 設定訂單編號
		obj.setMerchantTradeDate(sdf.format(ts)); // 設定交易日期
		obj.setTotalAmount(String.valueOf(room_order.getTotal())); // 設定總付款金額
		obj.setTradeDesc("Order");
		obj.setItemName(r.getRoom_type()+"*"+room_order.getRooms()+"間"+"*"+room_order.getCheck_out_time()+"天"); // 設定顯示在EcPay頁面的購物清單
		obj.setReturnURL("http:localhost:8080/FunBar/");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL("http:localhost:8080/FunBar/result"); // EcPay會在付款結束後，將USER redirect至此，並附帶交易結果相關資訊
		obj.setNeedExtraPaidInfo("N"); // Y/N = True/False
		obj.setRedeem("N"); // 紅利 Y/N = True/False
		String form = all.aioCheckOut(obj, null); // null for no invoice
		// all.aioCheckOut會根據前面設定好的參數產生一個html表格的字串，
		// 裡面的各種input都已經設定好了，並且會自動submit，
		// 只要將這個字串加為attribute並且顯示在回傳頁面上，便會自動執行，並跳轉到EcPay付款頁面。
		// EcPay End
		

		
		
		session.setAttribute("room_order",room_order);
		session.setAttribute("room",room);
		System.out.println("form =\n" + form);
		model.addAttribute("ecpayForm", form);
		return "ecpay";
		
		
	}
	
	
	@RequestMapping("/result")
	public String result(HttpSession session,HttpServletRequest req) throws ParseException {
		
		session = req.getSession(false);
		
		RoomOrder roomOrder = (RoomOrder)session.getAttribute("room_order");
		
		Room room = roomService.getRoomById(roomOrder.getRoom_id());
		
		roomService.addRoomOrder(roomOrder);
		emailService.sendEmail(roomOrder,room);
		
				  
		return "result";
	}
	
	
	@RequestMapping("/room_info/{id}")
	public String roomInfo(@PathVariable Integer id,Model model) {
		System.out.println("id = " + id);
		Room room = roomService.getRoomById(id);
		model.addAttribute("room",room);
		return "room_info";
	}
	
	@RequestMapping("/allOrder")
	public String allOrder(Model model) {
		ArrayList<RoomOrder> orders =  roomService.allOrder(); 
		
		model.addAttribute("orders", orders);
		
		return "allOrder";
	}
	
	@RequestMapping("/pullOrderSingle")
	public String pullOrderSingle(@RequestParam Integer id,Model model) {
			
		RoomOrder order = roomService.pullOrderSingle(id);
		model.addAttribute("order", order);
		
		return "pullOrderSingle";
	}
	
	
	@RequestMapping("/admin_RoomBooking")
	public String ad_RoomBooking() {
		return "admin_RoomBooking";
	}
	
	@RequestMapping(value="/admin/pullTodayRoomStatus",method=RequestMethod.POST)
	public String pullTodayStatus(@RequestParam String date , Model model) throws ParseException {
		
		ArrayList<Room> pullTodayRoomStatus = roomService.pullTodayRoomStatus(date);
		
		ArrayList<Room> allroom = roomService.allRoom();
		
		
		
		model.addAttribute("allroom", allroom);
		model.addAttribute("pullTodayRoomStatus", pullTodayRoomStatus);
		

		
		return "pullTodayStatus";
		
		
	}
	
	@RequestMapping("/cancelRoom/{id}")
	public String cancelRoom(@PathVariable Integer id) {
		
		roomService.cancelRoom(id);
		
		return "redirect:/room_type";
	}
	
	@RequestMapping("/pullSingleRoom/{id}")
	public ModelAndView pullSingleRoom(RedirectAttributes redirectAttributes,@PathVariable Integer id,Model model) {
			Room room = roomService.getRoomById(id);
			redirectAttributes.addFlashAttribute("room_info",room);
			//model.addAttribute("room_info", room);
			
			 ModelAndView mv = new ModelAndView("redirect:/up_Form");
			return mv;
	}
	
	@RequestMapping("/up_Form")
	public String upForm() {
		return "up_Form";
	}
	
	
	
	
	@RequestMapping("/update_room")
	public String updateRoom(@RequestParam Integer room_id,@RequestParam String room_type,@RequestParam Integer room_quantity,@RequestParam Integer room_price,
			@RequestParam Integer room_people,@RequestParam String room_bed,@RequestParam Integer room_pings,@RequestParam String room_description,@RequestParam MultipartFile imageCover)throws IOException {
			
			roomService.updateRoom(room_id,room_type,room_quantity,room_price,room_people,room_bed,room_pings,room_description,imageCover);
			
			return "redirect:/room_type";
	}
	
	@RequestMapping("/dateSearch")
	@ResponseBody
	public ArrayList<RoomOrder> dateSearch(@RequestParam String date)throws ParseException {
			ArrayList<RoomOrder> ro = roomService.dateSearch(date);
			
			
			return ro;
	}
	
	@RequestMapping("/phoneSearch")
	@ResponseBody
	public ArrayList<RoomOrder> phoneSearch(@RequestParam String phone)throws ParseException {
			ArrayList<RoomOrder> ro = roomService.phoneSearch(phone);
			
			
			return ro;
	}
	
	
	@RequestMapping("/booking_query")
	public String bookingQuery() {
		return "booking_query";
	}
	

	@RequestMapping(value = "/roomNumQuery",method = RequestMethod.POST)
	public String roomNumQuery(@RequestParam Integer number,Model model) {
		RoomOrder order = roomService.roomNumQuery(number);
		
		 Integer id = order.getRoom().getRoom_id();
		
		
	
		
		Room room = roomService.getRoomById(id);
		
		
		model.addAttribute("order", order);
		model.addAttribute("room",room);
		
		
		
		return "roomNumQuery";
	}
	
	@RequestMapping("/cancelOrder")
	public String cancelOrder(@RequestParam Integer id) {
		roomService.cancelOrder(id);
		
		return "redirect:/allOrder";
	}
	
	@RequestMapping("/check_in")
	public String checkIn(Model model) {
		
		roomService.createOrderList();
		
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");



		String date = fm.format(new Date());
		
		ArrayList<RoomOrder > orders = roomService.getTodayOrder(date);

		ArrayList<RoomStatus> allroom = roomService.getAllRoomStatus();
		
		
		
		model.addAttribute("allroom",allroom);
		
		model.addAttribute("orders", orders);
		
		return "check_in";
	}
	
	
	@RequestMapping("/clear_all_room")
	public String clearAllRoom() {
		roomService.clearAllRoom();
		
		return "redirect:/check_in";
	}
	
	
//	@RequestMapping("/all_type_count")
//	public String allTypeCount(Model model) {
//		
//		roomService.createOrderList();
//		
//		
//		
//		
//		
//		
//		SimpleDateFormat fm = new SimpleDateFormat("yyyy-MM-dd");
//
//
//
//		String date = fm.format(new Date());
//		
//		ArrayList<RoomOrder > orders = roomService.getTodayOrder(date);
//		
//		ArrayList<RoomStatus> allroom = roomService.getAllRoomStatus();
//		
//		model.addAttribute("allroom",allroom);
//		model.addAttribute("orders", orders);
//		
//		
//		return "allTypeCount" ;
//		
//		
//	}
	
	
	@RequestMapping("/update_room_status")
	public String updateRoomStatus(@RequestParam Integer room_number,@RequestParam Integer order_id,@RequestParam String name) {
		
		roomService.updateRoomStatus(room_number,order_id,name);
		
		return "redirect:/check_in";
	}
	
	
	@RequestMapping("/check_out")
	public String checkOut(@RequestParam Integer order_id,@RequestParam Integer room_number) {
		
		roomService.checkOut(order_id,room_number);
		
		return "redirect:/check_in";
	}
	
	
	@RequestMapping("/personal_order")
	public String personalOrder(Model model,HttpServletRequest req,HttpSession session) {
		
		session = req.getSession(false);
		
		 Member member = (Member) session.getAttribute("member");
		
		ArrayList<RoomOrder> orders = roomService.personalOrder(member.getMemberPhone());
		
		model.addAttribute("orders",orders);
		
		return "personal_order";
	}
	
}
