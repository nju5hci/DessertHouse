package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.ComparePriceDao;
import dessert.DAO.DessertDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Address;
import dessert.model.ComparePrice;
import dessert.model.Member;

public class ComparePriceDaoImpl  extends YeekuHibernateDaoSupport implements ComparePriceDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addComparePrice(ComparePrice comparePrice) {
		baseDao.save(comparePrice);
		return true;
	}

	@Override
	public ComparePrice getComparePriceById(int comparePriceId) {
		ComparePrice m=(ComparePrice)baseDao.load(ComparePrice.class,comparePriceId);
		return m;
	}

	@Override
	public List<ComparePrice> getComparePriceByDessertId(int dessertId) {
		List<ComparePrice> dessertList=new ArrayList<ComparePrice>();
		String hql="from dessert.model.ComparePrice where dessertId ='"+dessertId+"'";
		Session session=baseDao.getNewSession();
		List<ComparePrice> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个价格");
		}
		return dessertList;
	}


}
