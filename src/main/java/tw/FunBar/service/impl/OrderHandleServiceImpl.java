package tw.FunBar.service.impl;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.OrderHandleDAO;
import tw.FunBar.model.OrderBean;
import tw.FunBar.model.OrderItemBean;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.OrderHandleService;

@Service
public class OrderHandleServiceImpl implements OrderHandleService{
 @Autowired
 OrderHandleDAO dao;


 @Transactional
 @Override
 public void addProduct(ProductBean pb) {
  dao.addProduct(pb); 
 }

 @Transactional
 @Override
 public ProductBean getProductById(Integer productId) {
  return dao.getProductById(productId);
 }



 @Transactional
 @Override
 public void pullProduct(Integer productId) {
	 dao.pullProduct(productId);  
 }
 
 
 @Transactional
 @Override
 public void pushProduct(Integer productId) {
 	dao.pushProduct(productId);
 }


 @Transactional
 @Override
 public void updateProduct(Integer productId, String productNo,Blob productCover,String productDetail, String productName,
    String category, Double unitPrice,Double discount, Integer stock) {
   dao.updateProduct(productId, productNo,productCover,productDetail, productName, category,unitPrice ,discount, stock);
  
 }

 @Transactional
 @Override
 public int addOrder(OrderBean order) {
  return dao.addOrder(order);
  
 }

 @Transactional
 @Override
 public OrderBean getOrderById(int od) {
  
  return dao.getOrderById(od);
 }

@Transactional
@Override
public ArrayList<OrderBean> getMyOrders(int id,HttpServletRequest req) {
	
	return dao.getMyOrders(id,req);
}

@Transactional
@Override
public void addOrderItemList(List<OrderItemBean> orderItemList) {
 // TODO Auto-generated method stub
 
}

@Override
public ArrayList<OrderBean> getAllOrders(HttpServletRequest req) {
	
	return dao.getAllOrders(req);
}

@Transactional
@Override
public List<ProductBean> getLessStockProduct() {
	return dao.getLessStockProduct();
}

@Transactional
@Override
public int getProductTotalIncome() {
	return dao.getProductTotalIncome();
}

 
 
 
}