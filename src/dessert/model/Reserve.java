package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="reserve")
public class Reserve implements Serializable{
/**
 * 客户的预定计划
 */
	@Id
	private int reserveId;
	private int memberId;//谁订的
	private int dessertId;//订的产品id
	private double dessertPrice;//订的价格
	private int dessertNum;//数量,如果是是土地的话，一亩地就是一份id，所以土地的数量购买一定为1
	private String date;//订的购买日期
	private int state;//预定状态为0，买单后状态为1，收货成功后状态为2，评价完后状态为3
	private int kind;//蔬菜0，活动1，土地为2
	
	public Reserve(){
		
	}

	
	


	




	public Reserve(int reserveId, int memberId, int dessertId,
			double dessertPrice, int dessertNum, String date, int state,
			int kind) {
	
		this.reserveId = reserveId;
		this.memberId = memberId;
		this.dessertId = dessertId;
		this.dessertPrice = dessertPrice;
		this.dessertNum = dessertNum;
		this.date = date;
		this.state = state;
		this.kind = kind;
	}










	public double getDessertPrice() {
		return dessertPrice;
	}










	public void setDessertPrice(double dessertPrice) {
		this.dessertPrice = dessertPrice;
	}










	public int getKind() {
		return kind;
	}





	public void setKind(int kind) {
		this.kind = kind;
	}





	public int getState() {
		return state;
	}


	public void setState(int state) {
		this.state = state;
	}


	public int getReserveId() {
		return reserveId;
	}
	public void setReserveId(int reserveId) {
		this.reserveId = reserveId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	
	
	
}
