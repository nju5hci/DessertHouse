package dessert.service;

import java.util.List;

import dessert.model.Dessert;
import dessert.model.Gift;

public interface GiftService {
	//通过id得到甜品
		Gift getGiftById(int giftId);
		//搜索
			List<Gift> getGiftBySearch(String searchString);
			
		
		//新增甜品
		boolean addGift(Gift gift);
		
		//更新甜品
		boolean updateGift(Gift gift);
		
		boolean deleteGift(Gift gift);
		
		//得到所有甜品信息
		List<Gift> getGifts();
}
