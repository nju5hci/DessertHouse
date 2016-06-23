package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Reserve;
import dessert.model.Soil;
import dessert.service.MemberService;
import dessert.service.SoilService;

public class PayedSoilAction extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private MemberService memberService;
		private SoilService soilService;
		public MemberService getMemberService() {
			return memberService;
		}
		public void setMemberService(MemberService memberService) {
			this.memberService = memberService;
		}
	
		public SoilService getSoilService() {
			return soilService;
		}
		public void setSoilService(SoilService soilService) {
			this.soilService = soilService;
		}
		@Override
		public String execute() throws Exception {
			ServletContext sc = request.getServletContext();
			int  mid = Integer.parseInt((String)sc.getAttribute("account"));
		
		
		
		List<Reserve> reserves=memberService.getReceivedReservesSoilByMid(mid);
		int []reserve_id=new int[reserves.size()];
			int[] branch_id=new int[reserves.size()];
			int[] dessert_id=new int[reserves.size()];
			String[] dessert_place=new String[reserves.size()];
			String[] date=new String[reserves.size()];
			double[] dessert_price=new double[reserves.size()];
			for(int i=0;i<reserves.size();i++){
				reserve_id[i]=reserves.get(i).getReserveId();
			Soil soil=soilService.getSoilById(reserves.get(i).getDessertId());
			dessert_price[i]=soil.getSoilPrice();
				dessert_id[i]=reserves.get(i).getDessertId();
				dessert_place[i]=soil.getSoilPlace();
				date[i]=reserves.get(i).getDate();
			}
			sc.setAttribute("num", reserves.size());
			sc.setAttribute("reserve_id", reserve_id);
			sc.setAttribute("dessert_id", dessert_id);
			sc.setAttribute("dessert_price", dessert_price);
			sc.setAttribute("dessert_place", dessert_place);
			sc.setAttribute("date", date);
			
			return success;
		}
	}
