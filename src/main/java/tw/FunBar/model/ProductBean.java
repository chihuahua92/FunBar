package tw.FunBar.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Products")
public class ProductBean implements Serializable{
 private static final long serialVersionUID = 1L;
 @Id
 @GeneratedValue(strategy=GenerationType.IDENTITY)
 private Integer productId ;
 private String productNo ;
 private String productName;
 private String productDetail;
 
 @JsonIgnore
 private Blob productImage;
 private String fileName;
 private String category;
 private Double unitPrice;
 private Double discount ;
 private Integer stock;
 private Integer status;

 @Transient
 @JsonIgnore
 private MultipartFile productCover;
 public MultipartFile getProductCover() {
  return productCover;
 }

 public void setProductCover(MultipartFile productCover) {
  this.productCover = productCover;
 }
 
// public MultipartFile getProductCover() {
//  return productCover;
// }
// public void setProductCover(MultipartFile productCover) {
//  this.productCover = productCover;
// }
 


 public ProductBean(Integer productId,String productNo, String productName,
   String productDetail, Blob productImage, String fileName, String category,
   double unitPrice, double discount, Integer stock,Integer status) {
   this.productId = productId;
   this.productNo = productNo;
   this.productName = productName;
   this.productDetail = productDetail;
   this.productImage = productImage;
   this.fileName = fileName;
   this.category = category;
   this.unitPrice = unitPrice;
   this.discount = discount;
   this.stock = stock;
   this.status=status;
 }
 
 public ProductBean() {
  
 }
 
 public Integer getStatus() {
	return status;
}

public void setStatus(Integer status) {
	this.status = status;
}

 public Integer getProductId() {
  return productId;
 }
 
 public void setProductId(Integer productId) {
  this.productId = productId;
 }
 public String getProductNo() {
  return productNo;
 }
 public void setProductNo(String productNo) {
  this.productNo = productNo;
 }
 public String getProductName() {
  return productName;
 }
 public void setProductName(String productName) {
  this.productName = productName;
 }
 public String getProductDetail() {
  return productDetail;
 }
 public void setProductDetail(String productDetail) {
  this.productDetail = productDetail;
 }
 
 public String getFileName() {
  return fileName;
 }

 public Blob getProductImage() {
  return productImage;
 }
 public void setProductImage(Blob productImage) {
  this.productImage = productImage;
 }
 public void setFileName(String fileName) {
  this.fileName = fileName;
 }
 public String getCategory() {
  return category;
 }
 public void setCategory(String category) {
  this.category = category;
 }
 
 public Double getUnitPrice() {
  return unitPrice;
 }
 
 public void setUnitPrice(Double unitPrice) {
  this.unitPrice = unitPrice;
 }

 public Double getDiscount() {
  return discount;
 }
 public void setDiscount(Double discount) {
  this.discount = discount;
  
 }

 public Integer getStock() {
  return stock;
 }
 
 public void setStock(Integer stock) {
  this.stock = stock;
 }



}