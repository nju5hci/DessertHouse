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
	
	private int isShowed;//被显示在页面上了就是true,没有显示的是false
	private int monthSale;//月销量
	private int totalSale;//总销量
	private int assessNum;//评价数

	private String dessertInfoPicAdd;//甜品照片所在地址
	private String dessertInfoPicAdd1;//甜品照片所在地址
	private String dessertInfoPicAdd2;//甜品照片所在地址
	private String dessertInfoPicAdd3;//甜品照片所在地址
	public Dessert(int dessertId, String dessertName, double dessertPrice, String dessertInfo, int dessertStock,
			String dessertPicAdd, String dessertPicAdd1, String dessertPicAdd2, int isShowed) {
	
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
	
	
	public int getIsShowed() {
		return isShowed;
	}
	public void setIsShowed(int isShowed) {
		this.isShowed = isShowed;
	}
	public int getMonthSale() {
		return monthSale;
	}
	public void setMonthSale(int monthSale) {
		this.monthSale = monthSale;
	}
	public int getTotalSale() {
		return totalSale;
	}
	public void setTotalSale(int totalSale) {
		this.totalSale = totalSale;
	}
	public int getAssessNum() {
		return assessNum;
	}
	public void setAssessNum(int assessNum) {
		this.assessNum = assessNum;
	}
	public int isShowed() {
		return isShowed;
	}
	public void setShowed(int isShowed) {
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
	public String getDessertInfoPicAdd() {
		return dessertInfoPicAdd;
	}
	public void setDessertInfoPicAdd(String dessertInfoPicAdd) {
		this.dessertInfoPicAdd = dessertInfoPicAdd;
	}
	public String getDessertInfoPicAdd1() {
		return dessertInfoPicAdd1;
	}
	public void setDessertInfoPicAdd1(String dessertInfoPicAdd1) {
		this.dessertInfoPicAdd1 = dessertInfoPicAdd1;
	}
	public String getDessertInfoPicAdd2() {
		return dessertInfoPicAdd2;
	}
	public void setDessertInfoPicAdd2(String dessertInfoPicAdd2) {
		this.dessertInfoPicAdd2 = dessertInfoPicAdd2;
	}
	public String getDessertInfoPicAdd3() {
		return dessertInfoPicAdd3;
	}
	public void setDessertInfoPicAdd3(String dessertInfoPicAdd3) {
		this.dessertInfoPicAdd3 = dessertInfoPicAdd3;
	}
	
}
