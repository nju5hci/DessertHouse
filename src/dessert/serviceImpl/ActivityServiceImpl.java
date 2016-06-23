package dessert.serviceImpl;

import java.util.List;

import dessert.DAO.ActivityDao;
import dessert.DAO.AssessDao;
import dessert.configure.Configure;
import dessert.model.Activity;
import dessert.model.Assess;
import dessert.service.ActivityService;

public class ActivityServiceImpl implements ActivityService{

	private ActivityDao activityDao;
	private AssessDao assessDao;
	
	public void setAssessDao(AssessDao assessDao) {
		this.assessDao = assessDao;
	}

	public void setActivityDao(ActivityDao activityDao) {
		this.activityDao = activityDao;
	}

	@Override
	public Activity getActivityById(int activityId) {
		return activityDao.getActivityById(activityId);
	}

	@Override
	public List<Activity> getActivityBySearch(String searchString) {
		//List<Activity> activities =activityDao.getActivityByDate(searchString);
		List<Activity> activities2=activityDao.getActivityByName(searchString);
	
			return activities2;
	
	}

	@Override
	public boolean addActivity(Activity activity) {
		return activityDao.addActivity(activity);
	}

	@Override
	public boolean updateActivity(Activity activity) {
		return activityDao.updateActivity(activity);
	}

	@Override
	public boolean deleteActivity(Activity activity) {
		return activityDao.deleteActivity(activity);
	}

	@Override
	public List<Activity> getActivitys() {
		return activityDao.getAllActivity();
	}

	@Override
	public List<Activity> getPickActivitys() {
		return activityDao.getActivityByKind(Configure.ACTIVITY_PICK);
	}

	@Override
	public List<Activity> getPlantActivitys() {
		return activityDao.getActivityByKind(Configure.ACTIVITY_PLANT);
	}

	@Override
	public List<Activity> getWatchActivitys() {
		return activityDao.getActivityByKind(Configure.ACTIVITY_WATCH);
	}

	@Override
	public List<Activity> getPersonActivitys() {
		return activityDao.getActivityByKind(Configure.ACTIVITY_PERSON);
	}

	@Override
	public List<Activity> getOnekActivitys() {
		return activityDao.getActivityByNumofPeople(Configure.ACTIVITY_ONE);
	}

	@Override
	public List<Activity> getTeamActivitys() {
		return activityDao.getActivityByNumofPeople(Configure.ACTIVITY_TEAM);
	}

	@Override
	public List<Assess> getAllAssess(int dessertid) {
		return assessDao.getAssessByDessert(dessertid);
	}

}
