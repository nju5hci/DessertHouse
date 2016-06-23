package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AssessAction  extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private MemberService memberService;
		private DessertService dessertService;
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
			int  mid = Integer.parseInt((String)sc.getAttribute("account"));
			List<Reserve> reserves=memberService.getReceivedReservesByMid(mid);
		int []reserve_id=new int[reserves.size()];
			int[] branch_id=new int[reserves.size()];
			int[] dessert_id=new int[reserves.size()];
			int[] dessert_num=new int[reserves.size()];
			String[] dessert_name=new String[reserves.size()];
			String[] date=new String[reserves.size()];
			double[] dessert_price=new double[reserves.size()];
			for(int i=0;i<reserves.size();i++){
				reserve_id[i]=reserves.get(i).getReserveId();
				Dessert dessert=dessertService.getDessertById(reserves.get(i).getDessertId());
			dessert_price[i]=dessert.getDessertPrice();
				dessert_id[i]=reserves.get(i).getDessertId();
				dessert_num[i]=reserves.get(i).getDessertNum();
				dessert_name[i]=dessert.getDessertName();
				date[i]=reserves.get(i).getDate();
			}
			sc.setAttribute("num", reserves.size());
			sc.setAttribute("reserve_id", reserve_id);
			sc.setAttribute("dessert_id", dessert_id);
			sc.setAttribute("dessert_price", dessert_price);
			sc.setAttribute("dessert_num", dessert_num);
			sc.setAttribute("dessert_name", dessert_name);
			sc.setAttribute("date", date);
			
			return success;
		}
	}
