package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="comparePrice")
public class ComparePrice implements Serializable{
	@Id
	private int comparePriceId;//菜的id
	private int dessertId;//菜的id
	
	private String  dessertName;//菜的名字
	private double dessertPrice;//金额
	private String date;//价格的日期
	
	
	public ComparePrice(){
		
	}


	public ComparePrice(int dessertId, String dessertName, double dessertPrice, String date) {
		
		this.dessertId = dessertId;
		this.dessertName = dessertName;
		this.dessertPrice = dessertPrice;
		this.date = date;
	}


	public int getDessertId() {
		return dessertId;
	}


	public void setDessertId(int dessertId) {
		this.dessertId = dessertId;
	}


	public String getDessertName() {
		return dessertName;
	}


	public void setDessertName(String dessertName) {
		this.dessertName = dessertName;
	}


	public double getDessertPrice() {
		return dessertPrice;
	}


	public void setDessertPrice(double dessertPrice) {
		this.dessertPrice = dessertPrice;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	

}
