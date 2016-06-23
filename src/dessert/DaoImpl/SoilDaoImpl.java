package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.DessertDao;
import dessert.DAO.SoilDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.model.Soil;

public class SoilDaoImpl extends YeekuHibernateDaoSupport implements SoilDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addSoil(Soil soil) {
	  baseDao.save(soil);
	  return true;
	}

	@Override
	public boolean updateSoil(Soil soil) {
		baseDao.update(soil);
		return true;
	}

	@Override
	public boolean deleteSoil(Soil soil) {
	baseDao.delete(soil);
	return true;
	}

	@Override
	public Soil getSoilById(int soilId) {
		Soil m=(Soil)baseDao.load(Soil.class,soilId);
		return m;
	}



	@Override
	public List<Soil> getAllSoil() {
		String hql = "from dessert.model.Soil";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public List<Soil> getSoilByPlace(String soilPlace) {
		List<Soil> dessertList=new ArrayList<Soil>();
		String hql="from dessert.model.Soil where soilPlace like '%"+soilPlace+"%'";
		Session session=baseDao.getNewSession();
		List<Soil> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个土地");
		}
		return dessertList;
	}

	@Override
	public List<Soil> getUnlendedSoil() {
		List<Soil> dessertList=new ArrayList<Soil>();
		String hql="from dessert.model.Soil where state=0";
		Session session=baseDao.getNewSession();
		List<Soil> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个土地");
		}
		return dessertList;
	}
}
