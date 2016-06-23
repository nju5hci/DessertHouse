package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Dessert;
import dessert.model.Soil;
import dessert.service.DessertService;
import dessert.service.SoilService;

public class SystemSoilAction extends BaseAction{
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
		List<Soil>soils=soilService.getUnlendedSoil();
		
		String[] money_soil = new String[soils.size()];
		String[] address_soil = new String[soils.size()];
		String[] place_soil = new String[soils.size()];
		int [] id_soil=new int[soils.size()];
		for(int i=0;i<soils.size();i++){
			
			money_soil[i]=Double.toString(soils.get(i).getSoilPrice());
			address_soil[i]=soils.get(i).getSoilPicAdd();
			place_soil[i]=soils.get(i).getSoilPlace();
			id_soil[i]=soils.get(i).getSoilId();
			System.out.println(address_soil[i]);
		

	}
		
		sc.setAttribute("id_soil", id_soil);
		sc.setAttribute("place_soil", place_soil);
		sc.setAttribute("num_soil", soils.size());
	sc.setAttribute("money_soil", money_soil);
	sc.setAttribute("address_soil", address_soil);
	
		return success;
	}
}
