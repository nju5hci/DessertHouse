package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Assess;
import dessert.model.ComparePrice;
import dessert.model.Dessert;
import dessert.service.DessertService;

public class CommodityAction extends BaseAction {

	private String success = "success";
	private String nodessert="nodessert";
	@Autowired
	private DessertService dessertService;
	public DessertService getDessertService() {
		return dessertService;
	}
	public void setDessertService(DessertService dessertService) {
		this.dessertService = dessertService;
	}
	@Override
	public String execute() throws Exception {
		ServletContext sc = request.getServletContext();
/**
 * 	private int dessertId;//甜品id
	private String dessertName;//甜品的名称
	private double dessertPrice;//甜品的价格
	private String dessertInfo;//甜品的简介
	private int dessertStock;//甜品库存
	
	private String dessertPicAdd;//甜品照片所在地址
	private String dessertPicAdd1;//甜品照片所在地址
	private String dessertPicAdd2;//甜品照片所在地址
	
	private int isShowed;//被显示在页面上了就是true,没有显示的是false
	private int monthSale;//月销量
	private int totalSale;//总销量
	private int assessNum;//评价数
 */
		int dessertid=Integer.parseInt(request.getParameter("dessertid"));
		Dessert dessert=dessertService.getDessertById(dessertid);
		List<ComparePrice> comparePrices=dessertService.getComparePriceByDessertId(dessertid);
		int size=comparePrices.size();
		if(size>6) size=6;
		double[] price= new double[comparePrices.size()];
		for(int i=0;i<size;i++){
			price[i]=comparePrices.get(i).getDessertPrice();
		}
		
		if(dessert!=null){
			sc.setAttribute("dessertid", dessertid);
			sc.setAttribute("dessertName", dessert.getDessertName());
			sc.setAttribute("dessertPrice", dessert.getDessertPrice());
			sc.setAttribute("dessertStock", dessert.getDessertStock());
			sc.setAttribute("dessertPicAdd", dessert.getDessertPicAdd());
			sc.setAttribute("dessertPicAdd1", dessert.getDessertPicAdd1());
			sc.setAttribute("dessertPicAdd2", dessert.getDessertPicAdd2());
			sc.setAttribute("monthSale", dessert.getMonthSale());
			sc.setAttribute("totalSale", dessert.getTotalSale());
			sc.setAttribute("assessNum", dessert.getAssessNum());
			sc.setAttribute("dessertInfoPicAdd", dessert.getDessertInfoPicAdd());
			sc.setAttribute("dessertInfoPicAdd1", dessert.getDessertInfoPicAdd1());
			sc.setAttribute("dessertInfoPicAdd2", dessert.getDessertInfoPicAdd2());
			sc.setAttribute("dessertInfoPicAdd3", dessert.getDessertInfoPicAdd3());
			List<Assess> assess=dessertService.getAllAssess(dessertid);
			String[] words_assess= new String[assess.size()];
			int[] memberId_assess = new int[assess.size()];
			String[] time_assess = new String[assess.size()];
		
			for(int i=0;i<assess.size();i++){
				words_assess[i]=assess.get(i).getWord();
				memberId_assess[i]=assess.get(i).getMemberId();
				time_assess[i]=assess.get(i).getDate();
				

		}
			sc.setAttribute("price", price);
			sc.setAttribute("words_assess", words_assess);
			sc.setAttribute("time_assess", time_assess);
			sc.setAttribute("memberId_assess", memberId_assess);
			sc.setAttribute("assessNum2", assess.size());
			return success;
		}else{
			return nodessert;
		}
		
	}
}
