package tw.FunBar.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import tw.FunBar.model.Cart;
import tw.FunBar.model.CartItem;
import tw.FunBar.model.Member;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;
import tw.FunBar.model.RoomOrder;
import tw.FunBar.service.OrderHandleService;
import tw.FunBar.service.impl.OrderHandleServiceImpl;

@Controller
public class CartController {
	@Autowired
	OrderHandleService orderHandleService;

	@Autowired
	ServletContext context;

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String addCart(HttpServletRequest request, HttpSession session, HttpServletRequest response,
			@RequestParam Integer productId, @RequestParam Integer count, Model model) throws IOException {
		session = request.getSession(false);

		// 未來整合 login 才能產生購物車
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			Gson gson = new Gson();
			String redirect = gson.toJson("2");  //未登入狀態下按點擊add to cart
			model.addAttribute("redirect", redirect);
			return "cart";
		}
		Cart cart = (Cart) session.getAttribute("Cart");

		if (cart == null) {
			cart = new Cart();
			session.setAttribute("Cart", cart);
		}

		ProductBean product = orderHandleService.getProductById(productId);
		Collection<CartItem> cartItemList = cart.getCartItems();
		int old_count = 0;
		for(CartItem item:cartItemList) {
			if(item.getProduct().getProductId() == productId) {
				old_count = item.getCount();
			}
		}
		int checkStockNum = old_count + count;
		if(product.getStock() < checkStockNum) {
			Gson gson = new Gson();
			String status = gson.toJson("1");
			model.addAttribute("status", status);
			return "cart";
		}
		//product.getStock() < (count+cart.getCartItems().get(productId))

		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setCount(count);
		cart.add(cartItem);
		session.setAttribute("Cart", cart);

		return "cart";

	}


	@RequestMapping(value = "/changecart", method = RequestMethod.POST)
	public String changecart(HttpServletRequest request, HttpSession session, HttpServletRequest response,
			@RequestParam Integer productId, @RequestParam Integer count) throws IOException {
		session = request.getSession(false);

		// 未來整合 login 才能產生購物車
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member == null)
			return "redirect:/signin";
		Cart cart = (Cart) session.getAttribute("Cart");

		if (cart == null) {
			cart = new Cart();
			session.setAttribute("Cart", cart);
		}

		ProductBean product = orderHandleService.getProductById(productId);

		CartItem cartItem = new CartItem();
		cartItem.setProduct(product);
		cartItem.setCount(count);
		cart.add1(cartItem);
		session.setAttribute("Cart", cart);

//  Collection<CartItem> item = cart.getCartItems();
//  for (CartItem c : item) {
//   System.out.println("購買產品id:" + c.getProduct().getProductId());
//   System.out.println("購買產品名稱:" + c.getProduct().getProductName());
//   System.out.println("購買產品數量:" + c.getCount());
//  }

		return "cart";

	}

	@RequestMapping(value = "/showCart")
	public String showCart(HttpServletRequest request, HttpSession session, Model model) throws IOException {
		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member == null)
			return "redirect:/signin";
		Cart cart = (Cart) session.getAttribute("Cart");


		if (cart == null || cart.getCartItems().size() == 0) {
			return "showEmptyCart";
		} else {
			return "showCart";
		}
	}

	@RequestMapping(value = "/removeCartItem")
	public String rvemoveCartItem(HttpServletRequest request, HttpSession session,
			@RequestParam("productId") Integer productId, Model model) {
		session = request.getSession(false);
		Cart cart = (Cart) session.getAttribute("Cart");
		cart.delete(productId);

		if (cart.getCartItems().size() == 0) {
			return "showEmptyCart";
		} else {
			return "redirect:/showCart";
		}

	}

	@RequestMapping(value = "/deleteCartItem")
	public String deleteCartItem(HttpServletRequest request, HttpSession session) {
		session = request.getSession(false);
		Cart cart = (Cart) session.getAttribute("Cart");
		cart.clear();

		return "showEmptyCart";
	}

	@RequestMapping(value = "/ProductPictures/{productId}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getPicture(HttpServletResponse resp, @PathVariable Integer productId) {
		String filePath = "/WEB-INF/views/ProductImages/noImage.png";

		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		ProductBean pb = orderHandleService.getProductById(productId);
		if (pb != null) {
			Blob blob = pb.getProductImage();
			filename = pb.getFileName();
			System.out.println("filename" + filename);
			System.out.println("blob" + blob);
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ShoppingController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(filePath);
				filename = filePath;
			}
		} else {
			media = toByteArray(filePath);
			filename = filePath;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}

	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}

	// 新增訂單
	@RequestMapping("/orderSetUp")
	public String orderSetUp(HttpServletRequest request, HttpSession session, String address, Model model, Cart c) {

		session = request.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member.getMemberName() == null) {
			return "redirect:/signin";
		}

		// 取得購物車
		Cart cart = (Cart) session.getAttribute("Cart");
		if (cart == null) {
			System.out.println("cart is null");
			return "redirect:/signin";
		}

		// 於購物車建立訂單
		OrderBean order = new OrderBean();
		model.addAttribute("orderbean", order);

		// 產生當下時間
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String createdTime = sdf.format(d);
		order.setOrderTime(createdTime);
		order.setTotalAmount(cart.getTotal());

		System.out.println("memberID:" + member.getId());
		order.setMemberId(member.getId());
		order.setShippingAddress("taipei");

		// 訂單項目
		Set<OrderItemBean> orderItemList = new LinkedHashSet<OrderItemBean>();

		for (CartItem cartItem : cart.getCartItems()) {
			OrderItemBean orderItem = new OrderItemBean();
			orderItem.setProductId(cartItem.getProduct().getProductId());
			orderItem.setQuantity(cartItem.getCount());
			// 候畫面產生，需再測試
			orderItem.setSubTotal((int) (cartItem.getSubtotal() * cartItem.getProduct().getDiscount() / 10));
			orderItemList.add(orderItem);
		}

		order.setOrderItem(orderItemList);
		session.setAttribute("order", order);

		return "redirect:/cartpay";
	}

	@RequestMapping(value = "/cartpay")
	public String payByEcPay(HttpServletRequest req, HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		// session 取得 order 訂單
		session = req.getSession(false);
		OrderBean order = (OrderBean) session.getAttribute("order");

		order.setMemberId(member.getId());
		System.out.println("==========================>" + order.getMemberId());
		order.setMemberName(member.getMemberName());
		order.setMemberPhone(member.getMemberPhone());

		// http://localhost:XXXX/FunBar
		String base = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath();

		// EcPay Begin
		// EcPay 對各項 method 都有簡單註解說明，可以將滑鼠移動到方法上查看
		AllInOne all = new AllInOne("");

		// 指定付款方式為信用卡一次付清
		AioCheckOutOneTime obj = new AioCheckOutOneTime();

		int randomOrderId = ((int) ((Math.random() * 9 + 1) * 12345));

		// 未來替代隨機的 PK
		order.setOrderId(randomOrderId);
		order.setPayment("已付款");
		// roomService.addRoomOrder(room_order);

		obj.setMerchantTradeNo(String.valueOf(randomOrderId)); // 設定訂單編號

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		order.setOrderTime(sdf.format(ts));
		obj.setMerchantTradeDate(order.getOrderTime()); // 設定交易日期

		

		int totalAmount = 0;
		for (OrderItemBean orderItemBean : order.getOrderItem()) {
			System.out.println("小計" + orderItemBean.getSubTotal());
			totalAmount += orderItemBean.getSubTotal();
		}

		obj.setTotalAmount(String.valueOf(totalAmount)); // 設定總付款金額
		obj.setTradeDesc("綠界支付");

		// 設定顯示在EcPay頁面的購物清單
		String orderItemListName = "";
		for (OrderItemBean orderItem : order.getOrderItem()) {
			ProductBean product = orderHandleService.getProductById(orderItem.getProductId());

			if (order.getOrderItem().size() > 1) {
				orderItemListName += product.getProductName() + " "
						+ (int) (product.getUnitPrice() * product.getDiscount() / 10) + " 元 x "
						+ +orderItem.getQuantity() + "#";
			} else {
				orderItemListName = product.getProductName() + " "
						+ (int) (product.getUnitPrice() * product.getDiscount() / 10) + " 元 x "
						+ orderItem.getQuantity();
			}
		}
		System.out.println("orderItemListName =>" + orderItemListName);
		obj.setItemName(orderItemListName);

		obj.setReturnURL("http://localhost:8080/FunBar/");// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// EcPay會將交易結果相關資訊以POST請求送來這個URL，但是localhost接不到這個。不過此項為必填資訊所以還是要set
		// 可以在交易結束後觀察底下對應requestMapping的method -- receive
		// 的system.err.println並不會出現在console中，藉此得知該方法並沒有被呼叫 -> 沒收到請求
		obj.setOrderResultURL("http://localhost:8080/FunBar/order_result"); // EcPay會在付款結束後，將USER redirect至此，並附帶交易結果相關資訊
		obj.setNeedExtraPaidInfo("N"); // Y/N = True/False
		obj.setRedeem("N"); // 紅利 Y/N = True/False
		String form = all.aioCheckOut(obj, null); // null for no invoice
		// all.aioCheckOut會根據前面設定好的參數產生一個html表格的字串，
		// 裡面的各種input都已經設定好了，並且會自動submit，
		// 只要將這個字串加為attribute並且顯示在回傳頁面上，便會自動執行，並跳轉到EcPay付款頁面。
		// EcPay End

		System.out.println("form =\n" + form);
		model.addAttribute("ecpayForm", form);
		return "ecpay";

	}

	@RequestMapping("/order_result")
	public String orderResult(HttpServletRequest req, HttpSession session, Model model) {

		session = req.getSession(false);
		OrderBean order = (OrderBean) session.getAttribute("order");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Timestamp ts = new Timestamp(System.currentTimeMillis());

		order.setPayment("已付款");
		order.setOrderTime(sdf.format(ts));

		int od = orderHandleService.addOrder(order);
		session.removeAttribute("order");

		// showOrder
		OrderBean showOrder = (OrderBean) orderHandleService.getOrderById(od);
		List<OrderItemBean> orderItemList = new ArrayList<>();
		List<ProductBean> showProducts = new ArrayList<>();

		for (OrderItemBean orderItem : showOrder.getOrderItem()) {
			ProductBean product = orderHandleService.getProductById(orderItem.getProductId());
			showProducts.add(product);
			orderItemList.add(orderItem);
		}

		session.setAttribute("showOrder", showOrder);
		session.setAttribute("showProducts", showProducts);
		session.setAttribute("orderItemList", orderItemList);
		
		session.removeAttribute("Cart");

		return "order_result";

	}

	// buy Cart Session
	@RequestMapping(value = "/buyCartJson", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String buyCartJson(HttpSession session) {
		Cart cart = (Cart) session.getAttribute("Cart");
		Collection<CartItem> cartItemList = cart.getCartItems();

		Gson gson = new Gson();
		String cartItemListJson = gson.toJson(cartItemList);

		// model.addAttribute("cartItemList", cartItemListJson);
		return cartItemListJson;
	}

	@RequestMapping("/showMemOrders")
	public String getOrdersByMember(Model model, HttpServletRequest req, HttpSession session) {
		session = req.getSession(false);
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/signin";
		}
		
		ArrayList<OrderBean> orders = orderHandleService.getMyOrders(member.getId(),req);
		if (orders.isEmpty()) {
			return "showEmptyOrder";
		}
		
		model.addAttribute("orders", orders);

		return "showMemOrders";

	}
	
	@RequestMapping("/showAllOrders")
	public String getAllOrders(Model model, HttpServletRequest req) {
		
		ArrayList<OrderBean> orders = orderHandleService.getAllOrders(req);
		
		model.addAttribute("orders", orders);

		return "showAllOrders";

	}

}