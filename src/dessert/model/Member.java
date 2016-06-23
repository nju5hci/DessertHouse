package dessert.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 会员
 * @author tset
 *
 */
@Entity
@Table(name="member")
public class Member  implements Serializable{
	@Id
	private int mid;//会员的id号是注册时候系统自动分配的，7位
	private String username;//会员自己取名
	private String password;//会员自己取密码
	private String email;//邮箱
	private String birthday;//生日
	private String phone;//电话
	private String bankid;//银行卡号，用于假装支付
	public Member(){
		
	}
	public Member (int mid,String password){
		this.mid=mid;
		this.password=password;
	}
	
	public Member(String username, String password, String email,
			String birthday, String phone, String bankid) {
		this.username = username;
		this.password = password;
		this.email = email;
		this.birthday = birthday;
		this.phone = phone;
		this.bankid = bankid;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBankid() {
		return bankid;
	}
	public void setBankid(String bankid) {
		this.bankid = bankid;
	}
	
	
}
