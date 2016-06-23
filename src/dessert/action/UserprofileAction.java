package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class UserprofileAction extends BaseAction{
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
		System.out.println("ffffffffffffff");
		ServletContext sc = request.getServletContext();
		int account = Integer.parseInt((String)sc.getAttribute("account"));
		System.out.println(account);
		Member m=memberService.checkInfo(account);
	  sc.setAttribute("password", m.getPassword());
	  System.out.println(m.getPassword());
	  sc.setAttribute("email", m.getEmail());
	  sc.setAttribute("birthday", m.getBirthday());
	  sc.setAttribute("phone", m.getPhone());
	  sc.setAttribute("bankid", m.getBankid());
	  String[] userprofile = new String[6];
	  userprofile[0]=m.getUsername();
	  userprofile[1]=m.getPassword();
	  userprofile[2]=m.getEmail();
	  userprofile[3]=m.getBirthday();
	  userprofile[4]=m.getPhone();
	  userprofile[5]=m.getBankid();
	  sc.setAttribute("userprofile", userprofile);
	  return profile;
	}
}
