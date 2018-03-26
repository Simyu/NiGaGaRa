package kr.nigagara.teamalpha.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private String mem_id;

	private String mem_pw;

	private String mem_name;

	private String mem_birth;

	private String mem_zipcode;

	private String mem_addr;

	private String mem_addr_detail;

	private String mem_gender;

	private String mem_phone;

	private String mem_email;

	private String point_total;

	private String mem_account;

	private String mem_img;

	private String mem_lati;

	private String mem_longi;
	
	private String mem_eval;
	
	private String mem_bank_code;

	private String mem_state;
	
	private String role;
	
	private MultipartFile file;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public String getMem_id() {
		return mem_id;
	}

	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMem_pw() {
		return mem_pw;
	}

	public void setMem_pw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMem_name() {
		return mem_name;
	}

	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}

	public String getMem_birth() {
		return mem_birth;
	}

	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}

	public String getMem_zipcode() {
		return mem_zipcode;
	}

	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}

	public String getMem_addr() {
		return mem_addr;
	}

	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}

	public String getMem_addr_detail() {
		return mem_addr_detail;
	}

	public void setMem_addr_detail(String mem_addr_detail) {
		this.mem_addr_detail = mem_addr_detail;
	}

	public String getMem_gender() {
		return mem_gender;
	}

	public void setMem_gender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMem_phone() {
		return mem_phone;
	}

	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMem_email() {
		return mem_email;
	}

	public void setMem_email(String mem_email) {
		this.mem_email = mem_email;
	}

	public String getPoint_total() {
		return point_total;
	}

	public void setPoint_total(String point_total) {
		this.point_total = point_total;
	}

	public String getMem_account() {
		return mem_account;
	}

	public void setMem_account(String mem_account) {
		this.mem_account = mem_account;
	}

	public String getMem_img() {
		return mem_img;
	}

	public void setMem_img(String mem_img) {
		this.mem_img = mem_img;
	}

	public String getMem_lati() {
		return mem_lati;
	}

	public void setMem_lati(String mem_lati) {
		this.mem_lati = mem_lati;
	}

	public String getMem_longi() {
		return mem_longi;
	}

	public void setMem_longi(String mem_longi) {
		this.mem_longi = mem_longi;
	}

	public String getMem_eval() {
		return mem_eval;
	}

	public void setMem_eval(String mem_eval) {
		this.mem_eval = mem_eval;
	}

	public String getMem_bank_code() {
		return mem_bank_code;
	}

	public void setMem_bank_code(String mem_bank_code) {
		this.mem_bank_code = mem_bank_code;
	}

	public String getMem_state() {
		return mem_state;
	}

	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "MemberVO [mem_id=" + mem_id + ", mem_pw=" + mem_pw + ", mem_name=" + mem_name + ", mem_birth="
				+ mem_birth + ", mem_zipcode=" + mem_zipcode + ", mem_addr=" + mem_addr + ", mem_addr_detail="
				+ mem_addr_detail + ", mem_gender=" + mem_gender + ", mem_phone=" + mem_phone + ", mem_email="
				+ mem_email + ", point_total=" + point_total + ", mem_account=" + mem_account + ", mem_img=" + mem_img
				+ ", mem_lati=" + mem_lati + ", mem_longi=" + mem_longi + ", mem_eval=" + mem_eval + ", mem_bank_code="
				+ mem_bank_code + ", mem_state=" + mem_state + ", role=" + role + ", file=" + file + "]";
	}

	
	
}
