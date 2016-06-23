package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class DeleteThisAction extends BaseAction{
	private String success = "success";
	@Autowired
	private MemberService memberService;
	
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
		memberService.delete(pid);
		int allow = Integer.parseInt(request.getParameter("allow"));
		if(allow==1){
			return "dessert";
		}
		if(allow==2){
			return "soil";
		}
		if(allow==3){
			return "activity";
		}
		if(allow==4){
			return "gift";
		}
		return success;
	}
}