package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orders")
public class Orders implements Serializable{
	@Id
	private int orderId;//订单号
	private int memberId;//谁下的订单
	private double totalPrice;//总额
	private int  orderState;//状态
	private  String orderDate;//日期

	public Orders(){
		
	}

	public Orders(int orderId, int memberId, double totalPrice, int orderState, String orderDate) {
	
		this.orderId = orderId;
		this.memberId = memberId;
		this.totalPrice = totalPrice;
		this.orderState = orderState;
		this.orderDate = orderDate;
	}






	public String getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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

	
}
