package dessert.DAO;

import java.util.List;

import dessert.model.Orders;

public interface OrderDao {
	//新增
			boolean addOrders(Orders Orders);
			
			//更新
			boolean updateOrders(Orders Orders);
			
			//删除
			boolean deleteOrders(Orders Orders);
			
			//通过id得到
			Orders getOrdersById(int OrdersId);
			//通过memberId得到
			List<Orders> getOrdersByMemberId(int memberId);
			//通过日期和memberID得到
			List<Orders> getOrdersByDateAndMemberId(String date,int memberId);
			
			//得到所有活动
			List<Orders> getAllOrders();
}
