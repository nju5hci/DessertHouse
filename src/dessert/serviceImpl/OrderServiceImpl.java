package dessert.serviceImpl;

import java.util.List;

import dessert.DAO.OrderDao;
import dessert.model.Order;
import dessert.service.OrderService;

public class OrderServiceImpl implements OrderService{

	private OrderDao orderDao;
	
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public boolean addOrder(Order order) {
		return orderDao.addOrder(order);
	}

	@Override
	public boolean updateOrder(Order order) {
		return orderDao.updateOrder(order);
	}

	@Override
	public boolean deleteOrder(Order order) {
		return orderDao.deleteOrder(order);
	}

	@Override
	public Order getOrderById(int orderId) {
		return orderDao.getOrderById(orderId);
	}

	@Override
	public List<Order> getOrderByMemberId(int memberId) {
		return orderDao.getOrderByMemberId(memberId);
	}


	@Override
	public List<Order> getOrderByDateAndMemberId(String date, int memberId) {
		return orderDao.getOrderByDateAndMemberId(date, memberId);
	}

}
