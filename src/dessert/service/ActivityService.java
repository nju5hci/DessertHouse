package dessert.service;

import java.util.List;

import dessert.model.Activity;
import dessert.model.Assess;

public interface ActivityService {
	//通过id得到活动
	Activity getActivityById(int activityId);
		//搜索
			List<Activity> getActivityBySearch(String searchString);
			
		
		//新增活动
		boolean addActivity(Activity activity);
		
		//更新活动
		boolean updateActivity(Activity activity);
		
		boolean deleteActivity(Activity activity);
		
		//得到所有活动信息
		List<Activity> getActivitys();
		//得到采摘园活动信息
		List<Activity> getPickActivitys();
		//得到种植园活动信息
		List<Activity> getPlantActivitys();
		//得到观赏园活动信息
		List<Activity> getWatchActivitys();
		//得到个人经营园活动信息
		List<Activity> getPersonActivitys();
		//得到个人票
				List<Activity> getOnekActivitys();
				//得到团体票
				
				List<Activity> getTeamActivitys();
				
				//得到关于某甜品的所有评论
				List<Assess> getAllAssess(int dessertid);
		
}
