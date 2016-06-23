package dessert.DAO;

import java.util.List;

import dessert.model.SystemManager;

public interface SystemManagerDao {
		//增
		SystemManager addSystemManager(SystemManager systemManager);
		
		//更新
		void updateSystemManager(SystemManager systemManager);
		
		//验证
		boolean checkByIdAndPassword(SystemManager systemManager);
		
		//得到名字
		String getNameById(int systemManagerId);
		
		//得到系统管理员
		SystemManager getSystemManagerById(int systemManagerId);
		
		//得到所有系统管理员
		List<SystemManager> getAllSystemManagers();
}
