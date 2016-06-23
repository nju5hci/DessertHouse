package dessert.DAO;

import java.util.List;

import dessert.model.Order;

public interface OrderDao {
	//新增
			boolean addOrder(Order order);
			
			//更新
			boolean updateOrder(Order order);
			
			//删除
			boolean deleteOrder(Order order);
			
			//通过id得到
			Order getOrderById(int orderId);
			//通过memberId得到
			List<Order> getOrderByMemberId(int memberId);
			//通过日期和memberID得到
			List<Order> getOrderByDateAndMemberId(String date,int memberId);
			
			//得到所有活动
			List<Order> getAllOrder();
}
