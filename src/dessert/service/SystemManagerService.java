package dessert.service;

import dessert.model.Dessert;
import dessert.model.SystemManager;

public interface SystemManagerService {

	SystemManager registerSystemManager(SystemManager systemManager);
	
	boolean checkLogin(SystemManager systemManager);
	
	SystemManager getInfo(int systemManagerId);
	
	
}
