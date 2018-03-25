package kr.nigagara.teamalpha.member.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.User;

import kr.nigagara.teamalpha.member.MemberDAOImpl;

public class MemberProvider implements AuthenticationProvider{
	@Autowired
	@Qualifier("memdao")
	MemberDAOImpl securityService;
	//private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	
	
	@Override
	public Authentication authenticate(Authentication data) throws AuthenticationException {
		String username = data.getName();
		String password = (String) data.getCredentials();
		/*System.out.println(username+password+obj);*/
		User user = (User) securityService.loadUserByUsername(username);
		
		//boolean state = encoder.isPasswordValid(user.getPassword(),password,null);
		/*System.out.println("================"+state);*/
		UsernamePasswordAuthenticationToken authUser = null;
//		if(state) {
			authUser = new UsernamePasswordAuthenticationToken(user, password,user.getAuthorities());
//			System.out.println("로그인성공");
//		}else {
//			System.out.println("로그인실패");
//		}
		return authUser;
	}
	@Override
	public boolean supports(Class<?> arg0) {

		return true;
	}


}
