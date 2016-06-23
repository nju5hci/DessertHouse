package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="address")
public class Address implements Serializable{
	@Id
	private int addressId;
	private int memberId;//谁的地址
	private String name;//收地址的姓名
	private int mobile;//联系电话
	private String address;//地址的具体

	
	public Address(){
		
	}

	public Address(int addressId, int memberId, String name, int mobile, String address) {

		this.addressId = addressId;
		this.memberId = memberId;
		this.name = name;
		this.mobile = mobile;
		this.address = address;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMobile() {
		return mobile;
	}

	public void setMobile(int mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
}
