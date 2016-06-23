package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.service.MemberService;

public class AllowAndAlterActivityAction extends BaseAction{
	 
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
			int allow = Integer.parseInt(request.getParameter("allow"));
			
			if(allow==Configure.RESERVE_RECEIVED){
				memberService.receive(pid);
			}else if(allow==Configure.RESERVE_CANCEL){
				memberService.cancel(pid);
			}else{
				
			}
			return success;
		}
}