package kr.nigagara.teamalpha.member;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class AccountController {
	@Autowired
	MemberService service;
	
	@RequestMapping(value = "/account.do",method=RequestMethod.POST)
	public @ResponseBody String accountchk() {
		String addr = "https://testapi.open-platform.or.kr";
		String client_id = "l7xx4542423c4fac41b18abd22d39d99c3cf";
		String client_secret = "1b3efbffaaa645ad86a0bfc0f01dcd14";
		String client_info = "[test] whatever you want";
		
		
		
		return "account";
		
	}
}
