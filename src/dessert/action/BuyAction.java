package dessert.action;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.sun.org.apache.xerces.internal.util.DraconianErrorHandler;

import dessert.model.OrderList;
import dessert.service.OrderService;

public class BuyAction extends BaseAction{
	 
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
			List<OrderList> orderLists=orderService.getOrdersListByOrdersId(-mid);
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
			int []orderListId=new int[orderLists.size()];
		int []dessertId=new int[orderLists.size()];
		int []dessertNum=new int[orderLists.size()];
		String[] dessertName=new String[orderLists.size()];
		double[] dessertPrice=new double[orderLists.size()];
			double[] totalPrice=new double[orderLists.size()];
			String[] dessertPicture=new String[orderLists.size()];
		double total=0.0;
		
			for(int i=0;i<orderLists.size();i++){
				orderListId[i]=orderLists.get(i).getOrderListId();
				dessertId[i]=orderLists.get(i).getDessertId();
				dessertNum[i]=orderLists.get(i).getDessertNum();
				dessertName[i]=orderLists.get(i).getDessertName();
				dessertPrice[i]=orderLists.get(i).getDessertPrice();
				totalPrice[i]=orderLists.get(i).getTotalPrice();
				dessertPicture[i]=orderLists.get(i).getDessertPicture();
					total=total+orderLists.get(i).getDessertNum()*orderLists.get(i).getDessertPrice();
			

		}
			
			  BigDecimal b = new BigDecimal(total);
			  double f1 = b.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
			   
			sc.setAttribute("num", orderLists.size());
			sc.setAttribute("dessertId", dessertId);
			sc.setAttribute("orderListId", orderListId);
			sc.setAttribute("dessertNum", dessertNum);
			sc.setAttribute("dessertName", dessertName);
			sc.setAttribute("dessertPrice", dessertPrice);
			sc.setAttribute("totalPrice", totalPrice);
			sc.setAttribute("total", f1);
			sc.setAttribute("dessertPicture", dessertPicture);
			
			return success;
		}

}
