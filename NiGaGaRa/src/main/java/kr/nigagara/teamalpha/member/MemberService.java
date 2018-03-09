package kr.nigagara.teamalpha.member;

public interface MemberService {

	int insert(MemberVO member);

	MemberVO login(String id, String pass);

}
