package dessert.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class QuestVerityAction extends BaseAction{
	 
		
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
			System.out.println(sc.getAttribute("memberid")+"----");
		/*
			try{
				
			 account = Integer.parseInt((String)sc.getAttribute("memberid"));
			}catch(Exception e){
				writer.println("服务器出错");
				return null;
			}
*/
			String  answer = (String)request.getParameter("answer");
			Member m=memberService.checkInfo(account);
			System.out.println(m.getAnswer()+"=====");
			if(answer.equals("")){
				//response.getWriter().
				response.getWriter().println("输入不可为空");
			}else if(answer.equals(m.getAnswer())){
				response.getWriter().println("success");
			}else{
				response.getWriter().println("问题回答错误");	
			}
			System.out.println(m.getAnswer()+"=====");					
			return null;
		

		}
}
