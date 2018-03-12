package kr.nigagara.teamalpha.member;

import java.util.List;

public interface MemberService {

	int insert(MemberVO member);

	MemberVO login(String id, String pass);

	MemberVO read(String mem_id);

	int update(String fileflag, MemberVO member);

	boolean idCheck(String id);

	int drop(String id);

	List<String> searchid(String email);

}
