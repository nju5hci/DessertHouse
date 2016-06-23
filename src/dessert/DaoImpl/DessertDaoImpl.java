package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.DessertDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Dessert;


public class DessertDaoImpl  extends YeekuHibernateDaoSupport implements DessertDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addDessert(Dessert dessert) {
		baseDao.save(dessert);
		return true;
	}

	@Override
	public boolean updateDessert(Dessert dessert) {
		baseDao.update(dessert);
		return true;
	}

	@Override
	public Dessert getDessertById(int dessertId) {
		Dessert dessert=null;
		String hql="from dessert.model.Dessert where dessertId='"+dessertId+"'";
		Session session=baseDao.getNewSession();
		List<Dessert> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			dessert=desserts.get(0);
		}else{
			System.out.println("找不到这个甜品");
		}
		return dessert;
	}

	@Override
	public List<Dessert> getDessertByName(String dessertName) {
		List<Dessert> dessertList=new ArrayList<Dessert>();
		String hql="from dessert.model.Dessert where dessertName='"+dessertName+"'";
		Session session=baseDao.getNewSession();
		List<Dessert> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个甜品");
		}
		return dessertList;
	}

	
	@Override
	public List<Dessert> getAllDessert() {
		String hql = "from dessert.model.Dessert";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public boolean deleteDessert(Dessert dessert) {
	baseDao.delete(dessert);
	return true;
	}

	@Override
	public List<Dessert> getDessertBySearchName(String dessertName) {
		List<Dessert> dessertList=new ArrayList<Dessert>();
		String hql="from dessert.model.Dessert where dessertName like '%"+dessertName+"%'";
		Session session=baseDao.getNewSession();
		List<Dessert> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个甜品");
		}
		return dessertList;
	}

}
