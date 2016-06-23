package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AddAssessAction extends BaseAction{
	private String success = "success";
	@Autowired
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
	
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		
		int pid = Integer.parseInt(request.getParameter("plan_id"));
		memberService.assess(pid);
		sc.setAttribute("pid", pid);
		Reserve reserve=memberService.getReserveById(pid);
		Dessert dessert=dessertService.getDessertById(reserve.getDessertId());
		int dessertid=reserve.getDessertId();
			sc.setAttribute("dessertid", dessertid);
			sc.setAttribute("dessertName", dessert.getDessertName());
			sc.setAttribute("dessertPrice", dessert.getDessertPrice());
			sc.setAttribute("dessertInfo", dessert.getDessertInfo());
			sc.setAttribute("dessertPicAdd", dessert.getDessertPicAdd());
		
	
		return success;
	}
}