package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="soil")
public class Soil   implements Serializable{
	@Id
	private int soilId;//土地id
	private String soilPlace;//土地所在地
	private double soilPrice;//土地的价格
	private String soilInfo;//土地的简介
	private String soilPicAdd;//土地照片所在地址
	private int state;//未租0，已租1



	public Soil(int soilId, String soilPlace, double soilPrice,
			String soilInfo,  String soilPicAdd, int state) {
	
		this.soilId = soilId;
		this.soilPlace = soilPlace;
		this.soilPrice = soilPrice;
		this.soilInfo = soilInfo;
	
		this.soilPicAdd = soilPicAdd;
		this.state = state;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	public Soil(){
		
	}

	public int getSoilId() {
		return soilId;
	}

	public void setSoilId(int soilId) {
		this.soilId = soilId;
	}


	public String getSoilPlace() {
		return soilPlace;
	}

	public void setSoilPlace(String soilPlace) {
		this.soilPlace = soilPlace;
	}

	public double getSoilPrice() {
		return soilPrice;
	}

	public void setSoilPrice(double soilPrice) {
		this.soilPrice = soilPrice;
	}

	public String getSoilInfo() {
		return soilInfo;
	}

	public void setSoilInfo(String soilInfo) {
		this.soilInfo = soilInfo;
	}

	


	public String getSoilPicAdd() {
		return soilPicAdd;
	}

	public void setSoilPicAdd(String soilPicAdd) {
		this.soilPicAdd = soilPicAdd;
	}
	
	
	
}
