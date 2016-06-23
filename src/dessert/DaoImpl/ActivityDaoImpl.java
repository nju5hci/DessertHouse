package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.ActivityDao;
import dessert.DAO.BaseDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Activity;


public class ActivityDaoImpl extends YeekuHibernateDaoSupport  implements ActivityDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addActivity(Activity activity) {
		baseDao.save(activity);
		return true;
	}

	@Override
	public boolean updateActivity(Activity activity) {
		baseDao.save(activity);
		return true;
		
	}

	@Override
	public boolean deleteActivity(Activity activity) {
		baseDao.delete(activity);
		return true;
	}

	@Override
	public Activity getActivityById(int activityId) {
		Activity activity=null;
		String hql="from dessert.model.Activity where activityId='"+activityId+"'";
		Session session=baseDao.getNewSession();
		List<Activity> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			activity=desserts.get(0);
		}else{
			System.out.println("找不到这个计划");
		}
		return activity;
	}

	@Override
	public List<Activity> getActivityByName(String activityName) {
		List<Activity> dessertList=new ArrayList<Activity>();
		String hql="from dessert.model.Activity where activityName like '%"+activityName+"%'";
		Session session=baseDao.getNewSession();
		List<Activity> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
				//System.out.println(desserts.get(i).getActivityName()+"23415462467");
			}
		}else{
			System.out.println("找不到这个计划");
		}
		return dessertList;
	}

	@Override
	public List<Activity> getActivityByDate(String date) {
		List<Activity> dessertList=new ArrayList<Activity>();
		String hql="from dessert.model.Activity where activitydateStart <'"+date+" and activitydateEnd >"+date+"'";
		Session session=baseDao.getNewSession();
		List<Activity> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个计划");
		}
		return dessertList;
	}

	@Override
	public List<Activity> getAllActivity() {
		String hql = "from dessert.model.Activity";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public List<Activity> getActivityByKind(int kind) {
		List<Activity> dessertList=new ArrayList<Activity>();
		String hql="from dessert.model.Activity where kind ='"+kind+"'";
		Session session=baseDao.getNewSession();
		List<Activity> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个计划");
		}
		return dessertList;
	}

	@Override
	public List<Activity> getActivityByNumofPeople(int num) {
		List<Activity> dessertList=new ArrayList<Activity>();
		String hql="from dessert.model.Activity where numOfPeople ='"+num+"'";
		Session session=baseDao.getNewSession();
		List<Activity> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个计划");
		}
		return dessertList;
	}

}
