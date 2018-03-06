package kr.nigagara.teamalpha.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private String memId;

	private String memPw;

	private String memName;

	private String memBirth;

	private String memZipcode;

	private String memAddr;

	private String memAddrDetail;

	private String memState;

	private String memGender;

	private String memPhone;

	private String memEmail;

	private Integer pointTotal;

	private String memType;

	private String memAccount;

	private String memImg;
	
	private MultipartFile file;

	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String memId, String memPw, String memName, String memBirth, String memZipcode, String memAddr,
			String memAddrDetail, String memState, String memGender, String memPhone, String memEmail,
			Integer pointTotal, String memType, String memAccount, String memImg, MultipartFile file) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memBirth = memBirth;
		this.memZipcode = memZipcode;
		this.memAddr = memAddr;
		this.memAddrDetail = memAddrDetail;
		this.memState = memState;
		this.memGender = memGender;
		this.memPhone = memPhone;
		this.memEmail = memEmail;
		this.pointTotal = pointTotal;
		this.memType = memType;
		this.memAccount = memAccount;
		this.memImg = memImg;
		this.file = file;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemBirth() {
		return memBirth;
	}

	public void setMemBirth(String memBirth) {
		this.memBirth = memBirth;
	}

	public String getMemZipcode() {
		return memZipcode;
	}

	public void setMemZipcode(String memZipcode) {
		this.memZipcode = memZipcode;
	}

	public String getMemAddr() {
		return memAddr;
	}

	public void setMemAddr(String memAddr) {
		this.memAddr = memAddr;
	}

	public String getMemAddrDetail() {
		return memAddrDetail;
	}

	public void setMemAddrDetail(String memAddrDetail) {
		this.memAddrDetail = memAddrDetail;
	}

	public String getMemState() {
		return memState;
	}

	public void setMemState(String memState) {
		this.memState = memState;
	}

	public String getMemGender() {
		return memGender;
	}

	public void setMemGender(String memGender) {
		this.memGender = memGender;
	}

	public String getMemPhone() {
		return memPhone;
	}

	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public Integer getPointTotal() {
		return pointTotal;
	}

	public void setPointTotal(Integer pointTotal) {
		this.pointTotal = pointTotal;
	}

	public String getMemType() {
		return memType;
	}

	public void setMemType(String memType) {
		this.memType = memType;
	}

	public String getMemAccount() {
		return memAccount;
	}

	public void setMemAccount(String memAccount) {
		this.memAccount = memAccount;
	}

	public String getMemImg() {
		return memImg;
	}

	public void setMemImg(String memImg) {
		this.memImg = memImg;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "MemberVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memBirth=" + memBirth
				+ ", memZipcode=" + memZipcode + ", memAddr=" + memAddr + ", memAddrDetail=" + memAddrDetail
				+ ", memState=" + memState + ", memGender=" + memGender + ", memPhone=" + memPhone + ", memEmail="
				+ memEmail + ", pointTotal=" + pointTotal + ", memType=" + memType + ", memAccount=" + memAccount
				+ ", memImg=" + memImg + ", file=" + file + "]";
	}


}
