package dessert.model;

import java.io.Serializable;
import java.util.function.Predicate;

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
	private String sendAddress;//送货地址
	private String sendTime;//送货施加
	private String sendWay;//配送方式
	private String payWay;//付款方式
	

	public Orders(){
		
	}

	
	public Orders(int orderId, int memberId, double totalPrice, int orderState, String orderDate, String sendAddress,
			String sendTime, String sendWay, String payWay) {
	
		this.orderId = orderId;
		this.memberId = memberId;
		this.totalPrice = totalPrice;
		this.orderState = orderState;
		this.orderDate = orderDate;
		this.sendAddress = sendAddress;
		this.sendTime = sendTime;
		this.sendWay = sendWay;
		this.payWay = payWay;
	}


	public String getSendAddress() {
		return sendAddress;
	}


	public void setSendAddress(String sendAddress) {
		this.sendAddress = sendAddress;
	}


	public String getSendTime() {
		return sendTime;
	}


	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}


	public String getSendWay() {
		return sendWay;
	}


	public void setSendWay(String sendWay) {
		this.sendWay = sendWay;
	}


	public String getPayWay() {
		return payWay;
	}


	public void setPayWay(String payWay) {
		this.payWay = payWay;
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
