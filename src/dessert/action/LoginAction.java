package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Member;
import dessert.model.SystemManager;

import dessert.service.MemberService;
import dessert.service.SystemManagerService;



public class LoginAction extends BaseAction{

	/**
	 * 
	 */

	private int id;
	@Autowired
	private MemberService memberService;

	
	private SystemManagerService systemManagerService;
	private String password;
	private String success_member = "member";
	private String success_waiterBig = "waiterBig";
	private String success_waiterSmall = "waiterSmall";
	private String success_manager = "manager";
	private String success_systemmanager = "systemmanager";
	private String input = "input";
	private String ISBOUND = "cardIsBound";
	
	public SystemManagerService getSystemManagerService() {
		return systemManagerService;
	}

	public void setSystemManagerService(SystemManagerService systemManagerService) {
		this.systemManagerService = systemManagerService;
	}

	public MemberService getMemberService() {
		return memberService;
	}
	

	
	
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		if(request.getParameter("account")==""||request.getParameter("password")==""||request.getParameter("account")==null||request.getParameter("password")==null){
			return input;
		}
		try{
			setId(Integer.parseInt(request.getParameter("account")));
			setPassword(request.getParameter("password"));
			Member member = new Member(id, password);
			System.out.println(member.getPassword()+"dddddd");
			
		
			SystemManager systemManager=new SystemManager(id, password);
			
			ServletContext sc = request.getServletContext();
			
			if(memberService.checkLogin(member)){
				sc.setAttribute("accountType", "member");
				sc.setAttribute("account", Integer.toString(member.getMid()));
				String name = memberService.checkInfo(id).getUsername();
				sc.setAttribute("account_name", name);
				System.out.println("mebn");
				return success_member;
			}
			
			else if(systemManagerService.checkLogin(systemManager)){
				sc.setAttribute("accountType", "systemManager");
				sc.setAttribute("account", Integer.toString(systemManager.getSystemManagerId()));
				String name = systemManagerService.getInfo(id).getSystemManagerName();
				sc.setAttribute("account_name", name);
				System.out.println("sysyss");
				return success_systemmanager;
			}else{
				System.out.println("dssssssn");
				return input;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return input;
	}
	
	

}
