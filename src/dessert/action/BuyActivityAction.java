package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.MemberCard;
import dessert.model.Reserve;
import dessert.service.ActivityService;
import dessert.service.DessertService;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class BuyActivityAction extends BaseAction{

	private String success = "success";
	private String nomoney = "nomoney";
	private String card_fail = "card_fail";
	private String card_stop = "card_stop";
	@Autowired
	
	private MemberService memberService;
	private MemberCardService memberCardService;
	private ActivityService activityService;

	public ActivityService getActivityService() {
		return activityService;
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public MemberCardService getMemberCardService() {
		return memberCardService;
	}
	public void setMemberCardService(MemberCardService memberCardService) {
		this.memberCardService = memberCardService;
	}

	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		int  mid = Integer.parseInt((String)sc.getAttribute("account"));
		MemberCard card=memberCardService.getCardById(mid);
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		
		String time = df.format(new Date());// new Date()为获取当前系统时间
		
		String openTime=card.getOpenDate();
		if(Configure.overOneYer(openTime, time)){
			if(card.getMoney()<Configure.LEAST_MONEY){
				card.setStatus(Configure.CARD_STOP);
				//会员记录停止后并且把openDate换为这个停止的时间
				card.setOpenDate(time);
				memberCardService.updateCard(card);
				return  card_stop;
			}
		}
		if(card.getStatus()==Configure.CARD_STOP){
			if(Configure.overOneYer(openTime, time)){
				card.setStatus(Configure.CARD_FAIL);
				memberCardService.updateCard(card);
				return card_fail;
		
			}else{
				return card_stop;
			}
			
		}
		if(card.getStatus()==Configure.CARD_FAIL){
			return card_fail;
		}
		List<Reserve> reserves=memberService.getBookReservesActivityByMid(mid);
		for(int i=0;i<reserves.size();i++){
			memberService.buy(reserves.get(i).getReserveId());
			
			double price=reserves.get(i).getDessertPrice();
			MemberCard memberCard=memberCardService.getCardById(mid);
		
			double salemoney=reserves.get(i).getDessertNum()*price;
		
		int paytype=-1;
		String[] str =request.getParameterValues("pay");
		if(hasinclude(str, "point")){
			paytype=Configure.PAY_POINTCARD;
			
			
			int point=memberCard.getPoint();
			double money=salemoney*Configure.POINT_MONEY;
			if(point>=money){
				memberCard.setPoint(point-(int)money);
				memberCardService.updateCard(memberCard);
			}else{
		
				if(!hasinclude(str, "card")&&!hasinclude(str, "cash")){
					return nomoney;
				}
				memberCard.setPoint(0);
				salemoney=salemoney-point*1.0/Configure.POINT_MONEY;
				memberCardService.updateCard(memberCard);
		}
		}
		if(hasinclude(str, "card")){
			
				
					if(memberCard.getStatus()==Configure.CARD_FAIL){
						return card_fail;
					}
					if(memberCard.getStatus()==Configure.CARD_STOP){
						return card_stop;
					}
					if(memberCard.getMoney()>=salemoney){
						double money=memberCard.getMoney();
						memberCard.setMoney(money-salemoney);
						
						memberCard.setPoint(memberCard.getPoint()+(int)price);
						memberCardService.updateCard(memberCard);
					
					}else{
						
						if(!hasinclude(str, "cash")){
							return nomoney;
						}
						memberCard.setMoney(0.0);
						memberCard.setPoint(memberCard.getPoint()+(int)memberCard.getMoney());
						salemoney=salemoney-memberCard.getMoney();
						memberCardService.updateCard(memberCard);
						
					}
					
		}
		if(hasinclude(str, "cash")){
			paytype=Configure.PAY_CASH;
		}
		}
		return success;
	}
	private boolean hasinclude(String[] strs,String type){
		for(int i=0;i<strs.length;i++){
			if(strs[i].equals(type))
				return true;
		}
		return false;
	}
}
