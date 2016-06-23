package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;



import dessert.configure.Configure;
import dessert.model.Activity;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.ActivityService;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class AssessActivityAction  extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private MemberService memberService;
		private ActivityService activityService;
		
		public MemberService getMemberService() {
			return memberService;
		}
		public void setMemberService(MemberService memberService) {
			this.memberService = memberService;
		}
	
		public ActivityService getActivityService() {
			return activityService;
		}
		public void setActivityService(ActivityService activityService) {
			this.activityService = activityService;
		}
		@Override
		public String execute() throws Exception {
			ServletContext sc = request.getServletContext();
			int  mid = Integer.parseInt((String)sc.getAttribute("account"));
			List<Reserve> reserves=memberService.getReceivedReservesActivityByMid(mid);
		int []reserve_id=new int[reserves.size()];
			int[] branch_id=new int[reserves.size()];
			int[] dessert_id=new int[reserves.size()];
			int[] dessert_num=new int[reserves.size()];
			String[] dessert_name=new String[reserves.size()];
			String[]kind=new String[reserves.size()];
			String[] date=new String[reserves.size()];
			double[] dessert_price=new double[reserves.size()];
			for(int i=0;i<reserves.size();i++){
				reserve_id[i]=reserves.get(i).getReserveId();
				Activity activity=activityService.getActivityById(reserves.get(i).getDessertId());
				
			kind[i]=changeKindToString(activity.getKind());
				dessert_id[i]=reserves.get(i).getDessertId();
				dessert_num[i]=reserves.get(i).getDessertNum();
				dessert_name[i]=activity.getActivityName();
				dessert_price[i]=activity.getActivityPrice();
				date[i]=reserves.get(i).getDate();
			}
			sc.setAttribute("num", reserves.size());
			sc.setAttribute("reserve_id", reserve_id);
			sc.setAttribute("dessert_id", dessert_id);
			sc.setAttribute("dessert_price", dessert_price);
			sc.setAttribute("kind", kind);
			sc.setAttribute("dessert_name", dessert_name);
			sc.setAttribute("date", date);
			
			return success;
		}
		public String changeKindToString(int kind){
			if(kind==Configure.ACTIVITY_PICK){
				return "采摘园";
			}else if(kind==Configure.ACTIVITY_PLANT){
				return "种植园";
			}else if(kind==Configure.ACTIVITY_WATCH){
				return "观赏园";
			}else if(kind==Configure.ACTIVITY_PERSON){
				return "个人经营园";
			}else {
				return "";
			}
		}
	}
