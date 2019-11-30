package tw.FunBar.model;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

public class Cart {
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();

	public double getTotal() {
		BigDecimal total = new BigDecimal("0");
		for (CartItem cartItem : map.values()) {
			BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtotal());
			total = total.add(subtotal);
		}
		return total.doubleValue();
	}

	public void add(CartItem cartItem) {
		if (map.containsKey(cartItem.getProduct().getProductId())) {
			// 判斷原來車中是否含有項目
			CartItem old_cartItem = map.get(cartItem.getProduct().getProductId());

			// 已有的購物項目 + 新增數量
			old_cartItem.setCount(old_cartItem.getCount() + cartItem.getCount());

			// 改變成新數量
			map.put(cartItem.getProduct().getProductId(), old_cartItem);
		} else {
			map.put(cartItem.getProduct().getProductId(), cartItem);
		}
	}
	
	public void add1(CartItem cartItem) {
		//if (map.containsKey(cartItem.getProduct().getProductId())) {
			// 判斷原來車中是否含有項目
			//CartItem old_cartItem = map.get(cartItem.getProduct().getProductId());

			// 已有的購物項目 + 新增數量
			//old_cartItem.setCount(old_cartItem.getCount() + cartItem.getCount());

			// 改變成新數量
			//map.put(cartItem.getProduct().getProductId(), old_cartItem);
		//} else {
			map.put(cartItem.getProduct().getProductId(), cartItem);
		}
//	}

	public void clear() {
		map.clear();
	}

	public void delete(Integer productId) {
		map.remove(productId);
	}

	public Collection<CartItem> getCartItems() {
		return map.values();
	}
}
