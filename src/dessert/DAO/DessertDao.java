package dessert.DAO;

import java.util.ArrayList;
import java.util.List;

import dessert.model.Dessert;


public interface DessertDao {
	//新增
	boolean addDessert(Dessert dessert);
	
	//更新
	boolean updateDessert(Dessert dessert);
	
	//删除
	boolean deleteDessert(Dessert dessert);
	
	//通过id得到
	Dessert getDessertById(int dessertId);
	
	//通过名字得到
	List<Dessert> getDessertByName(String dessertName);
	

	//模糊名字的到
	List<Dessert> getDessertBySearchName(String dessertName);
	
	//得到所有产品
	List<Dessert> getAllDessert();

}
