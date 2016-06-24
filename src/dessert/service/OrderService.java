package dessert.service;

import java.util.List;

import dessert.model.Orders;
import dessert.model.OrderList;
import dessert.model.OrderWithList;


public interface OrderService {
	//新增
	boolean addOrders(Orders Orders);
	
	//更新
	boolean updateOrders(Orders Orders);
	
	//删除
	boolean deleteOrders(Orders Orders);
	
	//通过id得到
	Orders getOrdersById(int OrdersId);
	//通过memberId得到
	List<OrderWithList> getOrdersByMemberId(int memberId);
	//通过memberId得到和状态
	List<OrderWithList> getOrdersByMemberIdAndState(int memberId,int state);
	
	//通过日期和memberID得到
	List<OrderWithList> getOrdersByDateAndMemberId(String date,int memberId);
	//新增
		boolean addOrdersList(OrderList OrdersList);
		
		//更新
		boolean updateOrdersList(OrderList OrdersList);
		
		//删除
		boolean deleteOrdersList(OrderList OrdersList);
		
	
		
		//通过大的订单号得到
		List<OrderList> getOrdersListByOrdersId(int OrdersId);
		
	

}
