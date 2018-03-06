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
		System.out.println("MemberServiceImpl : "+member+"\n");
		
		return dao.insert(member);
	}

}
