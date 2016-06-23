package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.MemberCard;
import dessert.model.Reserve;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class AddActivityAction extends BaseAction {

	private String success = "success";
	private String input = "input";
	private String card_stop = "card_stop";
	private String card_fail = "card_fail";
	@Autowired
	private MemberService memberService;
	private MemberCardService memberCardService;
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
		int dessertId=(int) sc.getAttribute("activityId");
double dessertPrice=(double) sc.getAttribute("activityPrice");
		if(request.getParameter("num")==""||request.getParameter("reservedate")==""){
			return input;
		}else{
			   int account = 0;
				do{
					Random r = new Random(); 
					account = r.nextInt(99999999);
				}while((account>10000000)&&(memberService.getReserveById(account)==null));
			String date=request.getParameter("reservedate");
			Reserve reserve=new Reserve(account,memberId, dessertId,dessertPrice, Integer.parseInt(request.getParameter("num")), date,Configure.RESERVE_BOOK,Configure.RESERVE_ACTIVITY);
		memberService.reserve(reserve);
		return success;
		}
	}
}
