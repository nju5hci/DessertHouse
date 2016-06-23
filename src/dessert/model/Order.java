package dessert.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order")
public class Order implements Serializable{
	@Id
	private int orderId;//订单号
	private int memberId;//谁下的订单
	private int totalPrice;//总额
	private int  orderState;//状态
	private  String orderDate;//日期

	public Order(){
		
	}



	public Order(int orderId, int memberId, int totalPrice, int orderState, String orderDate) {
	
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}

	
}
