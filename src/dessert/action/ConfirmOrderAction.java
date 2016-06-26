package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.sun.javafx.image.IntPixelAccessor;

import dessert.configure.Configure;
import dessert.model.MemberCard;
import dessert.model.OrderList;
import dessert.model.Orders;
import dessert.service.MemberCardService;
import dessert.service.MemberService;
import dessert.service.OrderService;

public class ConfirmOrderAction extends BaseAction{
	 
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
			String[]  orderList = 	(request.getParameterValues("orderList"));
			
			
			int []orderListId=new int[orderList.length];
			for(int i=0;i<orderList.length;i++){
				orderListId[i]=Integer.parseInt(orderList[i]);
		
			}
			String[]  numbers = 	(request.getParameterValues("number"));
			int[]nums=new int[orderList.length];
			double total=0.0;
			for(int i=0;i<orderList.length;i++){
				nums[i]=Integer.parseInt(numbers[i]);
				OrderList orderList2=	orderService.getOrderListById(orderListId[i]);
				orderList2.setDessertNum(nums[i]);
				orderService.updateOrdersList(orderList2);
				total=total+nums[i]*orderList2.getDessertPrice();
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
			
			int orderId = 0;
			do{
				Random r = new Random(); 
				orderId = r.nextInt(99999999);
			}while(orderId>10000000);
			for(int i=0;i<orderList.length;i++){
				
			OrderList orderList2=	orderService.getOrderListById(orderListId[i]);
			orderList2.setOrderId(-mid);
			orderService.updateOrdersList(orderList2);
			}
			Orders orders=new Orders(orderId, mid, total, Configure.ORDER_UNCHECK,
					time, "", "", "", "", discount);

		orderService.addOrders(orders);
		

			return success;
		}

}
