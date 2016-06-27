package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Order;

import org.hibernate.Session;
import org.hibernate.hql.internal.ast.util.SyntheticAndFactory;
import org.springframework.beans.factory.annotation.Autowired;


import dessert.DAO.BaseDao;
import dessert.DAO.OrderDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Activity;
import dessert.model.Member;
import dessert.model.MemberCard;
import dessert.model.Orders;
import javafx.collections.ListChangeListener.Change;

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
		return cccccc(dessertList);
	}
private List<Orders> cccccc(List<Orders>  old){
	Orders demo=new Orders();
	for(int i=0;i<old.size();i++){
		for(int j=i;j<old.size();j++){
			if(old.get(j).getOrderDate().compareTo(old.get(i).getOrderDate())>0){
				demo=old.get(j);
				old.set(j, old.get(i));
				old.set(i, demo);
			}
		}
	}
	return old;
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

	@Override
	public List<Orders> getOrdersByMemberIdAndState(int memberId, int state) {
		List<Orders> dessertList=new ArrayList<Orders>();
		String hql="from dessert.model.Orders where memberId ='"+memberId+"' and orderState='"+state+"'";
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
	public boolean hasThisID(int ordersId) {
		String hql = "from dessert.model.Orders where orderId ='"+ordersId+"'";
		Session session = baseDao.getNewSession();
		List<Orders> ml = session.createQuery(hql).list();
		if(ml.size()==0){
			return false;
		}else {
			return true;
		}
	}


}
