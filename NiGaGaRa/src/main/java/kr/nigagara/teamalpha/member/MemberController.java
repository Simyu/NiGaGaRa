package kr.nigagara.teamalpha.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Controller
public class MemberController {
	@Autowired
	MemberService service;
	@Autowired
	FileUploadLogic uploadservice;
	
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
	public String register(MemberVO member, HttpServletRequest request) throws Exception {
		System.out.println("register_post");
		MultipartFile file = member.getFile();
		String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/upload");
		
		uploadservice.upload(file, path, file.getOriginalFilename());
		member.setMemImg(file.getOriginalFilename());
		System.out.println("MemberController : "+member+"\n");
		service.insert(member);
		
		return "redirect:/member/login.do";
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
	
	@RequestMapping(value ="/member/resetpass.do", method = RequestMethod.GET)
	public String resetpass() {
		System.out.println("resetpass_get");
		
		return "resetpass";
	}
	
	@RequestMapping(value ="/member/searchid.do", method = RequestMethod.GET)
	public String searchid() {
		System.out.println("searchid_get");
		
		return "searchid";
	}
	
	@RequestMapping(value ="/member/searchid_result.do", method = RequestMethod.POST)
	public String searchid_result() {
		System.out.println("searchid_result_post");
		
		return "searchid_result";
	}
	
	@RequestMapping(value ="/member/searchpass.do", method = RequestMethod.POST)
	public String searchpass_result() {
		System.out.println("searchpass_post");
		
		return "#";
	}
	
	@RequestMapping(value ="/member/searchpass.do", method = RequestMethod.GET)
	public String searchpass() {
		System.out.println("searchpass_get");
		
		return "searchpass";
	}
	
	@RequestMapping(value ="/member/drop.do", method = RequestMethod.GET)
	public String drop() {
		System.out.println("drop_get");
		
		return "drop";
	}
	
}
