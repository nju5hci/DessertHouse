package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.MemberCard;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class CheckAccountAction  extends BaseAction{
	//已经更改
	private String success="success";

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
		sc.setAttribute("accountNo", 0);
		return success;
	}
}