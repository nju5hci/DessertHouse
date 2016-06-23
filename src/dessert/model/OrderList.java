package dessert.model;

import java.io.Serializable;

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
	//菜的单价，总额，图片
	public OrderList(){
		
	}
	public OrderList(int orderId, int dessertId, int dessertNum, String dessertName) {

		this.orderId = orderId;
		this.dessertId = dessertId;
		this.dessertNum = dessertNum;
		this.dessertName = dessertName;
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
