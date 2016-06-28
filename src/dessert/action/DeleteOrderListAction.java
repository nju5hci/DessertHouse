package dessert.action;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.OrderList;
import dessert.service.DessertService;
import dessert.service.MemberService;
import dessert.service.OrderService;

public class DeleteOrderListAction extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
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

		int orderListId=Integer.parseInt(request.getParameter("orderListId"));
	

		OrderList orderList=orderService.getOrderListById(orderListId);
		orderService.deleteOrdersList(orderList);
		  response.setContentType("text/html;charset=UTF-8");
	       PrintWriter writer=response.getWriter();
	       writer.println("success");
		   return null;

		
	}
}
