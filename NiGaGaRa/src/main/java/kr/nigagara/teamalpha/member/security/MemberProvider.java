package kr.nigagara.teamalpha.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;

import kr.nigagara.teamalpha.member.MemberDAOImpl;

public class MemberProvider implements AuthenticationProvider{
	@Autowired
	@Qualifier("memdao")
	MemberDAOImpl dao;
	private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	
	
	@Override
	public Authentication authenticate(Authentication data) throws AuthenticationException {
		System.out.println(data.getName());
		String username = data.getName();
		System.out.println(username);
		String password = (String) data.getCredentials();
		/*System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");*/
		MemberSecurityVO user =  (MemberSecurityVO) dao.loadUserByUsername(username);
		
		boolean state = encoder.isPasswordValid(user.getPassword(),password,null);
		UsernamePasswordAuthenticationToken authUser = null;
		
		System.out.println("authenticate==>"+user);
		
		if (!user.getMem_state().equals("0")) {
			state = false;
		}
		
		if(state) {
			authUser = new UsernamePasswordAuthenticationToken(user, password,user.getAuthorities());
			System.out.println("로그인성공");
		}else {
			System.out.println("로그인실패");
		}
		return authUser;
	}
	@Override
	public boolean supports(Class<?> arg0) {

		return true;
	}


}
