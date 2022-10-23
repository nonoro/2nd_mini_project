package kosta.dto;



import java.sql.Array;
import java.util.ArrayList;
import java.util.List;


public class OrderDTO {
	private int orderCode;
	private String userId;
	private String orderDate;
	private String orderAddr;
	private int orderComplete;
	private int orderType;
	private int usedPoint;
	private int orderTotalPrice;
	private int orderPay;
	
	private List<OrderLineDTO> orderLineList = new ArrayList<OrderLineDTO>();

	public OrderDTO() { }

	public OrderDTO(int orderCode, String userId, String orderDate, String orderAddr, int orderComplete, int orderType,
			int usedPoint, int orderTotalPrice, int orderPay) {
		super();
		this.orderCode = orderCode;
		this.userId = userId;
		this.orderDate = orderDate;
		this.orderAddr = orderAddr;
		this.orderComplete = orderComplete;
		this.orderType = orderType;
		this.usedPoint = usedPoint;
		this.orderTotalPrice = orderTotalPrice;
		this.orderPay = orderPay;
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

	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}

	public String getOrderAddr() {
		return orderAddr;
	}

	public void setOrderAddr(String orderAddr) {
		this.orderAddr = orderAddr;
	}

	public int getOrderComplete() {
		return orderComplete;
	}

	public void setOrderComplete(int orderComplete) {
		this.orderComplete = orderComplete;
	}

	public int getOrderType() {
		return orderType;
	}

	public void setOrderType(int orderType) {
		this.orderType = orderType;
	}

	public int getUsedPoint() {
		return usedPoint;
	}

	public void setUsedPoint(int usedPoint) {
		this.usedPoint = usedPoint;
	}

	public int getOrderTotalPrice() {
		return orderTotalPrice;
	}

	public void setOrderTotalPrice(int orderTotalPrice) {
		this.orderTotalPrice = orderTotalPrice;
	}

	public int getOrderPay() {
		return orderPay;
	}

	public void setOrderPay(int orderPay) {
		this.orderPay = orderPay;
	}

	public List<OrderLineDTO> getOrderLineList() {
		return orderLineList;
	}

	public void setOrderLineList(List<OrderLineDTO> orderLineList) {
		this.orderLineList = orderLineList;
	}
	
}
