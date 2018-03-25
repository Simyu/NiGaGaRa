package kr.nigagara.teamalpha.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


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
		System.out.println("MemberDAOImpl id, pass = > " + id + pass);

		map.put("id", id);
		map.put("pass", pass);

		// return sqlsession.selectOne("nigagara.member.login", map);
		MemberVO vo = sqlsession.selectOne("nigagara.member.login", map);
		System.out.println("MemberDAOImpl = >" + vo);
		return vo;
	}

	@Override
	public MemberVO read(String mem_id) {

		return sqlsession.selectOne("nigagara.member.read", mem_id);
	}

	@Override
	public int update(String fileflag, MemberVO member) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("member", member);
		map.put("fileflag", fileflag);

		return sqlsession.update("nigagara.member.update", map);
	}

	@Override
	public int drop(String mem_id) {
		return sqlsession.update("nigagara.member.drop", mem_id);
	}

	@Override
	public List<String> searchid(String mem_email) {

		List<String> list = sqlsession.selectList("nigagara.member.searchid", mem_email);
		System.out.println(list);
		return list;
	}

	@Override
	public int updatePass(String id, String email, String temppass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("temppass", temppass);
		map.put("email", email);
		System.out.println("MemberDAOImpl=>"+map);
		return sqlsession.update("nigagara.member.resetpass", map);
	}

}
