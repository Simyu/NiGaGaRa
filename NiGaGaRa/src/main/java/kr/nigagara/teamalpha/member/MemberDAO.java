package kr.nigagara.teamalpha.member;

import java.util.List;

public interface MemberDAO {

	int insert(MemberVO member);

	MemberVO login(String id, String pass);

	MemberVO read(String mem_id);

	int update(String fileflag, MemberVO member);

	int drop(String mem_id);

	List<String> searchid(String email);

	int updatePass(String id, String email, String temppass);

}
