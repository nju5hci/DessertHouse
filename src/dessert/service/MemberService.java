package dessert.service;

import java.util.ArrayList;
import java.util.List;

import dessert.model.Assess;
import dessert.model.Member;
import dessert.model.Recharge;
import dessert.model.Reserve;



public interface MemberService {
    //注册
	Member registerMember(Member member);
	
	//登录
	boolean checkLogin(Member member);
	
	//通过id得到所有的缴费记录
	List<Recharge> getRechargeById(int mid);

	
	//修改注册信息
	void updateInfo(Member member);
	
	//查询注册信息
	Member checkInfo(int mid);
	
	//绑定银行卡,可能之前没有银行卡或者之后又想新添卡
	boolean setBank(String bankid,int mid,String password);
	
	//看一个用户是否绑定银行卡
	boolean hasBank(int mid);
	
	//预定一个甜品
	boolean reserve(Reserve reserve);
	
	//得到自己所有的预定单子
	List<Reserve>getReservesByMid(int mid);
	
	//得到自己所有的预定单子
		List<Reserve>getBookReservesByMid(int mid);
		//得到自己所有的下单单子
		List<Reserve>getPayReservesByMid(int mid);
		//得到自己所有的确认收货单子
		List<Reserve>getReceivedReservesByMid(int mid);
		//得到自己所有的评价完成单子
		List<Reserve>getAssessReservesByMid(int mid);
		
		//得到自己所有的预定活动单子
				List<Reserve>getBookReservesActivityByMid(int mid);
				//得到自己所有的下单活动单子
				List<Reserve>getPayReservesActivityByMid(int mid);
				//得到自己所有的确认收货活动单子
				List<Reserve>getReceivedReservesActivityByMid(int mid);
				//得到自己所有的评价完成活动单子
				List<Reserve>getAssessReservesActivityByMid(int mid);
				
				//得到自己所有的预定土地单子
				List<Reserve>getBookReservesSoilByMid(int mid);
				//得到自己所有的下单土地单子
				List<Reserve>getPayReservesSoilByMid(int mid);
				//得到自己所有的确认收货土地单子
				List<Reserve>getReceivedReservesSoilByMid(int mid);
				//得到自己所有的评价完成土地单子
				List<Reserve>getAssessReservesSoilByMid(int mid);
		
				//得到自己所有的预定土地单子
				List<Reserve>getBookReservesGiftByMid(int mid);
			
				//得到自己所有的确认收货土地单子
				List<Reserve>getReceivedReservesGiftByMid(int mid);
				
		//买下单子
		void buy(int reserveid);
		//确认收货
		void receive(int reserveid);
		//评价咯
		void assess(int reserveid);
		//退货
		void cancel(int reserveid);
		//删除
				void delete(int reserveid);
		
		Reserve getReserveById(int rid);
		void addAssess(Assess assess);
		
		//判断有咩有reserveID被用
		Reserve getReservesByid(int reserveid);
}
