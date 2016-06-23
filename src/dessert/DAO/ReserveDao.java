package dessert.DAO;

import java.util.List;

import dessert.model.Reserve;

public interface ReserveDao {

	boolean addReserve(Reserve reserve);
	

	Reserve getReserveById(int reserveId);
	void updateState(Reserve reserve);
	List<Reserve> getReserveByDate(String date);
	
	List<Reserve>  getReserveByMemberId(int mid,int kind);
	
	List<Reserve> getallReserves();
	//预定状态为0，买单后状态为1，收货成功后状态为2，评价完后状态为3
	List<Reserve>  getReserveByMemberIdAndState(int mid,int state,int kind);
}
