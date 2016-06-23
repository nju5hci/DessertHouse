package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class UserUpdateprofileAction extends BaseAction{
	//已经更改
	private String changed="changed";

	
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
		Member m=memberService.checkInfo(account);
		m.setUsername(request.getParameter("username"));
		m.setPassword(request.getParameter("password"));
		m.setEmail(request.getParameter("email"));
		m.setBankid(request.getParameter("bankid"));
		m.setBirthday(request.getParameter("birthday"));
		m.setPhone(request.getParameter("phone"));
		
		memberService.updateInfo(m);
		return changed;
	}
	

}
