package tw.FunBar.service;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;

public interface OrderHandleService {
	
	public ProductBean getProductById(Integer productId);
	
	void addProduct(ProductBean pb);
		
	void pullProduct(Integer productId);  //商品下架
	 
	void pushProduct(Integer productId);  //商品重新上架

	void updateProduct(Integer productId,String productNo,Blob productCover,String productDetail,String productName, 
			String category, Double unitPrice,Double discount,Integer stock);
	
	public int addOrder(OrderBean order);

	void addOrderItemList(List<OrderItemBean> orderItemList);

	public OrderBean getOrderById(int od);

	public ArrayList<OrderBean> getMyOrders(int id,HttpServletRequest req);

	public ArrayList<OrderBean> getAllOrders(HttpServletRequest req);
	
	public List <ProductBean> getLessStockProduct();
	
	int getProductTotalIncome();
	
	

}
