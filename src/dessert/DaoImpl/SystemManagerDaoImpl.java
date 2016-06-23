package dessert.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.SystemManagerDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.SystemManager;

public class SystemManagerDaoImpl extends YeekuHibernateDaoSupport implements SystemManagerDao{
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}
	@Override
	public SystemManager addSystemManager(SystemManager systemManager) {
		SystemManager s=new SystemManager();
		baseDao.save(systemManager);
		s=this.getSystemManagerById(systemManager.getSystemManagerId());
		return s;
	}


	@Override
	public void updateSystemManager(SystemManager systemManager) {
		baseDao.update(systemManager);
	}

	@Override
	public boolean checkByIdAndPassword(SystemManager systemManager) {
		SystemManager s=(SystemManager)baseDao.load(SystemManager.class, systemManager.getSystemManagerId());
		if(s==null){
			return false;
		}
		System.out.println(s.getSystemManagerPassword());
		if(s.getSystemManagerPassword().equals(systemManager.getSystemManagerPassword())){
		return true;
		}else{
			return false;
		}
	}

	@Override
	public String getNameById(int systemManagerId) {
		SystemManager s=(SystemManager)baseDao.load(SystemManager.class, systemManagerId);
		if(s==null){
			return "";
		}else{
			return s.getSystemManagerName();
		}
	}

	@Override
	public SystemManager getSystemManagerById(int systemManagerId) {
		return (SystemManager)baseDao.load(SystemManager.class, systemManagerId);
	}

	@Override
	public List<SystemManager> getAllSystemManagers() {
		String hql = "from dessert.model.SystemManager";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}



	
}
