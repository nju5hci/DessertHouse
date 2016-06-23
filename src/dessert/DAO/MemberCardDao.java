package dessert.DAO;

import dessert.model.MemberCard;

public interface MemberCardDao {
	//通过mid得到会员卡
	MemberCard getMemeberCardById(int mid);
	//修改会员卡上状态等等
	MemberCard updateMemeberCard(MemberCard memeberCard);
	//注册开卡
	MemberCard openCard(MemberCard memberCard);
}
