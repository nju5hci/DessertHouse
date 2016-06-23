package dessert.service;

import java.util.List;

import dessert.model.Soil;
import dessert.model.Soil;

public interface  SoilService {
		//通过id得到土地
		Soil getSoilById(int soilId);
		//搜索
			List<Soil> getSoilBySearch(String searchString);
			
		
		//新增土地
		boolean addSoil(Soil soil);
		
		//更新土地
		boolean updateSoil(Soil soil);
		
		boolean deleteSoil(Soil soil);
		//得到未被组掉的所有土地
		List<Soil> getUnlendedSoil();
		//得到所有土地信息
		List<Soil> getSoils();
}
