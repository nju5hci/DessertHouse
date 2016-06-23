package dessert.DaoImpl;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.MemberCardDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Member;
import dessert.model.MemberCard;

public class MemberCardDaoImpl extends YeekuHibernateDaoSupport implements MemberCardDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	
	@Override
	public MemberCard getMemeberCardById(int mid) {
		MemberCard memberCard=(MemberCard) baseDao.load(MemberCard.class, mid);
		return memberCard;
	}

	@Override
	public MemberCard updateMemeberCard(MemberCard memeberCard) {
		baseDao.update(memeberCard);
		MemberCard  mCard=this.getMemeberCardById(memeberCard.getMid());
		return mCard;
	}

	@Override
	public MemberCard openCard(MemberCard memberCard) {
		MemberCard m=new MemberCard();
		baseDao.save(memberCard);
		m=this.getMemeberCardById(memberCard.getMid());
		return m;
	}

}
