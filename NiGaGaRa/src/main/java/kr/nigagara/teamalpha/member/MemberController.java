package kr.nigagara.teamalpha.member;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

@Controller
@SessionAttributes("loginUser")
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
	public String login(String id, String pass, Model model) {
		System.out.println("login_post");
		MemberVO vo = service.login(id, pass);
		if (vo != null && !vo.getMem_state().equals("ºñÈ°¼º")) {
			model.addAttribute("loginUser", vo);
			return "index";
		} else {
			return "login";
		}
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
		member.setMem_img(file.getOriginalFilename());
		service.insert(member);

		return "redirect:/member/login.do";
	}

	@RequestMapping(value = "/member/profile.do", method = RequestMethod.GET)
	public String profile(String mem_id, Model model) {
		System.out.println("profile_get");
		model.addAttribute("user", service.read(mem_id));
		return "profile";
	}

	@RequestMapping(value = "/member/modify.do", method = RequestMethod.POST)
	public String modify(String fileflag, MemberVO member, HttpServletRequest request, Model model) throws Exception {
		System.out.println("modify_post");
		MultipartFile file = member.getFile();
		String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/upload");

		uploadservice.upload(file, path, file.getOriginalFilename());
		member.setMem_img(file.getOriginalFilename());
		System.out.println("modify==>" + member);
		service.update(fileflag, member);

		model.addAttribute("loginUser", service.read(member.getMem_id()));

		return "redirect:/member/profile.do?mem_id=" + member.getMem_id();
	}

	@RequestMapping(value = "/member/resetpass.do", method = RequestMethod.GET)
	public String resetpass() {
		System.out.println("resetpass_get");

		return "resetpass";
	}

	@RequestMapping(value = "/member/searchid.do", method = RequestMethod.GET)
	public String searchidView() {
		System.out.println("searchid_get");

		return "searchid";
	}

	@RequestMapping(value = "/member/searchid.do", method = RequestMethod.POST)
	public String searchid(String mem_email, Model model) {
		System.out.println("searchid_post");
		System.out.println(mem_email);
		model.addAttribute("idreslist", service.searchid(mem_email));

		return "searchid_result";
	}

	@RequestMapping(value = "/member/searchpass.do", method = RequestMethod.POST)
	public String searchpass_result() {
		System.out.println("searchpass_post");

		return "#";
	}

	@RequestMapping(value = "/member/searchpass.do", method = RequestMethod.GET)
	public String searchpass() {
		System.out.println("searchpass_get");

		return "searchpass";
	}

	@RequestMapping(value = "/member/drop.do", method = RequestMethod.GET)
	public String dropView() {
		System.out.println("drop_get");

		return "drop";
	}

	@RequestMapping(value = "/member/drop.do", method = RequestMethod.POST)
	public String drop(String id) {
		service.drop(id);
		return "index";
	}

	@RequestMapping(value = "/member/idDuplicateCheck.do", method = RequestMethod.GET)
	public @ResponseBody String idCheck(String id) {

		if (!service.idCheck(id)) {
			return "1";
		} else {
			return "0";
		}

	}

}
