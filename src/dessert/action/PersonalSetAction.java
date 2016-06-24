package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class PersonalSetAction extends BaseAction{
	private String profile="profile";
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
	  sc.setAttribute("password", m.getPassword());
	  sc.setAttribute("membername", m.getUsername());
	  sc.setAttribute("memberId", account);
	 
	  sc.setAttribute("phone", m.getPhone());
	  sc.setAttribute("bankid", m.getBankid());
	
	  return "success";
	}
}
