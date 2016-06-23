package dessert.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import dessert.DAO.MemberCardDao;
import dessert.DAO.RechargeDao;
import dessert.configure.Configure;
import dessert.model.Dessert;
import dessert.model.MemberCard;
import dessert.model.Recharge;
import dessert.service.MemberCardService;


public class MemberCardServiceImpl implements MemberCardService{
	private MemberCardDao memberCardDao;
	private RechargeDao rechargeDao;
	
	public void setRechargeDao(RechargeDao rechargeDao) {
		this.rechargeDao = rechargeDao;
	}

	public void setMemberCardDao(MemberCardDao memberCardDao) {
		this.memberCardDao = memberCardDao;
	}

	@Override
	public boolean recharge(int mid,String password,int money) {
		MemberCard m = memberCardDao.getMemeberCardById(mid);
	//	m.setAllcost(m.getAllcost()+money);
		if(m.getMoney()==0){
			m.setMoney(money);
			if(m.getMoney()>Configure.OPEN_MONEY){
				m.setStatus(Configure.CARD_ING);
			}
			if(m.getMoney()>Configure.LEVELONE_MONEY){
				m.setLevel(1);
			}
			if(m.getMoney()>Configure.LEVELTWO_MONEY){
				m.setLevel(2);
			}
			if(m.getMoney()>Configure.LEVELTHREE_MONEY){
				m.setLevel(3);
			}
		}else{
		m.setMoney(m.getMoney()+money);
		if(m.getMoney()>Configure.LEAST_MONEY){
			m.setStatus(Configure.CARD_ING);
		}
		if(m.getMoney()>Configure.LEVELONE_MONEY){
			m.setLevel(1);
		}
		if(m.getMoney()>Configure.LEVELTWO_MONEY){
			m.setLevel(2);
		}
		if(m.getMoney()>Configure.LEVELTHREE_MONEY){
			m.setLevel(3);
		}
		}
//		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
//		String time = df.format(new Date());// new Date()为获取当前系统时间
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
	
		int account = 0;
		do{
			Random r = new Random(); 
			account = r.nextInt(99999999);
		}while(account>10000000&&memberCardDao.getMemeberCardById(mid).equals(null));
		
		Recharge recharge = new Recharge(account,money,mid,time);
		rechargeDao.addRecharge(recharge);
		memberCardDao.updateMemeberCard(m);
		return true;
	}

	@Override
	public int getLevelById(int mid) {
		MemberCard m = memberCardDao.getMemeberCardById(mid);
         return m.getLevel();
	}

	@Override
	public int getStatusById(int mid) {
		MemberCard m = memberCardDao.getMemeberCardById(mid);
		return m.getStatus();
	}

	@Override
	public void cancelMyself(int mid) {
		MemberCard m = memberCardDao.getMemeberCardById(mid);
		m.setStatus(Configure.CARD_FAIL);
		memberCardDao.updateMemeberCard(m);
	}

	@Override
	public boolean checkTime(int mid) {
		MemberCard m=memberCardDao.getMemeberCardById(mid);
		String stratDate=m.getOpenDate();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
	    boolean isover=Configure.overOneYer(stratDate, time);
	    if(isover&&m.getMoney()<=0){
	    	m.setStatus(Configure.CARD_STOP);
	    	memberCardDao.updateMemeberCard(m);
	    	return true;
	    }else{
	    	return false;
	    }
		
	}

	@Override
	public boolean checkMoney(int mid) {
		MemberCard m=memberCardDao.getMemeberCardById(mid);
		
		if(m.getMoney()>0){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int getPoint(int mid) {
		MemberCard m=memberCardDao.getMemeberCardById(mid);
		return m.getPoint();	
	}

	@Override
	public boolean changePointToMoneyt(int mid, int point) {
		MemberCard m=memberCardDao.getMemeberCardById(mid);
		if(point>m.getPoint()||point<Configure.POINT_MONEY){
			return false;
		}else{
			int money=point/Configure.POINT_MONEY;
			m.setMoney(m.getMoney()+money);
			m.setPoint(m.getPoint()-point);
			memberCardDao.updateMemeberCard(m);
			return true;
		}
	}

	@Override
	public boolean bookDessert(int mid, ArrayList<Dessert> desserts) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean buyDessert(int mid, ArrayList<Dessert> desserts) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MemberCard getCardById(int mid) {
		return memberCardDao.getMemeberCardById(mid);
	}

	@Override
	public MemberCard updateCard(MemberCard memberCard) {
		return memberCardDao.updateMemeberCard(memberCard);
	}


}
