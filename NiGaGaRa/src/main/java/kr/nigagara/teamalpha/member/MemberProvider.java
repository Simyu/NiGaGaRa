package kr.nigagara.teamalpha.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;

public class MemberProvider implements AuthenticationProvider{
	private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	@Autowired
	MemberSecurityLogin mem_login;
	
	
	@Override
	public Authentication authenticate(Authentication data) throws AuthenticationException {
		String username = data.getName();
		String mem_pw = (String) data.getCredentials();
		Object obj = data.getPrincipal();
		System.out.println("TTTTTTTTTTTTTTTTTTTTTTTTTTTTTTTT");
		User user = (User) mem_login.loadUserByUsername(username);
		
		boolean state = encoder.isPasswordValid(user.getPassword(),mem_pw,null);
		UsernamePasswordAuthenticationToken authUser = null;
		if(state) {
			authUser = new UsernamePasswordAuthenticationToken(user, mem_pw,user.getAuthorities());
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
