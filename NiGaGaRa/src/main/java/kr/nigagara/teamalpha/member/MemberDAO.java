package kr.nigagara.teamalpha.member;

public interface MemberDAO {

	int insert(MemberVO member);

	MemberVO login(String id, String pass);

}
