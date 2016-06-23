package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Gift;
import dessert.model.MemberCard;
import dessert.model.Reserve;
import dessert.model.Soil;
import dessert.service.GiftService;
import dessert.service.MemberCardService;
import dessert.service.MemberService;
import dessert.service.SoilService;

public class PreviewGiftAction extends BaseAction {

	private String success = "success";
	private String input = "input";
	private String card_stop = "card_stop";
	private String card_fail = "card_fail";
	@Autowired
	private MemberService memberService;
	private MemberCardService memberCardService;
	private GiftService giftService;
	
	
	public GiftService getGiftService() {
		return giftService;
	}
	public void setGiftService(GiftService giftService) {
		this.giftService = giftService;
	}
	public MemberCardService getMemberCardService() {
		return memberCardService;
	}
	public void setMemberCardService(MemberCardService memberCardService) {
		this.memberCardService = memberCardService;
	}
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		int memberId=Integer.parseInt( (String) sc.getAttribute("account"));
		MemberCard card=memberCardService.getCardById(memberId);
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
		int dessertId=Integer.parseInt(request.getParameter("dessertid"));
		Gift gift=giftService.getGiftById(dessertId);
			   int account = 0;
				do{
					Random r = new Random(); 
					account = r.nextInt(99999999);
				}while((account>10000000)&&(memberService.getReserveById(account)==null));
				SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
				String time1 = df1.format(new Date());// new Date()为获取当前系统时间
				if(gift.getGiftStock()>=1){
					int stock=gift.getGiftStock()-1;
					gift.setGiftStock(stock);
					giftService.updateGift(gift);
					Reserve reserve=new Reserve(account,memberId, dessertId,gift.getGiftPrice(), 1, time1,Configure.RESERVE_BOOK,Configure.RESERVE_GIFT);
					memberService.reserve(reserve);
					return success;
				}else{
					return "noStock";
				}
	
	
		
	}
}
