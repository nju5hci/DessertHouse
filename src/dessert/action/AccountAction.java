package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.Member;
import dessert.model.MemberCard;
import dessert.model.Recharge;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class AccountAction extends BaseAction{
	private String success = "success";
	private MemberCard memberCard;
	
	
	public MemberCard getMemberCard() {
		return memberCard;
	}
	public void setMemberCard(MemberCard memberCard) {
		this.memberCard = memberCard;
	}
	@Autowired
	private MemberCardService memberCardService;
	private MemberService memberService;
	private DessertService dessertService;
	
	public DessertService getDessertService() {
		return dessertService;
	}
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
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
		int account = Integer.parseInt((String)sc.getAttribute("account"));
		setMemberCard(memberCardService.getCardById(account));
		sc.setAttribute("openDate", memberCard.getOpenDate());
		sc.setAttribute("credit", Integer.toString(memberCard.getPoint()));
		sc.setAttribute("money", Double.toString(memberCard.getMoney()));
		switch (memberCard.getLevel()) {
		case 1:
			sc.setAttribute("level", "铜卡");
			break;
		case 2:
			sc.setAttribute("level", "银卡");
			break;
		case 3:
			sc.setAttribute("level", "金卡");
			break;

		default:
			sc.setAttribute("level", "未知卡");
			break;
		}
		switch (memberCard.getStatus()) {
		case Configure.CARD_ING:
			sc.setAttribute("status", "卡正常使用中");
			break;
		case Configure.CARD_FAIL:
			sc.setAttribute("status", "卡已终止使用");
			break;
		case Configure.CARD_STOP:
			sc.setAttribute("status", "卡暂停使用");
			break;
		
		default:
			sc.setAttribute("status", "卡未知情况");
			
			break;
		}
		List<Reserve> sales=memberService.getReceivedReservesByMid(account);
		List<Recharge> recharges=memberService.getRechargeById(account);
		
			String[] money_sale = new String[sales.size()];
			int[]dessert_num=new int[sales.size()];
			int[]dessert_id=new int[sales.size()];
			
			String[] time_sale = new String[sales.size()];	
			for(int i=0;i<sales.size();i++){
			     Dessert dessert=dessertService.getDessertById(sales.get(i).getDessertId());
				money_sale[i]=Double.toString(dessert.getDessertPrice()*sales.get(i).getDessertNum());
				time_sale[i]=sales.get(i).getDate();
				dessert_num[i]=sales.get(i).getDessertNum();
				dessert_id[i]=sales.get(i).getDessertId();
				
			
			}
			String[] money_recharge = new String[recharges.size()];
			String[] time_recharge = new String[recharges.size()];
			for(int i=0;i<recharges.size();i++){
				money_recharge[i]=Integer.toString(recharges.get(i).getMoney());
				time_recharge[i]=recharges.get(i).getRechargeDate();
				System.out.println(money_recharge[i]);
				System.out.println(time_recharge[i]);
			
			}
			sc.setAttribute("dessert_num", dessert_num);
			sc.setAttribute("dessert_id", dessert_id);
		sc.setAttribute("money_cost", money_sale);
		sc.setAttribute("time_cost", time_sale);
		sc.setAttribute("num_cost", time_sale.length);
		sc.setAttribute("money_recharge", money_recharge);
		sc.setAttribute("time_recharge", time_recharge);
		sc.setAttribute("num_recharge", time_recharge.length);
	
		
		return success;
	
	}
}
