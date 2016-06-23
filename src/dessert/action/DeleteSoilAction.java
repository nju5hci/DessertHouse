package dessert.action;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Activity;
import dessert.model.Soil;
import dessert.service.ActivityService;
import dessert.service.SoilService;
import jdk.nashorn.internal.runtime.regexp.joni.Config;

public class DeleteSoilAction extends BaseAction {

	private String success = "success";

	@Autowired
	private SoilService soilService;
	
	

	public SoilService getSoilService() {
		return soilService;
	}



	public void setSoilService(SoilService soilService) {
		this.soilService = soilService;
	}



	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
		
	
		int dessertid=Integer.parseInt(request.getParameter("dessertid"));
		Soil soil=soilService.getSoilById(dessertid);
		soil.setState(Configure.SOIL_LENDED);
		soilService.updateSoil(soil);
		return success;
		}
	
}
