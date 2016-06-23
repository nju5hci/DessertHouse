package dessert.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import dessert.DAO.AssessDao;
import dessert.DAO.DessertDao;
import dessert.DAO.MemberCardDao;
import dessert.DAO.MemberDao;
import dessert.DAO.ReserveDao;
import dessert.configure.Configure;
import dessert.model.Assess;
import dessert.model.Member;
import dessert.model.MemberCard;
import dessert.model.Recharge;
import dessert.model.Reserve;

import dessert.service.MemberService;

public class MemberServiceImpl implements MemberService{
	private  MemberDao memberDao;
	private DessertDao dessertDao;
	private MemberCardDao memberCardDao;
	private ReserveDao reserveDao;
	
	private AssessDao assessDao;
	

	public void setAssessDao(AssessDao assessDao) {
		this.assessDao = assessDao;
	}

	public void setReserveDao(ReserveDao reserveDao) {
		this.reserveDao = reserveDao;
	}

	public void setMemberCardDao(MemberCardDao memberCardDao) {
		this.memberCardDao = memberCardDao;
	}

	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	public DessertDao getDessertDao() {
		return dessertDao;
	}

	public void setDessertDao(DessertDao dessertDao) {
		this.dessertDao = dessertDao;
	}

	

	@Override
	public Member registerMember(Member member) {
		Member m=new 	Member();
		MemberCard memberCard=new MemberCard();
		int account = 0;
		do{
			Random r = new Random(); 
			account = r.nextInt(99999999);
		}while(account>10000000&&memberDao.getNameById(account).equals(""));
		
		member.setMid(account);
		memberCard.setMid(account);
		memberCard.setLevel(Configure.NO_LEVEL);
		memberCard.setStatus(Configure.CARD_STOP);
	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		String time = df.format(new Date());// new Date()为获取当前系统时间
		memberCard.setOpenDate(time);
		memberCard.setPoint(0);
		memberCard.setMoney(0);
		memberCardDao.openCard(memberCard);
		m = memberDao.addMember(member);
		
		
		return m;
	}

	@Override
	public boolean checkLogin(Member member) {
		return memberDao.checkByIdAndPassword(member);
	}

	@Override
	public List<Recharge> getRechargeById(int mid) {
		return memberDao.getRechargeById(mid);
	}


	@Override
	public void updateInfo(Member member) {
		memberDao.updateMember(member);
		
	}

	@Override
	public Member checkInfo(int mid) {
		return memberDao.getMemberById(mid);
	}

	@Override
	public boolean setBank(String bankid,int mid,String password) {
		Member m=memberDao.getMemberById(mid);
		if(m.getPassword().equals(password)){
			m.setBankid(bankid);
			return memberDao.updateMember(m);
		}else{
			return false;
		}
	}

	@Override
	public boolean hasBank(int mid) {
		Member m=checkInfo(mid);
		if((m.getBankid()==null)||(m.getBankid().equals(""))){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public boolean reserve(Reserve reserve) {
	return reserveDao.addReserve(reserve);
	}

	@Override
	public List<Reserve> getReservesByMid(int mid) {
		return reserveDao.getReserveByMemberId(mid,Configure.RESERVE_VEGETABLE);
	}

	@Override
	public List<Reserve> getBookReservesByMid(int mid) {
	
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_BOOK,Configure.RESERVE_VEGETABLE);
	}

	@Override
	public List<Reserve> getPayReservesByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_PAY,Configure.RESERVE_VEGETABLE);
	}

	@Override
	public List<Reserve> getReceivedReservesByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_RECEIVED,Configure.RESERVE_VEGETABLE);
	}

	@Override
	public List<Reserve> getAssessReservesByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_ASSESSED,Configure.RESERVE_VEGETABLE);
	}

	@Override
	public void buy(int reserveid) {
		Reserve reserve = reserveDao.getReserveById(reserveid);
		reserve.setState(Configure.RESERVE_PAY);
		reserveDao.updateState(reserve);
		
	}

	@Override
	public void receive(int reserveid) {
		Reserve reserve = reserveDao.getReserveById(reserveid);
		reserve.setState(Configure.RESERVE_RECEIVED);
		reserveDao.updateState(reserve);
		
	}

	@Override
	public void assess(int reserveid) {
		Reserve reserve = reserveDao.getReserveById(reserveid);
		reserve.setState(Configure.RESERVE_ASSESSED);
		reserveDao.updateState(reserve);
		
	}

	@Override
	public void cancel(int reserveid) {
		Reserve reserve=reserveDao.getReserveById(reserveid);
		reserve.setState(Configure.RESERVE_CANCEL);
		reserveDao.updateState(reserve);
		
	}

	@Override
	public Reserve getReserveById(int rid) {
		// TODO Auto-generated method stub
		return reserveDao.getReserveById(rid);
	}

	@Override
	public void addAssess(Assess assess) {
		assessDao.addAssesst(assess);
	}

	@Override
	public Reserve getReservesByid(int reserveid) {
		return reserveDao.getReserveById(reserveid);
	}

	@Override
	public List<Reserve> getBookReservesActivityByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_BOOK,Configure.RESERVE_ACTIVITY);

	}

	@Override
	public List<Reserve> getPayReservesActivityByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_PAY,Configure.RESERVE_ACTIVITY);

	}

	@Override
	public List<Reserve> getReceivedReservesActivityByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_RECEIVED,Configure.RESERVE_ACTIVITY);

	}

	@Override
	public List<Reserve> getAssessReservesActivityByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_ASSESSED,Configure.RESERVE_ACTIVITY);

	}

	@Override
	public List<Reserve> getBookReservesSoilByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_BOOK,Configure.RESERVE_SOIL);

	}

	@Override
	public List<Reserve> getPayReservesSoilByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_PAY,Configure.RESERVE_SOIL);

	}

	@Override
	public List<Reserve> getReceivedReservesSoilByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_RECEIVED,Configure.RESERVE_SOIL);

	}

	@Override
	public List<Reserve> getAssessReservesSoilByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_ASSESSED,Configure.RESERVE_SOIL);

	}

	@Override
	public List<Reserve> getBookReservesGiftByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_BOOK,Configure.RESERVE_GIFT);

	}

	@Override
	public List<Reserve> getReceivedReservesGiftByMid(int mid) {
		return reserveDao.getReserveByMemberIdAndState(mid, Configure.RESERVE_RECEIVED,Configure.RESERVE_GIFT);

	}

	@Override
	public void delete(int reserveid) {
		Reserve reserve=reserveDao.getReserveById(reserveid);
		reserve.setState(Configure.RESERVE_DELETE);
		reserveDao.updateState(reserve);
		
	}

}
