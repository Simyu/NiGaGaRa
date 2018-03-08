package kr.nigagara.teamalpha.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	@Qualifier("memdao")
	MemberDAO dao;

	@Override
	public int insert(MemberVO member) {

		return dao.insert(member);
	}

	@Override
	public MemberVO login(String id, String pass) {
		MemberVO vo = dao.login(id, pass);
		System.out.println("MemberServiceImpl = >"+vo);
//		return dao.login(id, pass);
		return vo;
	}

}
