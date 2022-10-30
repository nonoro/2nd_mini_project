package kosta.dto;

public class OrderLineDTO {
	private int orderlineCode;
	private int orderCode;
	private String userId;
	private int productCode;
	private int orderlinePrice;
	private int orderlineQty;
	private int orderlineTotalPrice;
	private String productName;
	
	public OrderLineDTO() { }
	public OrderLineDTO(int orderlineCode, int orderCode, String userId, int productCode, int orderlinePrice,
			int orderlineQty, int orderlineTotalPrice) {
		this.orderlineCode = orderlineCode;
		this.orderCode = orderCode;
		this.userId = userId;
		this.productCode = productCode;
		this.orderlinePrice = orderlinePrice;
		this.orderlineQty = orderlineQty;
		this.orderlineTotalPrice = orderlineTotalPrice;
	}
	
	public OrderLineDTO(int orderlineCode, int orderCode, String userId, int productCode, int orderlinePrice,
			int orderlineQty, int orderlineTotalPrice, String productName) {
		this(orderlineCode, orderCode, userId, productCode, orderlinePrice, orderlineQty, orderlineTotalPrice);
		this.productName = productName;
	}
	
	public int getOrderlineCode() {
		return orderlineCode;
	}
	public void setOrderlineCode(int orderlineCode) {
		this.orderlineCode = orderlineCode;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getProductCode() {
		return productCode;
	}
	public void setProductCode(int productCode) {
		this.productCode = productCode;
	}
	public int getOrderlinePrice() {
		return orderlinePrice;
	}
	public void setOrderlinePrice(int orderlinePrice) {
		this.orderlinePrice = orderlinePrice;
	}
	public int getOrderlineQty() {
		return orderlineQty;
	}
	public void setOrderlineQty(int orderlineQty) {
		this.orderlineQty = orderlineQty;
	}
	public int getOrderlineTotalPrice() {
		return orderlineTotalPrice;
	}
	public void setOrderlineTotalPrice(int orderlineTotalPrice) {
		this.orderlineTotalPrice = orderlineTotalPrice;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
}
