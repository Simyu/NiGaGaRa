package kr.nigagara.teamalpha.member;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("memdao")
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSession sqlsession;

	@Override
	public int insert(MemberVO member) {

		return sqlsession.insert("nigagara.member.insert", member);
	}

	@Override
	public MemberVO login(String id, String pass) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("MemberDAOImpl id, pass = > "+id+ pass);

		map.put("id", id);
		map.put("pass", pass);
		
//		return sqlsession.selectOne("nigagara.member.login", map);
		MemberVO vo = sqlsession.selectOne("nigagara.member.login", map);
		System.out.println("MemberDAOImpl = >"+vo);
		return vo;
	}

}
