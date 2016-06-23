package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.service.MemberService;

public class RegisterAction extends BaseAction{

	private String name;
	private String tel;
	private String password;
	private String success = "success";
	private String input = "input";
	private String exist = "exist";
	@Autowired
	private MemberService memberService;
	public MemberService getMemberService() {
		return memberService;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	
	@Override
	public String execute() throws Exception {
		if(request.getParameter("name")==""||request.getParameter("password")==""||request.getParameter("confirm")==""||request.getParameter("tel")==""){
			System.out.println("tel:"+request.getParameter("name")+";"+"password:"+request.getParameter("password"));
			
			return input;
		}
		if(request.getParameter("password")!=null&&request.getParameter("password").equals(request.getParameter("confirm"))){
			setName(request.getParameter("name"));
			setPassword(request.getParameter("password"));
			setTel(request.getParameter("tel"));
			System.out.println("tel:"+request.getParameter("name")+";"+"password:"+request.getParameter("password"));
		}else{
			return input;
		}
		
		Member member=new Member(name, password,"","",tel,"");
		System.out.println("tel:"+member.getPhone()+";"+"password:"+member.getPassword());
		Member m=memberService.registerMember(member);
		ServletContext sc = request.getServletContext();
		
		if(m != null){
			sc.setAttribute("accountType", "member");
			sc.setAttribute("account", Integer.toString(member.getMid()));
			sc.setAttribute("account_name", name);
			return success;
		}else{
			return exist;
		}
	}
}
