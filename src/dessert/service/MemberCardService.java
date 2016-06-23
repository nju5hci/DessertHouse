package dessert.service;

import java.util.ArrayList;

import dessert.model.Dessert;
import dessert.model.MemberCard;

public interface MemberCardService {

	//充值，前提是该用户有绑定的银行卡，当然在注册时候一般就必须要求用户填上银行卡了，如果没有的话就false
	//会有状态的改变自动的。
	//设置级别享受不同优惠啊
	//什么等级什么优惠需要事先定好一个表
	boolean recharge(int mid,String password,int money);
	//更新
	MemberCard updateCard(MemberCard memberCard);

	//得到现在的等级，优惠
	int getLevelById(int mid);
	//得到卡
	MemberCard getCardById(int mid);
	
	//得到现在卡的状态
	int getStatusById(int mid);
	
	//会员自己通知系统取消卡
	void cancelMyself(int mid);
	
	//系统自动检查的有没有过期
	boolean checkTime(int mid);
	
	//系统自动检查的有没有钱
	boolean checkMoney(int mid);
	
	//得到现在的积分，积分兑换成卡余额，也需要一个规则
	int getPoint(int mid);
	 
	//把积分兑换成卡的金额
	boolean changePointToMoneyt(int mid,int point);
	
	//预定
	boolean bookDessert(int mid,ArrayList<Dessert>  desserts);

	//购买
	boolean buyDessert(int mid,ArrayList<Dessert>  desserts);
}
