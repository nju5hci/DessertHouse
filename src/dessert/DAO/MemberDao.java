package dessert.DAO;

import java.util.ArrayList;
import java.util.List;

import dessert.model.Member;
import dessert.model.Recharge;


public interface MemberDao {
	 	//增加
		Member addMember(Member member);
		
		//验证
		boolean checkByIdAndPassword(Member member);
		
		//通过id得到会员
		Member getMemberById(int mid);
		
		//通过id得到名字
		String getNameById(int mid);
		
		//通过电话得到会员
		List<Member> getMemberByTel(String phone);
		
		//通过id得到所有的缴费记录
		List<Recharge> getRechargeById(int mid);
		
	
		
		//修改注册信息
		boolean updateMember(Member member);
		
		//得到所有会员
		List<Member> getAllMembers();
		
}
