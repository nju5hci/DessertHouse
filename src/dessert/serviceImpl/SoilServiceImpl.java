package dessert.serviceImpl;

import java.util.List;

import dessert.DAO.SoilDao;
import dessert.model.Soil;
import dessert.service.SoilService;

public class SoilServiceImpl implements SoilService{
	private SoilDao soilDao;

	public void setSoilDao(SoilDao soilDao) {
		this.soilDao = soilDao;
	}

	@Override
	public Soil getSoilById(int soilId) {
		return soilDao.getSoilById(soilId);
	}

	@Override
	public List<Soil> getSoilBySearch(String searchString) {
		return soilDao.getSoilByPlace(searchString);
	}

	@Override
	public boolean addSoil(Soil soil) {
		return soilDao.addSoil(soil);
	}

	@Override
	public boolean updateSoil(Soil soil) {
		return soilDao.updateSoil(soil);
	}

	@Override
	public boolean deleteSoil(Soil soil) {
		return soilDao.deleteSoil(soil);
	}

	@Override
	public List<Soil> getSoils() {
		// TODO Auto-generated method stub
		return soilDao.getAllSoil();
	}

	@Override
	public List<Soil> getUnlendedSoil() {
		return soilDao.getUnlendedSoil();
	}


}
