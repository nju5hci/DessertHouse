package dessert.configure;

import java.util.Calendar;
import java.util.Date;

public class Configure {
	/*
	 * ****************************************
	 * common value
	 * ****************************************
	 * */
	//信用卡的三个状态
	/*
	 * 状态0：已废，1：停卡了 2：正常用着
	 */
	public static final int CARD_FAIL		=	0;
	public static final int CARD_STOP		=	1;
	public static final int CARD_ING	=	2;
	
	//预定状态为0，预订时删为5，买单后状态为1，收货成功后状态为2，评价完后状态为3，退货后为4
	public static final int RESERVE_BOOK		=	0;
	public static final int RESERVE_PAY		=	1;
	public static final int RESERVE_RECEIVED	=	2;
	public static final int RESERVE_ASSESSED	=	3;
	public static final int RESERVE_CANCEL	=	4;
	public static final int RESERVE_DELETE	=	5;
	//采摘园0，种植园1，观赏园2，个人经营园3
	public static final int ACTIVITY_PICK		=	0;
	public static final int ACTIVITY_PLANT	=	1;
	public static final int ACTIVITY_WATCH	=	2;
	public static final int ACTIVITY_PERSON	=	3;
		//个人0，多人1
	public static final int ACTIVITY_ONE		=	0;
	public static final int ACTIVITY_TEAM	=	1;
	//果蔬为0，活动为1，土地为2,礼品为3
	public static final int RESERVE_VEGETABLE		=	0;
	public static final int RESERVE_ACTIVITY=	1;
	public static final int RESERVE_SOIL	=	2;
	public static final int RESERVE_GIFT	=	3;
	//土地的状态
	public static final int SOIL_LENDED		=	1;
	public static final int SOIL_UNLENDED=	0;
	//计划的四个状态
	/**
	 * 0：待审核
	 * 1：已通过
	 * 2：未通过(待修改
	 * 3：已执行
	 */
	public static final int PLAN_UNCHECK		=	0;
	public static final int PLAN_PASS		=	1;
	public static final int PLAN_FAIL		=	2;
	public static final int PLAN_FINISH		=	3;
	//默认的所属店铺
	public static final int NO_BRANCHID		=	-1;
	//默认的卡的级别
	public static final int NO_LEVEL		=	0;
	//重新激活卡最低标准
	public static final int LEAST_MONEY		=	30;
	//首次激活必须充值200以上
	public static final int OPEN_MONEY		=	200;
	//100积分换一块钱
	public static final int POINT_MONEY		=	100;
	//消费一块获得一个积分
	public static final int MONEY_POINT	=	1;

	//各个级别的金额
	//1
	public static final int LEVELONE_MONEY		=	200;
	public static final double ONE_DISCOUNT		=	1.0;
	//2
	public static final int LEVELTWO_MONEY		=	500;
	public static final double TWO_DISCOUNT	=	0.88;
	//3
	public static final int LEVELTHREE_MONEY		=	1000;
	public static final double THREE_DISCOUNT		=	0.8;
	
	
	//消费时候先有一个默认的编号然后等大家都买好了重新更新数据
	public static final int DEFAULT_MEMBER		=	999999;
	public static final int DEFAULT_PAYTYPE		=	0;
	public static final int PAY_CASH		=	1;
	public static final int PAY_CARD		=	0;
	public static final int PAY_POINTCARD		=	2;
	   public  static boolean overOneYer (String date1, String date2) {
	        
		   String d1=date1.split(" ")[0];
		   String d2=date2.split(" ")[0];
		   System.out.println(d1+d2);
		   int year1=Integer.parseInt(d1.split("-")[0]);
		   int year2=Integer.parseInt(d2.split("-")[0]);
		   int month1=Integer.parseInt(d1.split("-")[1]);
		   int month2=Integer.parseInt(d2.split("-")[1]);
		   int day1=Integer.parseInt(d1.split("-")[2]);
		   int day2=Integer.parseInt(d2.split("-")[2]);
		   
		   if(year2-year1==1){
			   if(month2>month1){
				   return true;
			   }else{
				   if(day2>=day1){
					   return true;
				   }else{
					   return false;
				   }
			   }
		   }else if(year2-year1>1){
			   return true;
			   
		   }else{
			   return false;
		   }
	    }
}
