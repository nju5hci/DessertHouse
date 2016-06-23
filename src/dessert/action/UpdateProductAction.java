package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.service.DessertService;

public class UpdateProductAction extends BaseAction {

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
		
	
		int dessertId=(int) sc.getAttribute("dessertid");
		
		
		Dessert dessert=dessertService.getDessertById(dessertId);
		dessert.setDessertPrice(Double.parseDouble(request.getParameter("price")));
		dessert.setDessertStock(Integer.parseInt(request.getParameter("num")));
		dessertService.updateDessert(dessert);
		return success;
		}
	
}
