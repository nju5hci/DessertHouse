package dessert.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Reserve;
import dessert.model.Soil;
import dessert.service.MemberService;
import dessert.service.SoilService;

public class MySoilAction  extends BaseAction{
	 
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
			
			List<Soil>soils=new ArrayList<Soil>();
			String [] start_soil=new String[reserves.size()];
			String [] end_soil=new String[reserves.size()];
		for(int i=0;i<reserves.size();i++){
			soils.add(soilService.getSoilById(reserves.get(i).getDessertId()));

			start_soil[i]=reserves.get(i).getDate();
			end_soil[i]=this.endDate(reserves.get(i).getDate());
		}
			String[] money_soil = new String[soils.size()];
			String[] address_soil = new String[soils.size()];
			String[] place_soil = new String[soils.size()];
		
			int [] id_soil=new int[soils.size()];
			for(int i=0;i<soils.size();i++){
				
				money_soil[i]=Double.toString(soils.get(i).getSoilPrice());
				address_soil[i]=soils.get(i).getSoilPicAdd();
			
				place_soil[i]=soils.get(i).getSoilPlace();
				id_soil[i]=soils.get(i).getSoilId();
				System.out.println(address_soil[i]);
			

		}
			
			sc.setAttribute("id_soil", id_soil);
			sc.setAttribute("start_soil", start_soil);
			sc.setAttribute("end_soil", end_soil);
			sc.setAttribute("place_soil", place_soil);
			sc.setAttribute("num_soil", soils.size());
		sc.setAttribute("money_soil", money_soil);
		sc.setAttribute("address_soil", address_soil);
		
		
			
			return success;
		}
		public String endDate(String date){
			String result="";
			   int year1=Integer.parseInt(date.split("-")[0]);
			   int month1=Integer.parseInt(date.split("-")[1]);
			   int day1=Integer.parseInt(date.split("-")[2]);
			   year1=year1+1;
			   result=result+year1+month1+day1;
			   return result;
			   
		}
	}
