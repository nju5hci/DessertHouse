package dessert.model;

import java.util.List;

public class OrderWithList {
	private int orderId;//订单号
	private int memberId;//谁下的订单
	private double totalPrice;//总额
	private int  orderState;//状态
	private  String orderDate;//日期
	private List<OrderList> list;
	public OrderWithList(){
		
	}
	public OrderWithList(int orderId, int memberId, double totalPrice, int orderState, String orderDate,
			List<OrderList> list) {
	
		this.orderId = orderId;
		this.memberId = memberId;
		this.totalPrice = totalPrice;
		this.orderState = orderState;
		this.orderDate = orderDate;
		this.list = list;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public List<OrderList> getList() {
		return list;
	}
	public void setList(List<OrderList> list) {
		this.list = list;
	}
	
	
	
}
