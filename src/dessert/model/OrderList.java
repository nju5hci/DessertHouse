package dessert.model;

import java.io.Serializable;
import java.util.function.Predicate;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="orderList")
public class OrderList implements Serializable{
	@Id
	private  int  orderListId;//详情号
	private int orderId;//订单号
	private int dessertId;//菜的id
	private int dessertNum;//数量
	private String  dessertName;//菜的名字
	private double dessertPrice;//菜的单价
	private double totalPrice;//菜的总额，即单价乘以数量
	private String dessertPicture;//菜的地址这里显示一张图片就好
	//菜的单价，总额，图片
	public OrderList(){
		
	}

	public OrderList(int orderListId, int orderId, int dessertId, int dessertNum, String dessertName,
			double dessertPrice, double totalPrice, String dessertPicture) {
				this.orderListId = orderListId;
		this.orderId = orderId;
		this.dessertId = dessertId;
		this.dessertNum = dessertNum;
		this.dessertName = dessertName;
		this.dessertPrice = dessertPrice;
		this.totalPrice = totalPrice;
		this.dessertPicture = dessertPicture;
	}

	public int getOrderListId() {
		return orderListId;
	}

	public void setOrderListId(int orderListId) {
		this.orderListId = orderListId;
	}

	public double getDessertPrice() {
		return dessertPrice;
	}

	public void setDessertPrice(double dessertPrice) {
		this.dessertPrice = dessertPrice;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getDessertPicture() {
		return dessertPicture;
	}

	public void setDessertPicture(String dessertPicture) {
		this.dessertPicture = dessertPicture;
	}

	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getDessertId() {
		return dessertId;
	}
	public void setDessertId(int dessertId) {
		this.dessertId = dessertId;
	}
	public int getDessertNum() {
		return dessertNum;
	}
	public void setDessertNum(int dessertNum) {
		this.dessertNum = dessertNum;
	}
	public String getDessertName() {
		return dessertName;
	}
	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}
	

}
