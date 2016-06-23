package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;






import dessert.model.Activity;
import dessert.model.Dessert;
import dessert.model.Reserve;
import dessert.service.ActivityService;
import dessert.service.DessertService;
import dessert.service.MemberService;

public class ReserveActivityAction  extends BaseAction{
	private String success = "success";
	@Autowired
	private ActivityService activityService;
	private MemberService memberService;
	

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
		List<Activity>activitys=activityService.getPickActivitys();
			String[] startDate_activity=new String[activitys.size()]; 
			String[] money_activity = new String[activitys.size()];
			String[] address_activity = new String[activitys.size()];
			String[] name_activity = new String[activitys.size()];
			int [] id_activity=new int[activitys.size()];
			for(int i=0;i<activitys.size();i++){
				startDate_activity[i]=activitys.get(i).getActivitydateStart();
				money_activity[i]=Double.toString(activitys.get(i).getActivityPrice());
				address_activity[i]=activitys.get(i).getActivityPicAdd();
				name_activity[i]=activitys.get(i).getActivityName();
				id_activity[i]=activitys.get(i).getActivityId();
				System.out.println(address_activity[i]);
			

		}
			sc.setAttribute("startDate_activity", startDate_activity);
			sc.setAttribute("id_activity", id_activity);
			sc.setAttribute("name_activity", name_activity);
			sc.setAttribute("num_activity", activitys.size());
		sc.setAttribute("money_activity", money_activity);
		sc.setAttribute("address_activity", address_activity);
		
		List<Activity>activitys2=activityService.getPlantActivitys();
		String[] startDate_activity2=new String[activitys2.size()]; 
		String[] money_activity2 = new String[activitys2.size()];
		String[] address_activity2 = new String[activitys2.size()];
		String[] name_activity2 = new String[activitys2.size()];
		int [] id_activity2=new int[activitys2.size()];
		for(int i=0;i<activitys2.size();i++){
			startDate_activity2[i]=activitys2.get(i).getActivitydateStart();
			money_activity2[i]=Double.toString(activitys2.get(i).getActivityPrice());
			address_activity2[i]=activitys2.get(i).getActivityPicAdd();
			name_activity2[i]=activitys2.get(i).getActivityName();
			id_activity2[i]=activitys2.get(i).getActivityId();
			
		

	}
		sc.setAttribute("startDate_activityPlant", startDate_activity2);
		sc.setAttribute("id_activityPlant", id_activity2);
		sc.setAttribute("name_activityPlant", name_activity2);
		sc.setAttribute("num_activityPlant", activitys2.size());
	sc.setAttribute("money_activityPlant", money_activity2);
	sc.setAttribute("address_activityPlant", address_activity2);
	
	
	List<Activity>activitys3=activityService.getWatchActivitys();
	String[] startDate_activity3=new String[activitys3.size()]; 
	String[] money_activity3 = new String[activitys3.size()];
	String[] address_activity3 = new String[activitys3.size()];
	String[] name_activity3 = new String[activitys3.size()];
	int [] id_activity3=new int[activitys3.size()];
	for(int i=0;i<activitys3.size();i++){
		startDate_activity3[i]=activitys3.get(i).getActivitydateStart();
		money_activity3[i]=Double.toString(activitys3.get(i).getActivityPrice());
		address_activity3[i]=activitys3.get(i).getActivityPicAdd();
		name_activity3[i]=activitys3.get(i).getActivityName();
		id_activity3[i]=activitys3.get(i).getActivityId();
	

}
	sc.setAttribute("startDate_activityWatch", startDate_activity3);
	sc.setAttribute("id_activityWatch", id_activity3);
	sc.setAttribute("name_activityWatch", name_activity3);
	sc.setAttribute("num_activityWatch", activitys3.size());
sc.setAttribute("money_activityWatch", money_activity3);
sc.setAttribute("address_activityWatch", address_activity3);


List<Activity>activitys4=activityService.getPersonActivitys();
String[] startDate_activity4=new String[activitys4.size()]; 
String[] money_activity4 = new String[activitys4.size()];
String[] address_activity4 = new String[activitys4.size()];
String[] name_activity4 = new String[activitys4.size()];
int [] id_activity4=new int[activitys4.size()];
for(int i=0;i<activitys4.size();i++){
	startDate_activity4[i]=activitys4.get(i).getActivitydateStart();
	money_activity4[i]=Double.toString(activitys4.get(i).getActivityPrice());
	address_activity4[i]=activitys4.get(i).getActivityPicAdd();
	name_activity4[i]=activitys4.get(i).getActivityName();
	id_activity4[i]=activitys4.get(i).getActivityId();



}
sc.setAttribute("startDate_activityPerson", startDate_activity4);
sc.setAttribute("id_activityPerson", id_activity4);
sc.setAttribute("name_activityPerson", name_activity4);
sc.setAttribute("num_activityPerson", activitys4.size());
sc.setAttribute("money_activityPerson", money_activity4);
sc.setAttribute("address_activityPerson", address_activity4);


int  mid = Integer.parseInt((String)sc.getAttribute("account"));
List<Reserve> reserves=memberService.getBookReservesActivityByMid(mid);
int []reserve_id=new int[reserves.size()];

	int[] dessert_id=new int[reserves.size()];
	int[] dessert_num=new int[reserves.size()];
	String[] dessert_name=new String[reserves.size()];
	String[] date=new String[reserves.size()];
	double[] dessert_price=new double[reserves.size()];
	for(int i=0;i<reserves.size();i++){
		reserve_id[i]=reserves.get(i).getReserveId();
		Activity activity=activityService.getActivityById(reserves.get(i).getDessertId());
	dessert_price[i]=activity.getActivityPrice();
		dessert_id[i]=reserves.get(i).getDessertId();
		dessert_num[i]=reserves.get(i).getDessertNum();
		dessert_name[i]=activity.getActivityName();
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
