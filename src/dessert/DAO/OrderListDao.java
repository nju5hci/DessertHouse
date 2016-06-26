package dessert.DAO;

import java.util.List;

import dessert.model.OrderList;

public interface OrderListDao {
	//新增
	boolean addOrderList(OrderList orderList);
	
	//更新
	boolean updateOrderList(OrderList orderList);
	
	//删除
	boolean deleteOrderList(OrderList orderList);
	
	//通过id得到
	OrderList getOrderListById(int orderListId);
	
	
	//通过大的订单号得到
	List<OrderList> getOrderListByOrderId(int orderId);
	
	//通过菜的id得到
	List<OrderList> getOrderListByOrderDessertId(int dessertId);
	//
	boolean hasThisID(int ordersListId);
}
