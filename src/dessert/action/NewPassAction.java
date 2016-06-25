package dessert.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class NewPassAction extends BaseAction{
	 
	
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
			int account = (Integer)sc.getAttribute("memberid");
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer=response.getWriter();
			/**
			try{
			 account = Integer.parseInt((String)sc.getAttribute("memberid"));
			}catch(Exception e){
				writer.println("服务器出错");
				return null;
			}
*/
			String  newp = (String)request.getParameter("newp");
			String  newp1 = (String)request.getParameter("newp1");
			System.out.println(newp);
			Member m=memberService.checkInfo(account);
			if(newp.equals("")||newp1.equals("")){
				//response.getWriter().
				response.getWriter().println("输入不可为空");
			}else if(!newp.equals(newp1)){
				response.getWriter().println("两次输入密码不一致");
			}else{
				m.setPassword(newp);
				memberService.updateInfo(m);
				response.getWriter().println("success");				
			}
			return null;
		

		}
}

