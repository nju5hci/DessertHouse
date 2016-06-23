package dessert.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import dessert.DAO.GiftDao;
import dessert.model.Gift;
import dessert.service.GiftService;

public class GiftServiceImpl implements GiftService{
private GiftDao giftDao;

	public void setGiftDao(GiftDao giftDao) {
	this.giftDao = giftDao;
}

	@Override
	public Gift getGiftById(int giftId) {
		return giftDao.getGiftById(giftId);
	}

	@Override
	public List<Gift> getGiftBySearch(String searchString) {
		return giftDao.getGiftBySearchName(searchString);
	}

	@Override
	public boolean addGift(Gift gift) {
		return giftDao.addGift(gift);
		}

	@Override
	public boolean updateGift(Gift gift) {
		return giftDao.updateGift(gift);
	}

	@Override
	public boolean deleteGift(Gift gift) {
		return giftDao.deleteGift(gift);
	}

	@Override
	public List<Gift> getGifts() {
		List<Gift> gifts= giftDao.getAllGift();
	
		for(int i=0;i<gifts.size();i++){
			for(int j=i;j<gifts.size();j++){
				if(gifts.get(i).getGiftPrice()>gifts.get(j).getGiftPrice()){
					Gift gift=new Gift();
					Gift gift2=new Gift();
					gift=gifts.get(i);
					gift2=gifts.get(j);
					gifts.set(i, gift2);
					gifts.set(j, gift);
				}
			}
		}
		return gifts;
	}

}
