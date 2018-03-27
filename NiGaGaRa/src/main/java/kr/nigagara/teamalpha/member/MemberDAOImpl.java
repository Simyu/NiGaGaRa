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


import kr.nigagara.teamalpha.member.security.MemberSecurityVO;

@Repository("memdao")
public class MemberDAOImpl implements MemberDAO, UserDetailsService {
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
	public int update(MemberVO member) {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("member", member);

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
		System.out.println("MemberDAOImpl=>" + map);
		return sqlsession.update("nigagara.member.resetpass", map);
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		System.out.println(".....loadUserByUsername" + username);
		Map<String, Object> user = sqlsession.selectOne("nigagara.member.securityLogin", username);
		System.out.println(user + "TTTTTTTTTTTT");
		UserDetails loginUser = null;
		List<GrantedAuthority> gaslist = new ArrayList<GrantedAuthority>();
		gaslist.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));

		// System.err.println("loadUserByUsername ==> "+gaslist);
		loginUser = new MemberSecurityVO(user.get("USERNAME").toString(), user.get("PASSWORD").toString(), gaslist,
				user.get("MEM_NAME").toString(), user.get("MEM_BIRTH").toString(), user.get("MEM_ZIPCODE").toString(),
				user.get("MEM_ADDR").toString(), user.get("MEM_ADDR_DETAIL").toString(),
				user.get("MEM_GENDER").toString(), user.get("MEM_PHONE").toString(), user.get("MEM_EMAIL").toString(),
				user.get("POINT_TOTAL").toString(), user.get("MEM_ACCOUNT").toString(), user.get("MEM_IMG").toString(),
				user.get("MEM_LATI").toString(), user.get("MEM_LONGI").toString(), user.get("MEM_EVAL").toString(),
				user.get("MEM_BANK_CODE").toString(), user.get("MEM_STATE").toString(),
				user.get("AUTHORITY").toString());

		System.out.println("loginUser==========>" + loginUser);
		return loginUser;
	}

	@Override
	public int resetpass(String mem_id, String newpass) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", mem_id);
		map.put("newpass", newpass);
		
		return sqlsession.update("nigagara.member.updatepass", map);
	}

	@Override
	public List<MemberVO> list() {
		List<MemberVO> list = sqlsession.selectList("nigagara.member.memberlist");		
		return list;
	}

}
