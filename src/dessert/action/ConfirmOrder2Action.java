package dessert.action;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.MemberCard;
import dessert.model.OrderList;
import dessert.model.Orders;
import dessert.service.MemberCardService;
import dessert.service.OrderService;

public class ConfirmOrder2Action extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private OrderService orderService;

		private MemberCardService memberCardService;
		
	
		public MemberCardService getMemberCardService() {
			return memberCardService;
		}


		public void setMemberCardService(MemberCardService memberCardService) {
			this.memberCardService = memberCardService;
		}



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
			List<OrderList> orderLists=orderService.getOrdersListByOrdersId(-mid);
	
			double total=0.0;
			for(int i=0;i<orderLists.size();i++){
			
			
			
				total=total+orderLists.get(i).getDessertNum()*orderLists.get(i).getDessertPrice();
			}
			//List<OrderList> orderLists=orderService.getOrdersListByOrdersId(mid);
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			
			String time = df.format(new Date());// new Date()为获取当前系统时间
			MemberCard memberCard=memberCardService.getCardById(mid);
			int level=memberCard.getLevel();
		double discount=1.0;
			//根据不同的等级来打折
			if(level==1){
				discount=Configure.ONE_DISCOUNT;
			}else if(level==2){
				discount=Configure.TWO_DISCOUNT;
			}else if(level==3){
				discount=Configure.THREE_DISCOUNT;
			}
			//double totalPrice=Double.parseDouble(request.getParameter("total"));
			total=total*discount;
			  BigDecimal b = new BigDecimal(total);
			  double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			int orderId = 0;
			do{
				Random r = new Random(); 
				orderId = r.nextInt(99999999);
			}while(orderId>10000000);
			for(int i=0;i<orderLists.size();i++){
				
			OrderList orderList2=	orderLists.get(i);
			orderList2.setOrderId(orderId);
			orderService.updateOrdersList(orderList2);
			}
			/**
			 * String sendAddress,
			String sendTime, String sendWay, String payWay
			 */
			//String[] sendTime=request.getParameterValues("sendTime");
			String sendAddress=request.getParameter("sendAddress");
			System.out.println(sendAddress);
			String sendTime=request.getParameter("sendTime");
//			String time2="";
//			for(int i=0;i<sendTime.length;i++){
//				time2=time2+sendTime[i];
//			}
			String sendWay="快递上门";
			
			String payWay=request.getParameter("patyWay");
			Orders orders=new Orders(orderId, mid, f1, Configure.ORDER_UNCHECK,
					time, sendAddress, sendTime, sendWay, payWay, discount);

		orderService.addOrders(orders);
		

			return success;
		}

}
