package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.OrderList;
import dessert.model.Orders;
import dessert.service.OrderService;

public class ComfirmOrderAction extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private OrderService orderService;
		
	
		public OrderService getOrderService() {
			return orderService;
		}


		public void setOrderService(OrderService orderService) {
			this.orderService = orderService;
		}


		@Override
		public String execute() throws Exception {
			ServletContext sc = request.getServletContext();
			int  orderID = Integer.parseInt(request.getParameter("orderid"));
			Orders orders=orderService.getOrdersById(orderID);
			orders.setOrderState(Configure.ORDER_UNASSESS);
			orderService.updateOrders(orders);
		
			return success;
		}

}
