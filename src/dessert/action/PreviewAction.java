package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Assess;
import dessert.model.Dessert;
import dessert.service.DessertService;

public class PreviewAction extends BaseAction {

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
			sc.setAttribute("dessertStock", dessert.getDessertStock());
			sc.setAttribute("dessertPicAdd", dessert.getDessertPicAdd());
			List<Assess> assess=dessertService.getAllAssess(dessertid);
			String[] words_assess= new String[assess.size()];
			int[] memberId_assess = new int[assess.size()];
			String[] time_assess = new String[assess.size()];
		
			for(int i=0;i<assess.size();i++){
				words_assess[i]=assess.get(i).getWord();
				memberId_assess[i]=assess.get(i).getMemberId();
				time_assess[i]=assess.get(i).getDate();
				

		}
			sc.setAttribute("words_assess", words_assess);
			sc.setAttribute("time_assess", time_assess);
			sc.setAttribute("memberId_assess", memberId_assess);
			sc.setAttribute("assessNum", assess.size());
			return success;
		}else{
			return nodessert;
		}
		
	}
}
