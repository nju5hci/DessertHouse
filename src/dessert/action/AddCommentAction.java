package dessert.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Assess;
import dessert.model.Dessert;
import dessert.model.OrderList;
import dessert.model.Orders;
import dessert.service.DessertService;
import dessert.service.MemberService;
import dessert.service.OrderService;
import jdk.internal.org.objectweb.asm.tree.IntInsnNode;

public class AddCommentAction extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
	@Autowired
	private DessertService dessertService;
	private MemberService memberService;
	private OrderService orderService;
	
	
	public OrderService getOrderService() {
		return orderService;
	}
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public MemberService getMemberService() {
		return memberService;
	}
	public void setMemberService(MemberService memberService) {
		this.memberService = memberService;
	}
	public DessertService getDessertService() {
		return dessertService;
	}
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();

		String[] dessertid=request.getParameterValues("dessertid");
		int [] dessertsId=new int[dessertid.length];
		for(int i=0;i<dessertid.length;i++){
			dessertsId[i]=Integer.parseInt(dessertid[i]);
		}
		String[] comments=request.getParameterValues("other");
		
		int  mid = Integer.parseInt((String)sc.getAttribute("account"));
		
		

		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
		for(int i=0;i<dessertid.length;i++){
			int orderListId = 0;
			do{
				Random r = new Random(); 
				orderListId = r.nextInt(99999999);
			}while(orderListId>10000000);
			 Assess assess=new Assess(orderListId, mid, dessertsId[i], time, comments[i]);
			 
			 memberService.addAssess(assess);
			 
			 
		}
		int orderId=Integer.parseInt(request.getParameter("orderid"));
		Orders orders=orderService.getOrdersById(orderId);
		
		orders.setOrderState(Configure.ORDER_ASSESS);
		orderService.updateOrders(orders);

return success;
		
	}
}
