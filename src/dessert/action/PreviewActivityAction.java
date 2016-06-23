package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Activity;
import dessert.model.Assess;
import dessert.model.Dessert;
import dessert.service.ActivityService;
import dessert.service.DessertService;

public class PreviewActivityAction  extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
	@Autowired
	private ActivityService activityService;
	
	public ActivityService getActivityService() {
		return activityService;
	}

	public void setActivityService(ActivityService activityService) {
		this.activityService = activityService;
	}

	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();

		int activityId=Integer.parseInt(request.getParameter("dessertid"));
		Activity activity=activityService.getActivityById(activityId);
		
		if(activity!=null){
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
			
			List<Assess> assess=activityService.getAllAssess(activityId);
			String[] words_assess= new String[assess.size()];
			int[] memberId_assess = new int[assess.size()];
			String[] time_assess = new String[assess.size()];
		
			for(int i=0;i<assess.size();i++){
				words_assess[i]=assess.get(i).getWord();
				memberId_assess[i]=assess.get(i).getMemberId();
				time_assess[i]=assess.get(i).getDate();
				

		}
			sc.setAttribute("words_assess", words_assess);
			sc.setAttribute("time_assess", time_assess);
			sc.setAttribute("memberId_assess", memberId_assess);
			sc.setAttribute("assessNum", assess.size());
			return success;
		}else{
			return nodessert;
		}
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
