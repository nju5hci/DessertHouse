package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.service.DessertService;

public class SearchProductAction extends BaseAction {

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
	
		String word=request.getParameter("search");
		List<Dessert> desserts=dessertService.getDessertBySearch(word);
		String[] money_dessert = new String[desserts.size()];
		String[] address_dessert = new String[desserts.size()];
		String[] name_dessert = new String[desserts.size()];
		int [] id_dessert=new int[desserts.size()];
		for(int i=0;i<desserts.size();i++){
			money_dessert[i]=Double.toString(desserts.get(i).getDessertPrice());
			address_dessert[i]=desserts.get(i).getDessertPicAdd();
			name_dessert[i]=desserts.get(i).getDessertName();
			id_dessert[i]=desserts.get(i).getDessertId();
			System.out.println(address_dessert[i]);
		

	}
		sc.setAttribute("id_dessert", id_dessert);
		sc.setAttribute("name_dessert", name_dessert);
		sc.setAttribute("num_dessert", desserts.size());
	sc.setAttribute("money_dessert", money_dessert);
	sc.setAttribute("address_dessert", address_dessert);
	return success;
		
		
		
	}
}