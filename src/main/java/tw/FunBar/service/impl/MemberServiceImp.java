package tw.FunBar.service.impl;

import java.sql.Blob;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import tw.FunBar.dao.MemberDAO;
import tw.FunBar.model.Member;
import tw.FunBar.service.MemberService;
@Service
@Transactional
public class MemberServiceImp implements MemberService {
	
	MemberDAO dao;

	@Autowired
	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}

	@Override
	public List<Member> getAllmembers() {
		 
		return dao.getAllmembers();
	}	
	

	@Override
	public void saveMember(Member mb) {
		dao.saveMember(mb);
		
	}

	@Override
	public void delete(int id) {
		dao.delete(id);
	}

	

	
	
	@Override
	public Member signin(String memberId, String memberPwd) {
		
		return dao.signin(memberId, memberPwd);
	}

	@Override
	public Member checkuser(String memberId, String memberPwd) {
		
		return dao.checkuser(memberId, memberPwd);
	}

	@Override
	public Member showMan(int id) {
		
		return dao.showMan(id);
	}
	@Override
	public Member getONEmember(int id) {
		
		return dao.getONEmember(id);
	}

	@Override
	public void levelup(int memberLevel, int id) {
	
		dao.levelup(memberLevel, id);
	}

	@Override
	public void updateself(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			 String memberEmail, Blob blob) {
		dao.updateself(id, memberName, memberAddress, memberBirth, memberPhone, memberEmail, blob);
		
	}
	

	@Override
	public Member forget(String memberId) {
		
		return dao.forget(memberId);
	}

	@Override
	public void newPwd(String memberId, String memberPwd) {
		dao.newPwd(memberId, memberPwd);
	}

	@Override
	public void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone, String memberId, String memberEmail, Integer memberLevel, Blob blob) {
		dao.updateMember(id, memberName, memberAddress, memberBirth, memberPhone, memberId, memberLevel, memberEmail, blob);
	}

	@Override
	public boolean checkId(String memberId) {
		return	dao.checkId(memberId);
		
	}

	@Override
	public List<Member> getMemberByName(String memberName) {
		
		return dao.getMemberByName(memberName);
	}

	@Override
	public int getMemberIndex() {
		
		return dao.getMemberIndex();
	}

	@Override
	public List<Member> getMemberByPage(Integer index) {
		
		return dao.getMemberByPage(index);
	}

	

	

	


	



	

	

	

	

}
