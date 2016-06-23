package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;


import dessert.DAO.BaseDao;
import dessert.DAO.OrderDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Activity;
import dessert.model.MemberCard;
import dessert.model.Orders;

public class OrderDaoImpl  extends YeekuHibernateDaoSupport  implements OrderDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addOrders(Orders Orders) {
		baseDao.save(Orders);
		return true;
	}

	@Override
	public boolean updateOrders(Orders Orders) {
		baseDao.update(Orders);
		return true;
	}

	@Override
	public boolean deleteOrders(Orders Orders) {
		baseDao.delete(Orders);
		return true;
	}

	@Override
	public Orders getOrdersById(int OrdersId) {
		Orders Orders=(Orders) baseDao.load(Orders.class, OrdersId);
		return Orders;
	}



	@Override
	public List<Orders> getAllOrders() {
		String hql = "from dessert.model.Orders";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public List<Orders> getOrdersByMemberId(int memberId) {
		List<Orders> dessertList=new ArrayList<Orders>();
		String hql="from dessert.model.Orders where memberId ='"+memberId+"'";
		Session session=baseDao.getNewSession();
		List<Orders> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个订单");
		}
		return dessertList;
	}

	@Override
	public List<Orders> getOrdersByDateAndMemberId(String date, int memberId) {
		List<Orders> dessertList=new ArrayList<Orders>();
		String hql="from dessert.model.Orders where memberId ='"+memberId+"' and OrdersDate='"+date+"'";
		Session session=baseDao.getNewSession();
		List<Orders> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个订单");
		}
		return dessertList;
	}


}
