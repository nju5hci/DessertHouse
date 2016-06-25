package dessert.serviceImpl;

import java.util.List;

import dessert.DAO.AssessDao;
import dessert.DAO.ComparePriceDao;
import dessert.DAO.DessertDao;
import dessert.model.Assess;
import dessert.model.ComparePrice;
import dessert.model.Dessert;
import dessert.service.DessertService;

public class DessertServiceImpl implements DessertService{
	private DessertDao dessertDao;

	private AssessDao assessDao;
	
	private ComparePriceDao comparePriceDao;
	
	
	public void setComparePriceDao(ComparePriceDao comparePriceDao) {
		this.comparePriceDao = comparePriceDao;
	}

	public void setAssessDao(AssessDao assessDao) {
		this.assessDao = assessDao;
	}

	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	@Override
	public Dessert getDessertById(int dessertId) {
		return dessertDao.getDessertById(dessertId);
		
	}

	@Override
	public boolean addDessert(Dessert dessert) {
		return dessertDao.addDessert(dessert);
	}

	@Override
	public boolean updateDessert(Dessert dessert) {
		return dessertDao.updateDessert(dessert);
	}

	@Override
	public List<Dessert> getDesserts() {
		return dessertDao.getAllDessert();
	}




	@Override
	public boolean deleteDessert(Dessert dessert) {
		return dessertDao.deleteDessert(dessert);
	}

	@Override
	public List<Dessert> getDessertBySearch(String searchString) {
		return dessertDao.getDessertBySearchName(searchString);
	}


	@Override
	public List<Assess> getAllAssess(int dessertid) {
		return assessDao.getAssessByDessert(dessertid);
	}

	@Override
	public List<ComparePrice> getComparePriceByDessertId(int dessertId) {
		return comparePriceDao.getComparePriceByDessertId(dessertId);
	}

	@Override
	public List<Dessert> getDessertByName(String searchString) {
		return dessertDao.getDessertByName(searchString);
	}




}
