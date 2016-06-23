package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.OrderListDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.OrderList;

public class OrderListDaoImpl extends YeekuHibernateDaoSupport  implements OrderListDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addOrderList(OrderList orderList) {
		baseDao.save(orderList);
		return true;
	}

	@Override
	public boolean updateOrderList(OrderList orderList) {
		baseDao.update(orderList);
		return true;
	}

	@Override
	public boolean deleteOrderList(OrderList orderList) {
		baseDao.delete(orderList);
		return true;
	}

	@Override
	public OrderList getOrderListById(int orderListId) {
		OrderList order=(OrderList) baseDao.load(OrderList.class, orderListId);
		return order;
	}

	@Override
	public List<OrderList> getOrderListByOrderId(int orderId) {
		List<OrderList> dessertList=new ArrayList<OrderList>();
		String hql="from dessert.model.OrderList where orderId ='"+orderId+"'";
		Session session=baseDao.getNewSession();
		List<OrderList> desserts=session.createQuery(hql).list();
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
	public List<OrderList> getOrderListByOrderDessertId(int dessertId) {
		List<OrderList> dessertList=new ArrayList<OrderList>();
		String hql="from dessert.model.OrderList where dessertId ='"+dessertId+"'";
		Session session=baseDao.getNewSession();
		List<OrderList> desserts=session.createQuery(hql).list();
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
