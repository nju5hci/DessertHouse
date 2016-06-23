package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Activity;
import dessert.model.Dessert;
import dessert.service.ActivityService;
import dessert.service.DessertService;

public class DeleteActivityAction extends BaseAction {

	private String success = "success";

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
		
	
		int dessertid=Integer.parseInt(request.getParameter("dessertid"));
		Activity activity=activityService.getActivityById(dessertid);
		activityService.deleteActivity(activity);
		return success;
		}
	
}
