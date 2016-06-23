package dessert.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 充值记录
 * @author tset
 *
 */
@Entity
@Table(name="recharge")
public class Recharge  implements Serializable{
	@Id
	private int rid;//充值记录的id
	private int money;//充值的钱
	private int mid;//充值进去的卡号id
	private String rechargeDate;//充值的日期

	
	public Recharge(){
		
	}
	public Recharge(int rid, int money, int mid, String rechargeDate) {
		this.rid = rid;
		this.money = money;
		this.mid = mid;
		this.rechargeDate = rechargeDate;
		
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}


	public String getRechargeDate() {
		return rechargeDate;
	}
	public void setRechargeDate(String rechargeDate) {
		this.rechargeDate = rechargeDate;
	}

	
}
