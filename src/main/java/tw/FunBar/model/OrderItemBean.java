package tw.FunBar.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ORDERITEMS")
public class OrderItemBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderItemId;
	
	//@Transient
	//private Integer orderId;
	
	private Integer productId;
	private Integer quantity;
	private Integer subTotal;

	@ManyToOne
	@JoinColumn(name = "ORDERID")
	private OrderBean ob;

	public OrderItemBean() {
	}

	public Integer getOrderItemId() {
		return orderItemId;
	}

	public void setOrderItemId(Integer orderItemId) {
		this.orderItemId = orderItemId;
	}
	

//	public Integer getOrderId() {
//		return orderId;
//	}

//	public void setOrderId(Integer orderId) {
//		this.orderId = orderId;
//	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public OrderBean getOb() {
		return ob;
	}

	public void setOb(OrderBean ob) {
		this.ob = ob;
	}

	public Integer getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(Integer subTotal) {
		this.subTotal = subTotal;
	}



}
