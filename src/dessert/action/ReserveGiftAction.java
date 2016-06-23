package dessert.action;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;

import dessert.model.Gift;
import dessert.model.Reserve;
import dessert.model.Soil;
import dessert.service.GiftService;
import dessert.service.MemberService;
import dessert.service.SoilService;

public class ReserveGiftAction extends BaseAction{
	 
		private String success = "success";
		
		@Autowired
		private MemberService memberService;
		private GiftService giftService;
		public MemberService getMemberService() {
			return memberService;
		}
		public void setMemberService(MemberService memberService) {
			this.memberService = memberService;
		}
	
		
		public GiftService getGiftService() {
			return giftService;
		}
		public void setGiftService(GiftService giftService) {
			this.giftService = giftService;
		}
		@Override
		public String execute() throws Exception {
			ServletContext sc = request.getServletContext();
			int  mid = Integer.parseInt((String)sc.getAttribute("account"));
			List<Gift>gifts=giftService.getGifts();
		
			String[] money_gift = new String[gifts.size()];
			String[] address_gift = new String[gifts.size()];
			String[] name_gift = new String[gifts.size()];
			int [] id_gift=new int[gifts.size()];
			int [] stock_gift=new int[gifts.size()];
			for(int i=0;i<gifts.size();i++){
				
				money_gift[i]=Double.toString(gifts.get(i).getGiftPrice());
				address_gift[i]=gifts.get(i).getGiftPicAdd();
				name_gift[i]=gifts.get(i).getGiftName();
				id_gift[i]=gifts.get(i).getGiftId();
				stock_gift[i]=gifts.get(i).getGiftStock();
				
			

		}
			
			sc.setAttribute("id_gift", id_gift);
			sc.setAttribute("name_gift", name_gift);
			sc.setAttribute("num_gift", gifts.size());
		sc.setAttribute("money_gift", money_gift);
		sc.setAttribute("stock_gift", stock_gift);
		sc.setAttribute("address_gift", address_gift);
		
		
		List<Reserve> reserves=memberService.getBookReservesGiftByMid(mid);
		int []reserve_id=new int[reserves.size()];
		
			int[] dessert_id=new int[reserves.size()];
			int[] dessert_num=new int[reserves.size()];
			String[] dessert_name=new String[reserves.size()];
			String[] date=new String[reserves.size()];
			double[] dessert_price=new double[reserves.size()];
			for(int i=0;i<reserves.size();i++){
				reserve_id[i]=reserves.get(i).getReserveId();
			Gift gift=giftService.getGiftById(reserves.get(i).getDessertId());
			dessert_price[i]=gift.getGiftPrice();
				dessert_id[i]=reserves.get(i).getDessertId();
				dessert_num[i]=reserves.get(i).getDessertNum();
				dessert_name[i]=gift.getGiftName();
				date[i]=reserves.get(i).getDate();
			}
			sc.setAttribute("num", reserves.size());
			sc.setAttribute("reserve_id", reserve_id);
			sc.setAttribute("dessert_id", dessert_id);
			sc.setAttribute("dessert_num", dessert_num);
			sc.setAttribute("dessert_price", dessert_price);
			sc.setAttribute("dessert_name", dessert_name);
			sc.setAttribute("date", date);
			
			return success;
		}
	}
