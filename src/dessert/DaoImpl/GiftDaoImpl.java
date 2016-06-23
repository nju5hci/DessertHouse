package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.GiftDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Dessert;
import dessert.model.Gift;

public class GiftDaoImpl extends YeekuHibernateDaoSupport  implements GiftDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addGift(Gift gift) {
		baseDao.save(gift);
		return true;
	}

	@Override
	public boolean updateGift(Gift gift) {
		baseDao.update(gift);
		return true;
	}

	@Override
	public boolean deleteGift(Gift gift) {
	baseDao.delete(gift);
	return true;
	}

	@Override
	public Gift getGiftById(int giftId) {
		Gift gift=null;
		String hql="from dessert.model.Gift where giftId='"+giftId+"'";
		Session session=baseDao.getNewSession();
		List<Gift> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			gift=desserts.get(0);
		}else{
			System.out.println("找不到这个礼品");
		}
		return gift;
	}

	@Override
	public List<Gift> getGiftBySearchName(String giftName) {
		List<Gift> dessertList=new ArrayList<Gift>();
		String hql="from dessert.model.Gift where giftName like '%"+giftName+"%'";
		Session session=baseDao.getNewSession();
		List<Gift> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个礼品");
		}
		return dessertList;
	}

	@Override
	public List<Gift> getAllGift() {
		String hql = "from dessert.model.Gift";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

}
