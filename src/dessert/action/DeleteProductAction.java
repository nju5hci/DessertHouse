package dessert.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.MemberCard;
import dessert.model.Reserve;
import dessert.service.DessertService;
import dessert.service.MemberCardService;
import dessert.service.MemberService;

public class DeleteProductAction extends BaseAction {

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
		dessertService.deleteDessert(dessert);
		return success;
		}
	
}
