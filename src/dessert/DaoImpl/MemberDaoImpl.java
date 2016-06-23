package dessert.DaoImpl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;

import dessert.DAO.BaseDao;
import dessert.DAO.MemberDao;
import dessert.hibernate3.support.YeekuHibernateDaoSupport;
import dessert.model.Member;
import dessert.model.Recharge;


public class MemberDaoImpl extends YeekuHibernateDaoSupport implements MemberDao {
	@Autowired
	private BaseDao baseDao;
	
	public BaseDao getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao baseDao) {
		this.baseDao = baseDao;
	}

	@Override
	public Member addMember(Member member) {
	Member m=new Member();
	baseDao.save(member);
	m=this.getMemberById(member.getMid());
	return m;
	}

	@Override
	public boolean checkByIdAndPassword(Member member) {
	Member m=(Member)baseDao.load(Member.class, member.getMid());
	if(m==null){
		return false;
	}
	System.out.println(m.getPassword());
	if(m.getPassword().equals(member.getPassword()))return true;
	else return false;
	}

	@Override
	public Member getMemberById(int mid) {
		Member m=(Member)baseDao.load(Member.class,mid);
		return m;
	}

	@Override
	public String getNameById(int mid) {
		Member m=(Member)baseDao.load(Member.class,mid);
		if(m==null){
			return "";
			
		}else{
			return m.getUsername();
		}
			
	}

	@Override
	public List<Member> getMemberByTel(String phone) {
		Member m = null;
		String hql = "from dessert.model.Member where phone ='"+phone+"'";
		Session session = baseDao.getNewSession();
		List<Member> ml = session.createQuery(hql).list();
		
		return ml;
	}

	@Override
	public List<Recharge> getRechargeById(int mid) {
		String hql = "from dessert.model.Recharge where mid ='"+mid+"'";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

	

	@Override
	public boolean updateMember(Member member) {
		baseDao.update(member);
		return true;
	}

	@Override
	public List<Member> getAllMembers() {
		String hql = "from dessert.model.Member";
		Session session = baseDao.getNewSession();
		return session.createQuery(hql).list();
	}

}
