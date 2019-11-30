package tw.FunBar.dao;


import java.sql.Blob;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import tw.FunBar.model.Member;
import tw.FunBar.model.ProductBean;

public interface MemberDAO {
	List<Member> getAllmembers();

	Member getONEmember(int id);
	
	Member showMan(int id);

	void delete(int id);

	void updateMember(int id, String memberName, String memberAddress, String memberBirth, String memberPhone, String memberId,Integer memberLevel, String memberEmail,Blob blob);

	void updateself(int id, String memberName, String memberAddress, String memberBirth, String memberPhone,
			 String memberEmail,Blob blob);
	
	Member signin (String memberId,String memberPwd);
	
	void saveMember(Member mb);
	//check level
	
	void levelup(int memberLevel,int id);
	
	Member forget(String memberId);
	
	void newPwd(String memberId,String memberPwd);
	
	boolean checkId(String memberId);
	
	List<Member> getMemberByName(String memberName);//模糊查詢
	
	int getMemberIndex();//分頁
	
	List<Member> getMemberByPage(Integer index);
	
	
	
	
	
	
	
	
	
	
	
	
	
	//沒屁用
		Member  checkuser (String memberId,String memberPwd);
		void stateup(int memberLevel);
}