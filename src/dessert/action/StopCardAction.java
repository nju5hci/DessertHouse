package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.service.MemberCardService;

public class StopCardAction extends BaseAction {
	private String success = "success";
	@Autowired
	private MemberCardService memberCardService;
	public MemberCardService getMemberCardService() {
		return memberCardService;
	}
	public void setMemberCardService(MemberCardService memberCardService) {
		this.memberCardService = memberCardService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		int  mid = Integer.parseInt((String)sc.getAttribute("account"));
		memberCardService.cancelMyself(mid);
		return success;
	}
}
