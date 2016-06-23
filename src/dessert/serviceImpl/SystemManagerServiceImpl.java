package dessert.serviceImpl;

import dessert.DAO.DessertDao;
import dessert.DAO.SystemManagerDao;
import dessert.model.Dessert;
import dessert.model.SystemManager;
import dessert.service.SystemManagerService;

public class SystemManagerServiceImpl implements SystemManagerService {
	private SystemManagerDao systemManagerDao;
	 private DessertDao dessertDao;
	
	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	public void setSystemManagerDao(SystemManagerDao systemManagerDao) {
		this.systemManagerDao = systemManagerDao;
	}

	@Override
	public SystemManager registerSystemManager(SystemManager systemManager) {
		SystemManager s=systemManagerDao.addSystemManager(systemManager);
		return s;
	}

	@Override
	public boolean checkLogin(SystemManager systemManager) {
		return systemManagerDao.checkByIdAndPassword(systemManager);
	}

	@Override
	public SystemManager getInfo(int systemManagerId) {
		return systemManagerDao.getSystemManagerById(systemManagerId);
	}


}
