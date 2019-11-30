package tw.FunBar.model;

import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;


import com.fasterxml.jackson.annotation.JsonIgnoreProperties;




import com.fasterxml.jackson.annotation.JsonIgnoreProperties;


@Entity
@Table(name = "MEMBER")
public class Member {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String memberName;
	private String memberAddress;
	private String memberBirth;
	private String memberPhone;
	private String memberPwd;
	private String memberId;
	private String memberEmail;


	private int memberLevel;//0代表未激活 1代表激活
//	private String code;	//激活碼

	@JsonIgnore
	private Blob memberPic;

	public void setMemberLevel(int memberLevel) {
		this.memberLevel = memberLevel;
	}

	private String memberfileName;
	@Transient
	private MultipartFile memberimg;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberAddress() {
		return memberAddress;
	}

	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}

	public String getMemberBirth() {
		return memberBirth;
	}

	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}

	public String getMemberPhone() {
		return memberPhone;
	}

	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public int getMemberLevel() {
		return memberLevel;
	}

	public Blob getMemberPic() {
		return memberPic;
	}

	public void setMemberPic(Blob memberPic) {
		this.memberPic = memberPic;
	}

	public MultipartFile getMemberimg() {
		return memberimg;
	}

	public void setMemberimg(MultipartFile memberimg) {
		this.memberimg = memberimg;
	}

	public String getMemberfileName() {
		return memberfileName;
	}

	public void setMemberfileName(String memberfileName) {
		this.memberfileName = memberfileName;
	}

}
