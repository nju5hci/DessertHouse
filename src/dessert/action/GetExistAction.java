package dessert.action;

import java.io.PrintWriter;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class GetExistAction extends BaseAction{
	 
		
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
			int account =0;
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter writer=response.getWriter();
			if(request.getParameter("userid")==null||request.getParameter("userid")==""){
				writer.println("输入不可为空");
				return null;
			}
			try{
			account=Integer.parseInt(request.getParameter("userid"));
			}catch(Exception e){
				writer.println("会员卡号格式不正确");
				return null;
			}

			String  tele = (String)request.getParameter("tele");
			if(tele.equals("")){
				writer.println("输入不可为空");
				return null;
			}
			Boolean answer=memberService.hasThisId(account, tele);
			if(answer){
			Member m=memberService.checkInfo(account);
			if(m.getPhone().equals(tele)){
				request.getServletContext().setAttribute("memberid", account);
				request.getServletContext().setAttribute("tele", tele);
				writer.println("success");
			}else{
				writer.println("手机号码错误");
			}
			}else{
				writer.println("会员卡号不存在");
			}
			
			return null;
		

		}
}
