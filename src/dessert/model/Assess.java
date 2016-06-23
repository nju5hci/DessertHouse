package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="assess")
public class Assess implements Serializable{
	@Id
	private int assessId;
	private int memberId;//谁评价的
	private int dessertId;//评价的产品id
	private String date;//评价的购买日期
	private String word;//评价的日期
	
	public Assess(){
		
	}
	public Assess(int assessId, int memberId, int dessertId, String date,
			String word) {
	
		this.assessId = assessId;
		this.memberId = memberId;
		this.dessertId = dessertId;
		this.date = date;
		this.word = word;
	}
	public int getAssessId() {
		return assessId;
	}
	public void setAssessId(int assessId) {
		this.assessId = assessId;
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
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	
	
	
}
