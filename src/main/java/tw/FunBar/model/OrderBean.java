package tw.FunBar.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "Orders")
public class OrderBean implements Serializable {
 private static final long serialVersionUID = 1L;

 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private Integer orderId;
 private String orderTime;
 private Double totalAmount;
 private Integer memberId;
 private String memberName;
 private String memberPhone;
 
 
 private String payment;
 private String shippingAddress;

 @OneToMany(mappedBy = "ob", cascade = CascadeType.ALL)
 private Set<OrderItemBean> orderItem = new LinkedHashSet<>();

 public OrderBean() {
 }

 public Integer getOrderId() {
  return orderId;
 }

 public void setOrderId(Integer orderId) {
  this.orderId = orderId;
 }

 public String getOrderTime() {
  return orderTime;
 }

 public void setOrderTime(String orderTime) {
  this.orderTime = orderTime;
 }

 public Double getTotalAmount() {
  return totalAmount;
 }

 public void setTotalAmount(Double totalAmount) {
  this.totalAmount = totalAmount;
 }

 public Integer getMemberId() {
  return memberId;
 }

 public void setMemberId(Integer memberId) {
  this.memberId = memberId;
 }

 public String getPayment() {
  return payment;
 }

 public void setPayment(String payment) {
  this.payment = payment;
 }

 public String getShippingAddress() {
  return shippingAddress;
 }

 public void setShippingAddress(String shippingAddress) {
  this.shippingAddress = shippingAddress;
 }

 public Set<OrderItemBean> getOrderItem() {
  return orderItem;
 }

 public void setOrderItem(Set<OrderItemBean> orderItem) {
  this.orderItem = orderItem;
 }

 public String getMemberName() {
  return memberName;
 }

 public void setMemberName(String memberName) {
  this.memberName = memberName;
 }

 public String getMemberPhone() {
  return memberPhone;
 }

 public void setMemberPhone(String memberPhone) {
  this.memberPhone = memberPhone;
 }
 
 
}