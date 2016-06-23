package dessert.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import dessert.DAO.OrderDao;
import dessert.DAO.OrderListDao;
import dessert.model.Orders;
import dessert.model.OrderList;
import dessert.model.OrderWithList;
import dessert.model.Orders;
import dessert.service.OrderService;

public class OrderServiceImpl implements OrderService{

	private OrderDao orderDao;
	private OrderListDao orderListDao;
	
	public void setOrderListDao(OrderListDao orderListDao) {
		this.orderListDao = orderListDao;
	}

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public boolean addOrders(Orders order) {
		return orderDao.addOrders(order);
				
	}

	@Override
	public boolean updateOrders(Orders order) {
		return orderDao.updateOrders(order);
	}

	@Override
	public boolean deleteOrders(Orders order) {
		return orderDao.deleteOrders(order);
	}

	@Override
	public Orders getOrdersById(int orderId) {
		return orderDao.getOrdersById(orderId);
	}

	@Override
	public List<OrderWithList> getOrdersByMemberId(int memberId) {
		List<Orders> orders=orderDao.getOrdersByMemberId(memberId);
		List<OrderWithList>  result=new ArrayList<OrderWithList>();
		for(int i=0;i<orders.size();i++){
			OrderWithList orderWithList=new OrderWithList(orders.get(i).getOrderId(),
					orders.get(i).getMemberId(), orders.get(i).getTotalPrice(),
					orders.get(i).getOrderState(), orders.get(i).getOrderDate(),
					getOrdersListByOrdersId(orders.get(i).getOrderId()));
			result.add(orderWithList);
		}
		return result;
	}

	@Override
	public List<OrderWithList> getOrdersByDateAndMemberId(String date, int memberId) {
		List<Orders> orders=orderDao.getOrdersByDateAndMemberId(date, memberId);
		List<OrderWithList>  result=new ArrayList<OrderWithList>();
		for(int i=0;i<orders.size();i++){
			OrderWithList orderWithList=new OrderWithList(orders.get(i).getOrderId(),
					orders.get(i).getMemberId(), orders.get(i).getTotalPrice(),
					orders.get(i).getOrderState(), orders.get(i).getOrderDate(),
					getOrdersListByOrdersId(orders.get(i).getOrderId()));
			result.add(orderWithList);
		}
		return result;
	}

	@Override
	public boolean addOrdersList(OrderList orderList) {
		return orderListDao.addOrderList(orderList);
	}

	@Override
	public boolean updateOrdersList(OrderList orderList) {
	return orderListDao.updateOrderList(orderList);
	}

	@Override
	public boolean deleteOrdersList(OrderList orderList) {
		return orderListDao.deleteOrderList(orderList);
	}

	@Override
	public List<OrderList> getOrdersListByOrdersId(int orderId) {
		return orderListDao.getOrderListByOrderId(orderId);
	}



}
