package tw.FunBar.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.ProductBean;
import tw.FunBar.service.ShoppingService;

@Service
public class ShoppingServiceImpl implements ShoppingService {
	@Autowired
	ShoppingDAO dao;

	@Transactional
	@Override
	public List<ProductBean> showNewProducts() {
		return dao.showNewProducts();
	}

	@Override
	public List<ProductBean> getProductByPage(int index) {
		return dao.getProductByPage(index);
	}

	@Override
	public int getIndex() {
		return dao.getIndex();
	}

	@Transactional
	@Override
	public List<ProductBean> getAllProducts1(int index) {
		return dao.getAllproducts1(index);
	}

	@Transactional
	@Override
	public int getProdIndex1() {
		return dao.getProdIndex1();
	}

	@Transactional
	@Override
	public List<String> getAllCategories() {
		return dao.getAllCategories();
	}

	@Transactional
	@Override
	public List<ProductBean> getProductByCategory(String category, Integer index) {
		return dao.getProductByCategory(category, index);
	}

	@Transactional
	@Override
	public int getCategoryIndex(String category) {
		return dao.getCategoryIndex(category);
	}

	@Transactional
	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Transactional
	@Override
	public ArrayList<ProductBean> getProdById(Integer productId) {
		return dao.getProdById(productId);
	}

	@Override
	public List<ProductBean> getProdByName(String productName, Integer index) {
		return dao.getProdByName(productName, index);
	}

	@Override
	public int getPBNIndex(String productName) {
		return dao.getPBNIndex(productName);
	}

	@Override
	public List<ProductBean> getProdByName2(String productName, Integer index) {
		return dao.getProdByName2(productName, index);
	}

	@Override
	public int getPBNIndex2(String productName) {
		return dao.getPBNIndex2(productName);
	}

}
