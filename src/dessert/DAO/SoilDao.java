package dessert.DAO;

import java.util.List;

import javax.swing.ListModel;

import dessert.model.Dessert;
import dessert.model.Soil;

public interface SoilDao {
	//新增
			boolean addSoil(Soil soil);
			
			//更新
			boolean updateSoil(Soil soil);
			
			//删除
			boolean deleteSoil(Soil soil);
			
			//通过id得到
			Soil getSoilById(int soilId);
			
			//通过模糊名字得到
			List<Soil> getSoilByPlace(String soilPlace);
			//通过有无租赁掉来看
			List<Soil> getUnlendedSoil();
			
			//得到所有产品
			List<Soil> getAllSoil();
}
