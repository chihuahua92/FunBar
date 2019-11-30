package tw.FunBar.dao.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.bytebuddy.asm.Advice.ArgumentHandler.Factory;
import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;
import tw.FunBar.model.RoomOrder;

@Repository
public class OrderHandleDAOImpl implements OrderHandleDAO {
	@Autowired
	SessionFactory sessionFactory;

	@Override
	public void addProduct(ProductBean pb) {
		Session session = sessionFactory.getCurrentSession();
		session.save(pb);

	}

	@Override
	public ProductBean getProductById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		return pb;
	}

	@Override
	public void pullProduct(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		pb.setStatus(1);
		session.update(pb);
	}

	@Override
	public void pushProduct(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean pb = session.get(ProductBean.class, productId);
		pb.setStatus(0);
		session.update(pb);
	}

	@Override
	public void updateProduct(Integer productId, String productNo, Blob productCover, String productDetail,
			String productName, String category, Double unitPrice,Double discount, Integer stock) {

		System.out.print(productDetail);
		String hql = "Update ProductBean Set productName= :productName, productDetail= :productDetail,productImage= :productImage ,category= :category, unitPrice= :unitPrice,discount= :discount,stock= :stock,productNo = :productNo Where productId= :id";
		Session session = sessionFactory.getCurrentSession();
		session.createQuery(hql).setParameter("productName", productName).setParameter("productDetail", productDetail)
				.setParameter("productImage", productCover).setParameter("category", category)
				.setParameter("unitPrice", unitPrice)
				.setParameter("discount", discount).setParameter("stock", stock).setParameter("productNo", productNo)
				.setParameter("id", productId).executeUpdate();

	}

	@Override
	public int addOrder(OrderBean order) {
		Session session = sessionFactory.getCurrentSession();

		Double total = 0.0;
		for (OrderItemBean orderItem : order.getOrderItem()) {

			Integer id = orderItem.getProductId(); // 取得賣出的商品id
			Integer num = orderItem.getQuantity(); // 取得數量
			ProductBean product = session.get(ProductBean.class, id);
			Integer stock = product.getStock();
			product.setStock(stock - num);
			session.update(product);

			total += orderItem.getSubTotal();
			orderItem.setOb(order);

		}
		order.setTotalAmount(total);
		int od = (int) session.save(order);

		return od;

	}

	@Override
	public OrderBean getOrderById(int od) {

		Session session = sessionFactory.getCurrentSession();

		OrderBean order = session.get(OrderBean.class, od);
		return order;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<OrderBean> getMyOrders(Integer memberId, HttpServletRequest req) {
		Session session = sessionFactory.getCurrentSession();

		String hql = " From OrderBean where memberId  = :id";

		ArrayList<OrderBean> orders = (ArrayList<OrderBean>) session.createQuery(hql).setParameter("id", memberId)
				.getResultList();
		ArrayList<ArrayList<ProductBean>> allProduct = new ArrayList<>();
		for (OrderBean o : orders) {

			String hql1 = "From OrderItemBean where orderId = :order_id order by orderItemId ASC";

			ArrayList<OrderItemBean> items = (ArrayList<OrderItemBean>) session.createQuery(hql1)
					.setParameter("order_id", o.getOrderId()).getResultList();

			int id;
			ArrayList<ProductBean> showProducts = new ArrayList<>();
			for (int i = 0; i < items.size(); i++) {

				id = items.get(i).getProductId();

				ProductBean product = getProductById(id);
				showProducts.add(product);
			}

			allProduct.add(showProducts);

		}

		HttpSession session1 = req.getSession(false);

		session1.setAttribute("allProduct", allProduct);

		return orders;
	}

	@Override
	public ArrayList<OrderBean> getAllOrders(HttpServletRequest req) {
		
		Session session = sessionFactory.getCurrentSession();

		String hql = " From OrderBean";

		ArrayList<OrderBean> orders =(ArrayList<OrderBean>) session.createQuery(hql).getResultList();
		
		ArrayList<ArrayList<ProductBean>> allProduct = new ArrayList<>();
		for (OrderBean o : orders) {

			String hql1 = "From OrderItemBean order by orderItemId ASC";

			ArrayList<OrderItemBean> items = (ArrayList<OrderItemBean>) session.createQuery(hql1).getResultList();

			int id;
			ArrayList<ProductBean> showProducts = new ArrayList<>();
			for (int i = 0; i < items.size(); i++) {

				id = items.get(i).getProductId();

				ProductBean product = getProductById(id);
				showProducts.add(product);
			}

			allProduct.add(showProducts);

		}

		HttpSession session1 = req.getSession(false);

		session1.setAttribute("allProduct", allProduct);

		return orders;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getLessStockProduct() {
		String hql = "From ProductBean Where stock < 50 And status=0 Order by stock ASC";
		Session session = null;
		session = sessionFactory.getCurrentSession();
		List <ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setFirstResult(0).setMaxResults(3).getResultList();
			
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getProductTotalIncome() {
		String hql = "From OrderBean";
		Session session = null;
		session = sessionFactory.getCurrentSession();
		List <OrderBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		
		int income = 0 ;
		for(OrderBean ob : list) {
			
			income += ob.getTotalAmount();
		}
		return income;
	}

	
		

}