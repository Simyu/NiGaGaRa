package kr.nigagara.teamalpha.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memdao")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlsession;

	@Override
	public int insert(MemberVO member) {
		System.out.println("MemberDAOImpl : "+member+"\n");
		
		return sqlsession.insert("nigagara.member.insert", member);
	}

}
