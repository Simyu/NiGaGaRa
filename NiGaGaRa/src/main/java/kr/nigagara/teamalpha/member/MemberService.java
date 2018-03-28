package kr.nigagara.teamalpha.member;

import java.util.List;

public interface MemberService {

	int insert(MemberVO member);

	MemberVO login(String id, String pass);

	MemberVO read(String mem_id);

	int update(MemberVO member);

	boolean idCheck(String id);

	int drop(String id);

	List<String> searchid(String email);

	int updatePass(String id, String email, String temppass);

	int resetpass(String mem_id, String newpass);
	
	List<MemberVO> list();

	int updateRole(String id, String role);

}
