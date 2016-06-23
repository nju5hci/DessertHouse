package dessert.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.OrderList;
import dessert.model.OrderWithList;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberService;
import dessert.service.OrderService;

public class OrdersAction extends BaseAction{
	 
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
			int  mid = Integer.parseInt((String)sc.getAttribute("account"));
			List<OrderWithList> orderWithListrs=orderService.getOrdersByMemberId(mid);
	/**
	 * 	private int orderId;//订单号
	private int memberId;//谁下的订单
	private int totalPrice;//总额
	private int  orderState;//状态
	private  String orderDate;//日期
	private List<OrderList> list;
	 */
		int []orderId=new int[orderWithListrs.size()];
		
			double[] totalPrice=new double[orderWithListrs.size()];
			int[] orderState=new int[orderWithListrs.size()];
		
			String[] orderDate=new String[orderWithListrs.size()];
			List<List<OrderList>> list=new ArrayList<>();
			
			for(int i=0;i<orderWithListrs.size();i++){
				orderId[i]=orderWithListrs.get(i).getOrderId();
						orderState[i]=orderWithListrs.get(i).getOrderState();
						totalPrice[i]=orderWithListrs.get(i).getTotalPrice();
						orderDate[i]=orderWithListrs.get(i).getOrderDate();
		list.add(orderWithListrs.get(i).getList());
			
			}
			sc.setAttribute("num", orderWithListrs.size());
			sc.setAttribute("orderId", orderId);
			sc.setAttribute("totalPrice", totalPrice);
			sc.setAttribute("orderState", orderState);
			sc.setAttribute("orderDate", orderDate);
			sc.setAttribute("list", list);
	
			
			return success;
		}

}
