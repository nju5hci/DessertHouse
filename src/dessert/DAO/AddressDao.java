package dessert.DAO;

import java.util.List;

import dessert.model.Address;


public interface AddressDao {
	//新增
		boolean addAddress(Address address);
		
		//更新
		boolean updateAddress(Address address);
		
		//删除
		boolean deleteAddress(Address address);
		
		//通过id得到
		Address getAddressById(int addressId);
		
	
		//通过memberid得到
		List<Address> getAddressByMemberId(int mid);
		
	
}
