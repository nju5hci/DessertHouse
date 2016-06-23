package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.MemberCard;
import dessert.model.Reserve;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class BuyGiftAction extends BaseAction{

	private String success = "success";
	private String nomoney = "nomoney";
	private String card_fail = "card_fail";
	private String card_stop = "card_stop";
	@Autowired
	
	private MemberService memberService;
	private MemberCardService memberCardService;

	
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
		List<Reserve> reserves=memberService.getBookReservesGiftByMid(mid);
		for(int i=0;i<reserves.size();i++){
			memberService.buy(reserves.get(i).getReserveId());
			//对于土地的，购买了不能退货也不能不付款。。。直接确认收货。
		memberService.receive(reserves.get(i).getReserveId());
			double price=reserves.get(i).getDessertPrice();
			MemberCard memberCard=memberCardService.getCardById(mid);
		
			double salemoney=reserves.get(i).getDessertNum()*price;
		

			
			int point=memberCard.getPoint();
	
			if(point>=salemoney){
				memberCard.setPoint(point-(int)salemoney);
				memberCardService.updateCard(memberCard);
			}else{
		
			
					return nomoney;
			}
		}
		return success;
	}

}
