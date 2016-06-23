package dessert.action;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Activity;
import dessert.service.ActivityService;


public class SystemAddActivityAction extends BaseAction {

	private String success = "success";
	private String input = "input";

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
		if(request.getParameter("activityId")==""||request.getParameter("activityName")==""||request.getParameter("activityInfo")==""||
				request.getParameter("activityPrice")==""||request.getParameter("activityStock")==""){    
			return input;
		}else{
			Activity activity=new Activity(Integer.parseInt(request.getParameter("activityId")), request.getParameter("activityName"),
					Double.parseDouble(request.getParameter("activityPrice")), request.getParameter("activityInfo"),
					Integer.parseInt("activityKind"), Integer.parseInt(request.getParameter("activityNum")), Integer.getInteger(request.getParameter("activityStock")),
					request.getParameter("activityStart"), request.getParameter("activityEnd"), request.getParameter("activityPicAdd"));
			activityService.addActivity(activity);
		return success;
		}
	}
	}