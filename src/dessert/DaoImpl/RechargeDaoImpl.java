package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.RechargeDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Recharge;


public class RechargeDaoImpl extends YeekuHibernateDaoSupport implements RechargeDao {
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public boolean addRecharge(Recharge recharge) {
		baseDao.save(recharge);
		return true;
	}

	@Override
	public Recharge getRechargeById(int rid) {
		return (Recharge)baseDao.load(Recharge.class, rid);
		
	}

	@Override
	public List<Recharge> getRechargeByMemberId(int mid) {
		List<Recharge> rechargeList=new ArrayList<Recharge>();
		String hql="from dessert.model.Recharge where mid='"+mid+"'";
		Session session=baseDao.getNewSession();
		List<Recharge> recharges=session.createQuery(hql).list();
		if(recharges.size()>0){
			for(int i=0;i<recharges.size();i++){
				rechargeList.add(recharges.get(i));
			}
		}else{
			System.out.println("找不到这个充值记录");
		}
		return rechargeList;
	}

	@Override
	public List<Recharge> getRechargeByDate(Date rechargeDate) {
		List<Recharge> rechargeList=new ArrayList<Recharge>();
		String hql="from dessert.model.Recharge where rechargeDate='"+rechargeDate+"'";
		Session session=baseDao.getNewSession();
		List<Recharge> recharges=session.createQuery(hql).list();
		if(recharges.size()>0){
			for(int i=0;i<recharges.size();i++){
				rechargeList.add(recharges.get(i));
			}
		}else{
			System.out.println("找不到这个充值记录");
		}
		return rechargeList;
	}

	@Override
	public List<Recharge> getRechargeByBranch(int branchId) {
		List<Recharge> rechargeList=new ArrayList<Recharge>();
		String hql="from dessert.model.Recharge where branchId='"+branchId+"'";
		Session session=baseDao.getNewSession();
		List<Recharge> recharges=session.createQuery(hql).list();
		if(recharges.size()>0){
			for(int i=0;i<recharges.size();i++){
				rechargeList.add(recharges.get(i));
			}
		}else{
			System.out.println("找不到这个充值记录");
		}
		return rechargeList;
	}

	@Override
	public List<Recharge> getAllRecharge() {
		String hql = "from dessert.model.Recharge";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

}
