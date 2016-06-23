package dessert.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 会员卡
 * @author tset
 *
 */
@Entity
@Table(name="memberCard")
public class MemberCard  implements Serializable{
	@Id
	private int mid;//这个卡号
	private double money;//卡里剩余的金额
	private String openDate;//开卡日期年月日
	private int level;//级别12345
	/*
	 * 状态0：已废，1：停卡了 2：正常用着
	 */
	private int status;
	private int point;//积分
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}

	public String getOpenDate() {
		return openDate;
	}
	public void setOpenDate(String openDate) {
		this.openDate = openDate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
