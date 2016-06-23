package dessert.DAO;

import java.util.Date;
import java.util.List;

import dessert.model.Recharge;

public interface RechargeDao {
	//新增充值记录
	boolean addRecharge(Recharge recharge);

	//通过id查找该条记录
	Recharge getRechargeById(int rid );
	
	//查询会员的所有充值记录
	List<Recharge> getRechargeByMemberId(int mid );
	
	//查询某一天所有的充值记录
	List<Recharge> getRechargeByDate(Date rechargeDate);
	
	//查询某一分店的所有充值记录
	List<Recharge> getRechargeByBranch(int branchId);
	
	//得到所有的充值记录
	List<Recharge> getAllRecharge();
}
