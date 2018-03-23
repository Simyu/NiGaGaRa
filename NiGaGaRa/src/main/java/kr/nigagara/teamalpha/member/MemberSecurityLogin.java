package kr.nigagara.teamalpha.member;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
@Service
public class MemberSecurityLogin implements UserDetailsService{
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Map<String, Object> user = sqlsession.selectOne("nigagara.member.securityLogin",username);
		UserDetails loginUser = null;
		System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTT");
		
		List<GrantedAuthority> gaslist = new ArrayList<GrantedAuthority>();
		gaslist.add(new SimpleGrantedAuthority(user.get("AUTHORITY").toString()));
		
		loginUser = new MemberSecurityVO(user.get("USERNAME").toString(),user.get("PASSWORD").toString(),true,true,true,true,
				gaslist,user.get("MEM_NAME").toString(),user.get("MEM_BIRTH").toString(),user.get("MEM_ZIPCODE").toString(),
				user.get("MEM_ADDR").toString(),user.get("MEM_ADDR_DETAIL").toString(),user.get("MEM_STATE").toString(),
				user.get("MEM_GENDER").toString(),user.get("MEM_PHONE").toString(),user.get("MEM_EMAIL").toString(),
				(Integer)user.get("POINT_TOTAL"),user.get("AUTHORITY").toString(),user.get("MEM_ACCOUNT").toString(),
				user.get("MEM_IMG").toString(),user.get("MEM_LATI").toString(),user.get("MEM_LONGI").toString(),
				user.get("BANK_CODE").toString());
		System.out.println("loginUser=========>"+loginUser);
		return loginUser;
	}

}
