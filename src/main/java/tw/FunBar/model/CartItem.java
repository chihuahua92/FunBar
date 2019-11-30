package tw.FunBar.model;

import java.math.BigDecimal;

public class CartItem {

	private ProductBean product;
	private int count;

	public CartItem() {
	}

	// 小計方法，處理二進制運算誤差
	public double getSubtotal() {
		BigDecimal d1 = new BigDecimal(product.getUnitPrice());
		BigDecimal d2 = new BigDecimal(count);

		return d1.multiply(d2).doubleValue();
	}

	public ProductBean getProduct() {
		return product;
	}

	public void setProduct(ProductBean product) {
		this.product = product;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

}
