package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 甜品
 * @author tset
 *
 */
@Entity
@Table(name="dessert")
public class Dessert  implements Serializable{
	@Id
	private int dessertId;//甜品id
	private String dessertName;//甜品的名称
	private double dessertPrice;//甜品的价格
	private String dessertInfo;//甜品的简介
	private int dessertStock;//甜品库存
	
	private String dessertPicAdd;//甜品照片所在地址
	private String dessertPicAdd1;//甜品照片所在地址
	private String dessertPicAdd2;//甜品照片所在地址
	
	private boolean isShowed;//被显示在页面上了就是true,没有显示的是false
	

	
	public Dessert(int dessertId, String dessertName, double dessertPrice, String dessertInfo, int dessertStock,
			String dessertPicAdd, String dessertPicAdd1, String dessertPicAdd2, boolean isShowed) {
	
		this.dessertId = dessertId;
		this.dessertName = dessertName;
		this.dessertPrice = dessertPrice;
		this.dessertInfo = dessertInfo;
		this.dessertStock = dessertStock;
		this.dessertPicAdd = dessertPicAdd;
		this.dessertPicAdd1 = dessertPicAdd1;
		this.dessertPicAdd2 = dessertPicAdd2;
		this.isShowed = isShowed;
	}
	public Dessert(){
		
	}
	
	
	public boolean isShowed() {
		return isShowed;
	}
	public void setShowed(boolean isShowed) {
		this.isShowed = isShowed;
	}
	public Dessert(int dessertId){
		this.dessertId=dessertId;
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
	public String getDessertInfo() {
		return dessertInfo;
	}
	public void setDessertInfo(String dessertInfo) {
		this.dessertInfo = dessertInfo;
	}

	public int getDessertStock() {
		return dessertStock;
	}
	public void setDessertStock(int dessertStock) {
		this.dessertStock = dessertStock;
	}
	public String getDessertPicAdd() {
		return dessertPicAdd;
	}
	public void setDessertPicAdd(String dessertPicAdd) {
		this.dessertPicAdd = dessertPicAdd;
	}
	public String getDessertPicAdd1() {
		return dessertPicAdd1;
	}
	public void setDessertPicAdd1(String dessertPicAdd1) {
		this.dessertPicAdd1 = dessertPicAdd1;
	}
	public String getDessertPicAdd2() {
		return dessertPicAdd2;
	}
	public void setDessertPicAdd2(String dessertPicAdd2) {
		this.dessertPicAdd2 = dessertPicAdd2;
	}
	
}
