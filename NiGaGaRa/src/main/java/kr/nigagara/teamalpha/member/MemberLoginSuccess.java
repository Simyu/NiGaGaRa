package kr.nigagara.teamalpha.member;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class MemberLoginSuccess implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberSecurityVO vo= (MemberSecurityVO) authentication.getPrincipal();
		String url="/NiGaGaRa/index.do";
		Collection<GrantedAuthority> authlist =  vo.getAuthorities();
		Iterator<GrantedAuthority> authlistit = authlist.iterator();
		while(authlistit.hasNext()) {
			GrantedAuthority authority = authlistit.next();
			if(authority.getAuthority().equals("ROLE_ADMIN")) {
				url="/NiGaGaRa/goods/insert.do";
			}
		}
		response.sendRedirect(url);
	}

}
