package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.sun.jndi.url.iiopname.iiopnameURLContextFactory;

import dessert.model.Dessert;
import dessert.service.DessertService;

public class Index2Action extends BaseAction{
	private String success = "success";
	@Autowired
	private DessertService dessertService;
	public DessertService getDessertService() {
		return dessertService;
	}
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		List<Dessert> desserts =dessertService.getDessertBySearch("v");
			System.out.println( desserts.size());
			String[] money_dessert = new String[desserts.size()];
			String[] address_dessert = new String[desserts.size()];
			String[] name_dessert = new String[desserts.size()];
			int [] id_dessert=new int[desserts.size()];
			int num=desserts.size();
			if(num>4)num=4;
		
			for(int i=0;i<num;i++){
				money_dessert[i]=Double.toString(desserts.get(i).getDessertPrice());
				address_dessert[i]=desserts.get(i).getDessertPicAdd();
				name_dessert[i]=desserts.get(i).getDessertName();
				id_dessert[i]=desserts.get(i).getDessertId();

		}
			sc.setAttribute("id_dessert", id_dessert);
			sc.setAttribute("name_dessert", name_dessert);
			sc.setAttribute("num_dessert", num);
		sc.setAttribute("money_dessert", money_dessert);
		sc.setAttribute("address_dessert", address_dessert);
		
		List<Dessert> fruits =dessertService.getDessertBySearch("f");
		String[] money_fruit = new String[fruits.size()];
		String[] address_fruit = new String[fruits.size()];
		String[] name_fruit = new String[fruits.size()];
		int [] id_fruit=new int[fruits.size()];
		int num_fruit=fruits.size();
		if(num_fruit>4)num_fruit=4;
		for(int i=0;i<num_fruit;i++){
			money_fruit[i]=Double.toString(fruits.get(i).getDessertPrice());
			address_fruit[i]=fruits.get(i).getDessertPicAdd();
			name_fruit[i]=fruits.get(i).getDessertName();
			id_fruit[i]=fruits.get(i).getDessertId();

	}
		sc.setAttribute("id_fruit", id_fruit);
		sc.setAttribute("name_fruit", name_fruit);
		sc.setAttribute("num_fruit", num_fruit);
	sc.setAttribute("money_fruit", money_fruit);
	sc.setAttribute("address_fruit", address_fruit);
		
	List<Dessert> meats =dessertService.getDessertBySearch("m");
	String[] money_meat = new String[meats.size()];
	String[] address_meat = new String[meats.size()];
	String[] name_meat = new String[meats.size()];
	int [] id_meat=new int[meats.size()];
	int num_meat=meats.size();
	if(num_meat>4)num_meat=4;
	for(int i=0;i<num_meat;i++){
		money_meat[i]=Double.toString(meats.get(i).getDessertPrice());
		address_meat[i]=meats.get(i).getDessertPicAdd();
		name_meat[i]=meats.get(i).getDessertName();
		id_meat[i]=meats.get(i).getDessertId();

}
	sc.setAttribute("id_meat", id_meat);
	sc.setAttribute("name_meat", name_meat);
	sc.setAttribute("num_meat", num_meat);
sc.setAttribute("money_meat", money_meat);
sc.setAttribute("address_meat", address_meat);

List<Dessert> seafoods =dessertService.getDessertBySearch("s");
String[] money_seafood = new String[seafoods.size()];
String[] address_seafood = new String[seafoods.size()];
String[] name_seafood = new String[seafoods.size()];
int [] id_seafood=new int[seafoods.size()];
int num_seafood=seafoods.size();
if(num_seafood>4)num_seafood=4;
for(int i=0;i<num_seafood;i++){
	money_seafood[i]=Double.toString(seafoods.get(i).getDessertPrice());
	address_seafood[i]=seafoods.get(i).getDessertPicAdd();
	name_seafood[i]=seafoods.get(i).getDessertName();
	id_seafood[i]=seafoods.get(i).getDessertId();

}
sc.setAttribute("id_seafood", id_seafood);
sc.setAttribute("name_seafood", name_seafood);
sc.setAttribute("num_seafood", num_seafood);
sc.setAttribute("money_seafood", money_seafood);
sc.setAttribute("address_seafood", address_seafood);
	
List<Dessert> milks =dessertService.getDessertBySearch("n");
String[] money_milk = new String[milks.size()];
String[] address_milk = new String[milks.size()];
String[] name_milk = new String[milks.size()];
int [] id_milk=new int[milks.size()];
int num_milk=milks.size();
if(num_milk>4)num_milk=4;
for(int i=0;i<num_milk;i++){
	money_milk[i]=Double.toString(milks.get(i).getDessertPrice());
	address_milk[i]=milks.get(i).getDessertPicAdd();
	name_milk[i]=milks.get(i).getDessertName();
	id_milk[i]=milks.get(i).getDessertId();

}
sc.setAttribute("id_milk", id_milk);
sc.setAttribute("name_milk", name_milk);
sc.setAttribute("num_milk", num_milk);
sc.setAttribute("money_milk", money_milk);
sc.setAttribute("address_milk", address_milk);

List<Dessert> eggs =dessertService.getDessertBySearch("e");
String[] money_egg = new String[eggs.size()];
String[] address_egg = new String[eggs.size()];
String[] name_egg = new String[eggs.size()];
int [] id_egg=new int[eggs.size()];
int num_egg=eggs.size();
if(num_egg>4)num_egg=4;
for(int i=0;i<num_egg;i++){
	money_egg[i]=Double.toString(eggs.get(i).getDessertPrice());
	address_egg[i]=eggs.get(i).getDessertPicAdd();
	name_egg[i]=eggs.get(i).getDessertName();
	id_egg[i]=eggs.get(i).getDessertId();

}
sc.setAttribute("id_egg", id_egg);
sc.setAttribute("name_egg", name_egg);
sc.setAttribute("num_egg", num_egg);
sc.setAttribute("money_egg", money_egg);
sc.setAttribute("address_egg", address_egg);

List<Dessert> sds =dessertService.getDessertBySearch("sd");
String[] money_sd = new String[sds.size()];
String[] address_sd = new String[sds.size()];
String[] name_sd = new String[sds.size()];
int [] id_sd=new int[sds.size()];
int num_sd=sds.size();
if(num_sd>4)num_sd=4;
for(int i=0;i<num_sd;i++){
	money_sd[i]=Double.toString(sds.get(i).getDessertPrice());
	address_sd[i]=sds.get(i).getDessertPicAdd();
	name_sd[i]=sds.get(i).getDessertName();
	id_sd[i]=sds.get(i).getDessertId();

}
sc.setAttribute("id_sd", id_sd);
sc.setAttribute("name_sd", name_sd);
sc.setAttribute("num_sd", num_sd);
sc.setAttribute("money_sd", money_sd);
sc.setAttribute("address_sd", address_sd);

List<Dessert> tws =dessertService.getDessertBySearch("tw");
String[] money_tw = new String[tws.size()];
String[] address_tw = new String[tws.size()];
String[] name_tw = new String[tws.size()];
int [] id_tw=new int[tws.size()];
int num_tw=tws.size();
if(num_tw>4)num_tw=4;
for(int i=0;i<num_tw;i++){
	money_tw[i]=Double.toString(tws.get(i).getDessertPrice());
	address_tw[i]=tws.get(i).getDessertPicAdd();
	name_tw[i]=tws.get(i).getDessertName();
	id_tw[i]=tws.get(i).getDessertId();

}
sc.setAttribute("id_tw", id_tw);
sc.setAttribute("name_tw", name_tw);
sc.setAttribute("num_tw", num_tw);
sc.setAttribute("money_tw", money_tw);
sc.setAttribute("address_tw", address_tw);

List<Dessert> alcohols =dessertService.getDessertBySearch("a");
String[] money_alcohol = new String[alcohols.size()];
String[] address_alcohol = new String[alcohols.size()];
String[] name_alcohol = new String[alcohols.size()];
int [] id_alcohol=new int[alcohols.size()];
int num_alcohol=alcohols.size();
if(num_alcohol>4)num_alcohol=4;
for(int i=0;i<num_alcohol;i++){
	money_alcohol[i]=Double.toString(alcohols.get(i).getDessertPrice());
	address_alcohol[i]=alcohols.get(i).getDessertPicAdd();
	name_alcohol[i]=alcohols.get(i).getDessertName();
	id_alcohol[i]=alcohols.get(i).getDessertId();

}
sc.setAttribute("id_alcohol", id_alcohol);
sc.setAttribute("name_alcohol", name_alcohol);
sc.setAttribute("num_alcohol", num_alcohol);
sc.setAttribute("money_alcohol", money_alcohol);
sc.setAttribute("address_alcohol", address_alcohol);
		return success;
	}
}
