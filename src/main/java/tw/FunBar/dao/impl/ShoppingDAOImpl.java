package tw.FunBar.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.FunBar.dao.ShoppingDAO;
import tw.FunBar.model.ProductBean;
import tw.FunBar.model.Report;

@Repository
public class ShoppingDAOImpl implements ShoppingDAO {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> showNewProducts() { // FunBar首頁顯示最新上架三筆商品
		String hql = "From ProductBean where stock !=0 And status=0 order by productId desc";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).setFirstResult(0).setMaxResults(10).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByPage(int index) { // Mall分頁
		String hql = "FROM ProductBean Where stock!=0 And status=0 ";
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list;
		list = (List<ProductBean>) session.createQuery(hql).setFirstResult((index - 1) * 12).setMaxResults(12)
				.getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getIndex() { // Mall取得分頁數
		String hql = "From ProductBean Where stock!=0 And status=0";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();

		int listCount = list.size() / 12;

		if (list.size() % 12 == 0) {
			return listCount;
		} else {
			listCount = listCount + 1;
			return listCount;

		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllproducts1(int index) { // 後台管理顯示所有商品
		String hql = "From ProductBean";
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setFirstResult((index - 1) * 12).setMaxResults(12).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getProdIndex1() { // 後台管理商品取得分頁數
		String hql = "From ProductBean order by productId ASC";
		Session session = null;
		session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();

		int listCount = list.size() / 12;

		if (list.size() % 12 == 0) {
			return listCount;
		} else {
			listCount = listCount + 1;
			return listCount;

		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCategories() {
		String hql = "Select Distinct category From ProductBean";
		Session session = factory.getCurrentSession();
		List<String> list = new ArrayList<>();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductByCategory(String category, Integer index) { // Category分頁
		String hql = "From ProductBean Where category = :category And stock != 0 And status=0";
		Session session = factory.getCurrentSession();
		List<ProductBean> list = new ArrayList<>();
		list = session.createQuery(hql).setParameter("category", category).setFirstResult((index - 1) * 12)
				.setMaxResults(12).getResultList();

		for (ProductBean p : list) {
			System.out.println("ProductBean:" + p.getCategory());
			System.out.println("ProductBean:" + p.getProductName());
		}
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getCategoryIndex(String category) { // Category取得分頁數
		String hql = "From ProductBean Where category = :category And stock != 0 And status=0";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("category", category).getResultList();

		int listCount = list.size() / 12;

		if (list.size() % 12 == 0) {
			return listCount;
		} else {
			listCount = listCount + 1;
			return listCount;

		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() { // 前台Mall介面，只顯示有庫存的商品
		String hql = "From ProductBean Where stock !=0 And status=0";
		Session session = null;
		List<ProductBean> list = new ArrayList<>();
		session = factory.getCurrentSession();
		list = session.createQuery(hql).getResultList();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<ProductBean> getProdById(Integer productId) {
		String hql = "From ProductBean Where productId = :productId";
		Session session = factory.getCurrentSession();
		ArrayList<ProductBean> pb = (ArrayList<ProductBean>) session.createQuery(hql)
				.setParameter("productId", productId).getResultList();
		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProdByName(String productName, Integer index) {
		String hql = "From ProductBean Where productName Like :productName";
		Session session = factory.getCurrentSession();
		List<ProductBean> pb = new ArrayList<>();
		pb = session.createQuery(hql).setParameter("productName", "%" + productName + "%")
				.setFirstResult((index - 1) * 12).setMaxResults(12).getResultList();

		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getPBNIndex(String productName) { // Category取得分頁數
		String hql = "From ProductBean Where productName Like :productName";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("productName", "%" + productName + "%").getResultList();

		int listCount = list.size() / 12;

		if (list.size() % 12 == 0) {
			return listCount;
		} else {
			listCount = listCount + 1;
			return listCount;

		}

	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProdByName2(String productName, Integer index) {
		String hql = "From ProductBean Where productName Like :productName And stock != 0 And status=0";
		Session session = factory.getCurrentSession();
		List<ProductBean> pb = new ArrayList<>();
		pb = session.createQuery(hql).setParameter("productName", "%" + productName + "%")
				.setFirstResult((index - 1) * 12).setMaxResults(12).getResultList();

		return pb;
	}

	@SuppressWarnings("unchecked")
	@Override
	public int getPBNIndex2(String productName) {
		String hql = "From ProductBean Where productName Like :productName And stock != 0 And status=0";
		List<ProductBean> list = new ArrayList<>();
		Session session = factory.getCurrentSession();
		list = session.createQuery(hql).setParameter("productName", "%" + productName + "%").getResultList();

		int listCount = list.size() / 12;

		if (list.size() % 12 == 0) {
			return listCount;
		} else {
			listCount = listCount + 1;
			return listCount;

		}
	}
}
