package dessert.service;

import java.util.List;

import dessert.model.Assess;
import dessert.model.ComparePrice;
import dessert.model.Dessert;

public interface DessertService {
	//通过id得到甜品
	Dessert getDessertById(int dessertId);
	//搜索
		List<Dessert> getDessertBySearch(String searchString);
		//搜索
		List<Dessert> getDessertByName(String searchString);	
	
	//新增甜品
	boolean addDessert(Dessert dessert);
	
	//更新甜品
	boolean updateDessert(Dessert dessert);
	
	boolean deleteDessert(Dessert dessert);
	
	//得到所有甜品信息
	List<Dessert> getDesserts();
	//得到关于某甜品的所有评论
	List<Assess> getAllAssess(int dessertid);
	

	//得到某一个甜品的所有价格
	//通过dessertId得到
	List<ComparePrice> getComparePriceByDessertId(int dessertId);
}
