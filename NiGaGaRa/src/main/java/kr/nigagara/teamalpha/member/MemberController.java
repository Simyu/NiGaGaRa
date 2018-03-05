package kr.nigagara.teamalpha.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
	public String login_view() {
		System.out.println("login_get");
		
		return "login";
	}
	
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public String login() {
		System.out.println("login_post");
		
		return "index";
	}
	
	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public String register_view() {
		System.out.println("register_get");
		
		return "register";
	}
	
	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String register() {
		System.out.println("register_post");
		
		return "redirect: /member/login.do";
	}
	
	@RequestMapping(value ="/member/profile.do", method = RequestMethod.GET)
	public String profile() {
		System.out.println("profile_get");
		
		return "profile";
	}
	
	@RequestMapping(value ="/member/modify.do", method = RequestMethod.GET)
	public String modify() {
		System.out.println("modify_get");
		
		return "modify";
	}
	
}
