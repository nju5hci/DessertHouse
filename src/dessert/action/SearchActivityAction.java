package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Activity;
import dessert.model.Dessert;
import dessert.service.ActivityService;
import dessert.service.DessertService;

public class SearchActivityAction extends BaseAction {

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
	
		String word=request.getParameter("search");
		List<Activity> activitys=activityService.getActivityBySearch(word);
	
	
		String[] startDate_activity=new String[activitys.size()]; 
		String[] money_activity = new String[activitys.size()];
		String[] address_activity = new String[activitys.size()];
		String[] name_activity = new String[activitys.size()];
		int [] id_activity=new int[activitys.size()];
		for(int i=0;i<activitys.size();i++){
			startDate_activity[i]=activitys.get(i).getActivitydateStart();
			money_activity[i]=Double.toString(activitys.get(i).getActivityPrice());
			address_activity[i]=activitys.get(i).getActivityPicAdd();
			name_activity[i]=activitys.get(i).getActivityName();
			System.out.println(name_activity[i]+"dasdag");
			id_activity[i]=activitys.get(i).getActivityId();
			System.out.println(address_activity[i]);
		

	}
		sc.setAttribute("startDate_activity", startDate_activity);
		sc.setAttribute("id_activity", id_activity);
		sc.setAttribute("name_activity", name_activity);
		sc.setAttribute("num_activity", activitys.size());
	sc.setAttribute("money_activity", money_activity);
	sc.setAttribute("address_activity", address_activity);
	return success;
		
		
		
	}
}