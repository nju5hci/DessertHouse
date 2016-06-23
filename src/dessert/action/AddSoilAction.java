package dessert.action;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.Soil;
import dessert.service.DessertService;
import dessert.service.SoilService;
import jdk.nashorn.internal.runtime.regexp.joni.Config;

public class AddSoilAction  extends BaseAction {

	private String success = "success";
	private String input = "input";

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
		if(request.getParameter("dessertId")==""||request.getParameter("dessertName")==""||request.getParameter("dessertInfo")==""||
				request.getParameter("dessertPrice")==""){    
			return input;
		}else{
			Soil soil=new Soil(Integer.parseInt(request.getParameter("dessertId")), request.getParameter("dessertName"),
					Double.parseDouble( request.getParameter("dessertPrice")),  request.getParameter("dessertInfo"),
					request.getParameter("dessertPicAdd"), Configure.SOIL_UNLENDED);
			soilService.addSoil(soil);
		return success;
		}
	}
	}