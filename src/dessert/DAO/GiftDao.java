package dessert.DAO;

import java.util.List;

import dessert.model.Dessert;
import dessert.model.Gift;

public interface GiftDao {
	//新增
	boolean addGift(Gift gift);
	
	//更新
	boolean updateGift(Gift gift);
	
	//删除
	boolean deleteGift(Gift gift);
	
	//通过id得到
	Gift getGiftById(int giftId);
	

	//模糊名字的到
	List<Gift> getGiftBySearchName(String giftName);
	
	//得到所有产品
	List<Gift> getAllGift();

}
