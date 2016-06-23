package dessert.DaoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;


import dessert.DAO.AddressDao;
import dessert.DAO.BaseDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;

import dessert.model.Address;

public class AddressDaoImpl extends YeekuHibernateDaoSupport  implements AddressDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public boolean addAddress(Address address) {
		baseDao.save(address);
		return true;
	}

	@Override
	public boolean updateAddress(Address address) {
		baseDao.update(address);
		return true;
	}

	@Override
	public boolean deleteAddress(Address address) {
		baseDao.delete(address);
		return true;
	}

	@Override
	public Address getAddressById(int addressId) {
		Address address=null;
		String hql="from dessert.model.Address where addressId='"+addressId+"'";
		Session session=baseDao.getNewSession();
		List<Address> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			address=desserts.get(0);
		}else{
			System.out.println("找不到这个地址");
		}
		return address;
	}

	@Override
	public List<Address> getAddressByMemberId(int mid) {
		List<Address> dessertList=new ArrayList<Address>();
		String hql="from dessert.model.Address where memberId ='"+mid+"'";
		Session session=baseDao.getNewSession();
		List<Address> desserts=session.createQuery(hql).list();
		if(desserts.size()>0){
			for(int i=0;i<desserts.size();i++){
				dessertList.add(desserts.get(i));
			}
		}else{
			System.out.println("找不到这个地址");
		}
		return dessertList;
	
	}




}
