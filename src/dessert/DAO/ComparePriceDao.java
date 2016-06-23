package dessert.DAO;

import java.util.List;

import dessert.model.Address;
import dessert.model.ComparePrice;

public interface ComparePriceDao {
	//新增
			boolean addComparePrice(ComparePrice comparePrice);
			
		
			
			//通过id得到
			ComparePrice getComparePriceById(int comparePriceId);
			
			//通过dessertId得到
			List<ComparePrice> getComparePriceByDessertId(int dessertId);
			
			
}
