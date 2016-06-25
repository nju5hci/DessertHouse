package dessert.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class UpdateInfoAction extends BaseAction{
	 
	
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
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer=response.getWriter();
		

			String  tele = (String)request.getParameter("tele");
			String  bankaccount=(String)request.getParameter("bank");
			Member m=memberService.checkInfo(account);
			if(tele.equals("")||bankaccount.equals("")){
				response.getWriter().println("输入不可为空");
			}else{
				m.setBankid(bankaccount);
				m.setPhone(tele);
				memberService.updateInfo(m);
				response.getWriter().println("success");
			}
			
								
			return null;
		

		}
}

