package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.service.MemberCardService;
import dessert.service.MemberService;


public class CardAction extends BaseAction {

	private String name;
	private String password;
	private String card;
	private int money;
	
	@Autowired
	private MemberCardService memberCardService;
	private MemberService memberService;
	
	public MemberService getMemberService() {
		return memberService;
	}

	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public MemberCardService getMemberCardService() {
		return memberCardService;
	}

	public void setMemberCardService(MemberCardService memberCardService) {
		this.memberCardService = memberCardService;
	}
	private String success = "success";
	private String input = "input";
	private String mon = "money";
	private String car = "card";
	
	@Override
	public String execute() throws Exception {
		if(request.getParameter("password")==""||request.getParameter("money")==""){
			return input;
		}
		setMoney(Integer.parseInt(request.getParameter("money")));
		setPassword(request.getParameter("password"));
		ServletContext sc = request.getServletContext();
		int account = Integer.parseInt((String) sc.getAttribute("account"));
        if(request.getParameter("card")==""){
        	if(memberService.hasBank(account)){
        		if(memberCardService.recharge(account, password, money)){
        			return success;
        		}else{
        			return mon;
        		}
        		
        	}else{
        		return car;
        	}
        }
        	else{
        		if(money<Configure.LEVELONE_MONEY){
        			return mon;
        		}else{
        			if(memberService.setBank(request.getParameter("card"), account, password)){
        				System.out.println("dddd");
        				memberCardService.recharge(account, password, money);
        				return success;
        			}else{
        				System.out.println("ttt");
        				return input;
        			}
        		}
        	}
        

	}
}
