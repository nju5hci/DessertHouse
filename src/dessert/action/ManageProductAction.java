package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.service.DessertService;

public class ManageProductAction extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
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

		int dessertid=Integer.parseInt(request.getParameter("dessertid"));
		Dessert dessert=dessertService.getDessertById(dessertid);
		if(dessert!=null){
			sc.setAttribute("dessertid", dessertid);
			sc.setAttribute("dessertName", dessert.getDessertName());
			sc.setAttribute("dessertPrice", dessert.getDessertPrice());
			sc.setAttribute("dessertInfo", dessert.getDessertInfo());
			sc.setAttribute("dessertPicAdd", dessert.getDessertPicAdd());
			return success;
		}else{
			return nodessert;
		}
	}
}
