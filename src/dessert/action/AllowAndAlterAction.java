package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AllowAndAlterAction  extends BaseAction{
	 
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
			int allow = Integer.parseInt(request.getParameter("allow"));
			
			if(allow==Configure.RESERVE_RECEIVED){
				memberService.receive(pid);
			}else if(allow==Configure.RESERVE_CANCEL){
				memberService.cancel(pid);
				//退货额自后重新加回来哦 ！
				Reserve reserve=memberService.getReserveById(pid);
				Dessert dessert=dessertService.getDessertById(reserve.getDessertId());
				int dessertStock=dessert.getDessertStock();
				dessert.setDessertStock(dessertStock+reserve.getDessertNum());
				dessertService.updateDessert(dessert);
			}else{
				
			}
			return success;
		}
}