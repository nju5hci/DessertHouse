package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Assess;
import dessert.model.MemberCard;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class AddThisAssessActivityAction   extends BaseAction {

	private String success = "success";
	private String input = "input";

	@Autowired
	private MemberService memberService;
	private MemberCardService memberCardService;
	public MemberCardService getMemberCardService() {
		return memberCardService;
	}
	public void setMemberCardService(MemberCardService memberCardService) {
		this.memberCardService = memberCardService;
	}
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		int memberId=Integer.parseInt( (String) sc.getAttribute("account"));
		MemberCard card=memberCardService.getCardById(memberId);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
	
	
		int activityId=(int) sc.getAttribute("activityId");

		if(request.getParameter("num")==""){
			return input;
		}else{
			   int account = 0;
				do{
					Random r = new Random(); 
					account = r.nextInt(99999999);
				}while(account>10000000);
				Assess assess=new Assess(account, memberId, activityId, time, request.getParameter("num"));
				memberService.addAssess(assess);
		return success;
		}
	}
}
