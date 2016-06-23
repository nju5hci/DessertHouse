package dessert.action;



import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Assess;
import dessert.model.Dessert;
import dessert.model.MemberCard;
import dessert.service.DessertService;


public class AddProductAction extends BaseAction {

	private String success = "success";
	private String input = "input";

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
		if(request.getParameter("dessertId")==""||request.getParameter("dessertName")==""||request.getParameter("dessertInfo")==""||
				request.getParameter("dessertPrice")==""||request.getParameter("dessertStock")==""){    
			return input;
		}else{
			Dessert dessert=new Dessert( Integer.parseInt(request.getParameter("dessertId")),  request.getParameter("dessertName"),
					Double.parseDouble( request.getParameter("dessertPrice")),  request.getParameter("dessertInfo"),  
					Integer.parseInt(request.getParameter("dessertStock")), 	request.getParameter("dessertPicAdd"));
			
			dessertService.addDessert(dessert);
		return success;
		}
	}
	}