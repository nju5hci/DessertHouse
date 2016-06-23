package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.ReserveDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Member;

import dessert.model.Reserve;

public class ReserveDaoImpl extends YeekuHibernateDaoSupport implements ReserveDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addReserve(Reserve reserve) {
		baseDao.save(reserve);
		return true;
	}

	

	@Override
	public List<Reserve> getReserveByDate(String date) {
		List<Reserve> reserveList=new ArrayList<Reserve>();
		String hql="from dessert.model.Reserve where date='"+date+"'";
		Session session=baseDao.getNewSession();
		List<Reserve> reserves=session.createQuery(hql).list();
		if(reserves.size()>0){
			for(int i=0;i<reserves.size();i++){
				reserveList.add(reserves.get(i));
			}
		}else{
			System.out.println("找不到这个预定记录");
		}
		return reserveList;
	}

	@Override
	public List<Reserve> getReserveByMemberId(int mid,int kind) {
		List<Reserve> reserveList=new ArrayList<Reserve>();
		String hql="from dessert.model.Reserve where memberId='"+mid+"'"+" and kind='"+kind+"'";
		Session session=baseDao.getNewSession();
		List<Reserve> reserves=session.createQuery(hql).list();
		if(reserves.size()>0){
			for(int i=0;i<reserves.size();i++){
				reserveList.add(reserves.get(i));
			}
		}else{
			System.out.println("找不到这个预定记录");
		}
		return reserveList;
	}

	@Override
	public List<Reserve> getallReserves() {
		String hql = "from dessert.model.Reserve";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();

	}

	@Override
	public List<Reserve> getReserveByMemberIdAndState(int mid, int state,int kind) {
		List<Reserve> reserveList=new ArrayList<Reserve>();
		String hql="from dessert.model.Reserve where memberId='"+mid+"'"+" and state='"+state+"'"+" and kind='"+kind+"'";
		Session session=baseDao.getNewSession();
		List<Reserve> reserves=session.createQuery(hql).list();
		if(reserves.size()>0){
			for(int i=0;i<reserves.size();i++){
				reserveList.add(reserves.get(i));
			}
		}else{
			System.out.println("找不到这个预定记录");
		}
		return reserveList;
	}

	@Override
	public Reserve getReserveById(int reserveId) {
		Reserve m=(Reserve)baseDao.load(Reserve.class,reserveId);
		return m;
	}

	@Override
	public void updateState(Reserve reserve) {
		baseDao.update(reserve);
		
		
	}

	
}
