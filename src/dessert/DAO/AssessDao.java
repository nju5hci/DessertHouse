package dessert.DAO;

import java.util.List;

import dessert.model.Assess;


public interface AssessDao {
	//新增
		boolean addAssesst(Assess assess);
		
	
		
		//通过id得到
		Assess getAssessById(int assessId);
		
		//通过memberid得到
		List<Assess> getAssessByMember(int mid);
		
		//通过dessertid得到
		List<Assess> getAssessByDessert(int dessertid);
		
		//得到所有产品
		List<Assess> getAllAssess();

}
