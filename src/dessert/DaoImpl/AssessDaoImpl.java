package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.AssessDao;
import dessert.DAO.BaseDao;
import dessert.DAO.DessertDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Assess;
import dessert.model.Dessert;

public class AssessDaoImpl extends YeekuHibernateDaoSupport implements AssessDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addAssesst(Assess assess) {
		baseDao.save(assess);
		return true;
	}

	@Override
	public Assess getAssessById(int assessId) {
		Assess assess=null;
		String hql="from dessert.model.Assess where assessId='"+assessId+"'";
		Session session=baseDao.getNewSession();
		List<Assess> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			assess=desserts.get(0);
		}else{
			System.out.println("找不到这个评论");
		}
		return assess;
	}

	@Override
	public List<Assess> getAssessByMember(int mid) {
		List<Assess> dessertList=new ArrayList<Assess>();
		String hql="from dessert.model.Assess where memberId='"+mid+"'";
		Session session=baseDao.getNewSession();
		List<Assess> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个评价");
		}
		return dessertList;
	}

	@Override
	public List<Assess> getAssessByDessert(int dessertid) {
		List<Assess> dessertList=new ArrayList<Assess>();
		String hql="from dessert.model.Assess where dessertId='"+dessertid+"'";
		Session session=baseDao.getNewSession();
		List<Assess> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个评价");
		}
		return dessertList;
	}

	@Override
	public List<Assess> getAllAssess() {
		String hql = "from dessert.model.Assess";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

}
