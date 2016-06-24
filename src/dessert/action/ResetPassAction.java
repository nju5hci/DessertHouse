package dessert.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Member;
import dessert.model.OrderList;
import dessert.model.OrderWithList;
import dessert.service.MemberService;
import dessert.service.OrderService;

public class ResetPassAction  extends BaseAction{
	 
		private String success = "success";
		private String input = "input";
		private String wrong = "wrong";
		private String diff = "diff";
		
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
			int account = Integer.parseInt((String)sc.getAttribute("account"));

			String  oldp = (String)request.getParameter("oldp");
			String  newp = (String)request.getParameter("newp");
			String  newp1 = (String)request.getParameter("newp1");
			Member m=memberService.checkInfo(account);
			if(oldp.equals("")||newp.equals("")||newp1.equals("")){
				//response.getWriter().
				return input;
			}else if(!newp.equals(newp1)){
				return diff;
			}else if(!oldp.equals(m.getPassword())){
				return wrong;
			}else{
				m.setPassword(newp);
				memberService.updateInfo(m);
				return success;
			}
		

		}
}
