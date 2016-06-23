package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="gift")
public class Gift implements Serializable{
	@Id
	private int giftId;//礼品id
	private String giftName;//礼品的名称
	private double giftPrice;//礼品兑换所需积分
	private String giftInfo;//礼品的简介
	private int giftStock;//礼品库存
	
	private String giftPicAdd;//礼品照片所在地址

	public Gift(int giftId, String giftName, double giftPrice, String giftInfo, int giftStock, String giftPicAdd) {
		
		this.giftId = giftId;
		this.giftName = giftName;
		this.giftPrice = giftPrice;
		this.giftInfo = giftInfo;
		this.giftStock = giftStock;
		this.giftPicAdd = giftPicAdd;
	}
	public Gift(){
		
	}
	public int getGiftId() {
		return giftId;
	}

	public void setGiftId(int giftId) {
		this.giftId = giftId;
	}

	public String getGiftName() {
		return giftName;
	}

	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}

	public double getGiftPrice() {
		return giftPrice;
	}

	public void setGiftPrice(double giftPrice) {
		this.giftPrice = giftPrice;
	}

	public String getGiftInfo() {
		return giftInfo;
	}

	public void setGiftInfo(String giftInfo) {
		this.giftInfo = giftInfo;
	}

	public int getGiftStock() {
		return giftStock;
	}

	public void setGiftStock(int giftStock) {
		this.giftStock = giftStock;
	}

	public String getGiftPicAdd() {
		return giftPicAdd;
	}

	public void setGiftPicAdd(String giftPicAdd) {
		this.giftPicAdd = giftPicAdd;
	}
	
}
