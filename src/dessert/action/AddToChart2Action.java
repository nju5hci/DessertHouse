package dessert.action;

import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.OrderList;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AddToChart2Action  extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
	@Autowired
	private DessertService dessertService;
	private MemberService memberService;
	
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public DessertService getDessertService() {
		return dessertService;
	}
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();

		int dessertid=Integer.parseInt(request.getParameter("dessertid"));
	
		Dessert dessert=dessertService.getDessertById(dessertid);
		
		int  mid = Integer.parseInt((String)sc.getAttribute("account"));
		int orderListId = 0;
		do{
			Random r = new Random(); 
			orderListId = r.nextInt(99999999);
		}while(orderListId>10000000);
	   OrderList orderList=new OrderList(orderListId, mid, dessertid, 1, dessert.getDessertName(), dessert.getDessertPrice(), 
			   dessert.getDessertPrice(), dessert.getDessertPicAdd());

	   memberService.addOrderList(orderList);
	   return success;
		
	}
}
