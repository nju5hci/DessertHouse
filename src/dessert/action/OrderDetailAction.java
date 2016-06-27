package dessert.action;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.Order;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.OrderList;
import dessert.model.OrderWithList;
import dessert.model.Orders;
import dessert.service.OrderService;

public class OrderDetailAction extends BaseAction{
	 
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
			List<OrderList> orderLists=orderService.getOrdersListByOrdersId(orderID);
	/**
	 * 	private  int  orderListId;//详情号
	private int orderId;//订单号
	private int dessertId;//菜的id
	private int dessertNum;//数量
	private String  dessertName;//菜的名字
	private double dessertPrice;//菜的单价
	private double totalPrice;//菜的总额，即单价乘以数量
	private String dessertPicture;//菜的地址这里显示一张图片就好
	 */
		 String sendAddress=orders.getSendAddress();//送货地址
			String sendTime=orders.getSendTime();//送货施加
		 String sendWay=orders.getSendWay();//配送方式
		String payWay=orders.getPayWay();//付款方式
		double discount=orders.getDiscount();
		
			double totalPrice=orders.getTotalPrice();
			
			int orderState=orders.getOrderState();
		
			int []dessertId=new int[orderLists.size()];
			int []dessertNum=new int[orderLists.size()];
			
			double[] dessertPrice=new double[orderLists.size()];
			
			double[] desserttotalPrice=new double[orderLists.size()];
			String[] dessertPicture=new String[orderLists.size()];
			String[] dessertName=new String[orderLists.size()];
		
		
			for(int i=0;i<orderLists.size();i++){
				dessertId[i]=orderLists.get(i).getDessertId();
				dessertNum[i]=orderLists.get(i).getDessertNum();
				dessertPrice[i]=orderLists.get(i).getDessertPrice();
				desserttotalPrice[i]=orderLists.get(i).getTotalPrice();
				dessertName[i]=orderLists.get(i).getDessertName();
				dessertPicture[i]=orderLists.get(i).getDessertPicture();
				
			
			}
			  BigDecimal b = new BigDecimal(totalPrice);
			  double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			sc.setAttribute("num", orderLists.size());
			sc.setAttribute("dessertId", dessertId);
			sc.setAttribute("dessertNum", dessertNum);
			sc.setAttribute("dessertPrice", dessertPrice);
			sc.setAttribute("desserttotalPrice", desserttotalPrice);
			sc.setAttribute("dessertName", dessertName);

			sc.setAttribute("dessertPicture", dessertPicture);
			sc.setAttribute("orderID", orderID);
			sc.setAttribute("sendAddress", sendAddress);
			sc.setAttribute("sendTime", sendTime);
			sc.setAttribute("sendWay", sendWay);
			sc.setAttribute("discount", discount);
			sc.setAttribute("payWay", payWay);
			sc.setAttribute("totalPrice", f1);
			sc.setAttribute("orderState", orderState);
			return success;
		}

}
