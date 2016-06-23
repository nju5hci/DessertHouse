package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Activity;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.ActivityService;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AddAssessActivityAction extends BaseAction{
	private String success = "success";
	@Autowired
	private MemberService memberService;
	private ActivityService activityService;
	
	public ActivityService getActivityService() {
		return activityService;
	}
	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
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
		
		int pid = Integer.parseInt(request.getParameter("plan_id"));
		memberService.assess(pid);
		sc.setAttribute("pid", pid);
		Reserve reserve=memberService.getReserveById(pid);
		Activity activity=activityService.getActivityById(reserve.getDessertId());
		int activityId=reserve.getDessertId();
		sc.setAttribute("activityId", activityId);
		sc.setAttribute("activityName", activity.getActivityName());
			sc.setAttribute("activityPrice", activity.getActivityPrice());
			sc.setAttribute("activitystart", activity.getActivitydateStart());
			sc.setAttribute("activityend", activity.getActivitydateEnd());
			sc.setAttribute("activityinfo", activity.getActivityInfo());
			sc.setAttribute("activityPicAdd", activity.getActivityPicAdd());
			sc.setAttribute("activitykind", changeKindToString(activity.getKind()));
			sc.setAttribute("activitymax", activity.getMaxOfTicket());
			sc.setAttribute("activitynum", changeNumToString(activity.getNumOfPeople()));
		
	
		return success;
	}
	public String changeKindToString(int kind){
		if(kind==Configure.ACTIVITY_PICK){
			return "采摘园";
		}else if(kind==Configure.ACTIVITY_PLANT){
			return "种植园";
		}else if(kind==Configure.ACTIVITY_WATCH){
			return "观赏园";
		}else if(kind==Configure.ACTIVITY_PERSON){
			return "个人经营园";
		}else {
			return "";
		}
	}
	public String changeNumToString(int num){
		if(num==Configure.ACTIVITY_ONE){
			return "个人项目";
		}else if(num==Configure.ACTIVITY_TEAM){
			return "多人项目";
		}else {
			return "";
		}
	}
}