package kr.nigagara.teamalpha.member.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import kr.nigagara.teamalpha.member.MemberService;

public class MemberLoginSuccess implements AuthenticationSuccessHandler{
	@Autowired
	MemberService service;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		MemberSecurityVO vo= (MemberSecurityVO) authentication.getPrincipal();
		String url="/NiGaGaRa/index.do";
		Collection<GrantedAuthority> authlist =  vo.getAuthorities();
		Iterator<GrantedAuthority> authlistit = authlist.iterator();
		
//		vo.setMem_id(authentication.getName());
//		vo.setMem_pw((String)authentication.getCredentials());
		
		HttpSession ses = request.getSession();
		ses.setAttribute("loginUser", service.read(authentication.getName()));

		while(authlistit.hasNext()) {
			GrantedAuthority authority = authlistit.next();
			if(authority.getAuthority().equals("ROLE_ADMIN")) {
				url="/NiGaGaRa/member/list.do";
			}
		}
		response.sendRedirect(url);
	}

}
