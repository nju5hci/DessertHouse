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
import dessert.model.Order;

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
	public boolean addOrder(Order order) {
		baseDao.save(order);
		return true;
	}

	@Override
	public boolean updateOrder(Order order) {
		baseDao.update(order);
		return true;
	}

	@Override
	public boolean deleteOrder(Order order) {
		baseDao.delete(order);
		return true;
	}

	@Override
	public Order getOrderById(int orderId) {
		Order order=(Order) baseDao.load(Order.class, orderId);
		return order;
	}



	@Override
	public List<Order> getAllOrder() {
		String hql = "from dessert.model.Order";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	@Override
	public List<Order> getOrderByMemberId(int memberId) {
		List<Order> dessertList=new ArrayList<Order>();
		String hql="from dessert.model.Order where memberId ='"+memberId+"'";
		Session session=baseDao.getNewSession();
		List<Order> desserts=session.createQuery(hql).list();
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
	public List<Order> getOrderByDateAndMemberId(String date, int memberId) {
		List<Order> dessertList=new ArrayList<Order>();
		String hql="from dessert.model.Order where memberId ='"+memberId+"' and orderDate='"+date+"'";
		Session session=baseDao.getNewSession();
		List<Order> desserts=session.createQuery(hql).list();
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
