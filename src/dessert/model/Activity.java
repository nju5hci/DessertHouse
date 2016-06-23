package dessert.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="activity")
public class Activity  implements Serializable{
	@Id
	private int activityId;//活动id
	private String activityName;//活动的名称
	private double activityPrice;//活动的价格
	private String activityInfo;//活动的简介
	//采摘园0，种植园1，观赏园2，个人经营园3
	private int kind;//活动的类型
	//个人0，多人1
	private int numOfPeople;//活动参与人数
	private int maxOfTicket;//最大出售票数
	private String activitydateStart;//活动的开始日期
	private String activitydateEnd;//活动的结束日期
	private String activityPicAdd;//活动照片所在地址



	public Activity(int activityId, String activityName, double activityPrice,
			String activityInfo, int kind, int numOfPeople, int maxOfTicket,
			String activitydateStart, String activitydateEnd,
			String activityPicAdd) {
	
		this.activityId = activityId;
		this.activityName = activityName;
		this.activityPrice = activityPrice;
		this.activityInfo = activityInfo;
		this.kind = kind;
		this.numOfPeople = numOfPeople;
		this.maxOfTicket = maxOfTicket;
		this.activitydateStart = activitydateStart;
		this.activitydateEnd = activitydateEnd;
		this.activityPicAdd = activityPicAdd;
	}

	public Activity(){
		
	}

	public int getActivityId() {
		return activityId;
	}

	public void setActivityId(int activityId) {
		this.activityId = activityId;
	}

	public String getActivityName() {
		return activityName;
	}

	public void setActivityName(String activityName) {
		this.activityName = activityName;
	}

	public double getActivityPrice() {
		return activityPrice;
	}

	public void setActivityPrice(double activityPrice) {
		this.activityPrice = activityPrice;
	}

	public String getActivityInfo() {
		return activityInfo;
	}

	public void setActivityInfo(String activityInfo) {
		this.activityInfo = activityInfo;
	}


	public String getActivitydateStart() {
		return activitydateStart;
	}

	public void setActivitydateStart(String activitydateStart) {
		this.activitydateStart = activitydateStart;
	}

	public String getActivitydateEnd() {
		return activitydateEnd;
	}

	public void setActivitydateEnd(String activitydateEnd) {
		this.activitydateEnd = activitydateEnd;
	}

	public String getActivityPicAdd() {
		return activityPicAdd;
	}

	public void setActivityPicAdd(String activityPicAdd) {
		this.activityPicAdd = activityPicAdd;
	}

	public int getKind() {
		return kind;
	}

	public void setKind(int kind) {
		this.kind = kind;
	}

	public int getNumOfPeople() {
		return numOfPeople;
	}

	public void setNumOfPeople(int numOfPeople) {
		this.numOfPeople = numOfPeople;
	}

	public int getMaxOfTicket() {
		return maxOfTicket;
	}

	public void setMaxOfTicket(int maxOfTicket) {
		this.maxOfTicket = maxOfTicket;
	}
	
}
