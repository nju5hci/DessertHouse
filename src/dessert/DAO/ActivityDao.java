package dessert.DAO;

import java.util.List;

import dessert.model.Activity;


public interface ActivityDao {
		//新增
		boolean addActivity(Activity activity);
		
		//更新
		boolean updateActivity(Activity activity);
		
		//删除
		boolean deleteActivity(Activity activity);
		
		//通过id得到
		Activity getActivityById(int activityId);
		
		//通过模糊名字得到
		List<Activity> getActivityByName(String activityName);
		
		//通过模糊日期得到
		List<Activity> getActivityByDate(String date);
		//通过类型得到
		List<Activity> getActivityByKind(int kind);
		//通过个人和团体得到
		List<Activity> getActivityByNumofPeople(int num);
		//得到所有活动
		List<Activity> getAllActivity();
}
