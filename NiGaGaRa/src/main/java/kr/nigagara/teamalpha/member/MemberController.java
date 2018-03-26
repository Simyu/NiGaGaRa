package kr.nigagara.teamalpha.member;

import java.util.Date;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
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
	private ShaPasswordEncoder encoder = new ShaPasswordEncoder(256);
	@Autowired
	MemberService service;
	@Autowired
	FileUploadLogic uploadservice;

	@RequestMapping(value = "/member/login", method = RequestMethod.GET)
	public String login_view() {
		System.out.println("login_get");

		return "login";
	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.GET)
	public String register_view() {
		System.out.println("register_get");

		return "register";
	}

	@RequestMapping(value = "/member/register.do", method = RequestMethod.POST)
	public String register(MemberVO member, HttpServletRequest request) throws Exception {
		System.out.println("register_post");

		String dbpass = encoder.encodePassword(member.getMem_pw(), null);
		member.setMem_pw(dbpass);

		MultipartFile file = member.getFile();
		String fileName = file.getOriginalFilename();
		if (!fileName.equals("")) {
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/upload");
			uploadservice.upload(file, path, fileName);
		} else {
			fileName = "avatar.png";
		}
		member.setMem_img(fileName);
		System.out.println(member);
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
		System.out.println("modify==>" + member);
		System.out.println("fileflag==>" + fileflag);
		String fileName = null;

		if (fileflag.equals("T")) {
			MultipartFile file = member.getFile();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/resources/img/upload");
			fileName = file.getOriginalFilename();
			uploadservice.upload(file, path, fileName);
		} else {
			MemberVO vo = (MemberVO) request.getSession(false).getAttribute("loginUser");
			fileName = vo.getMem_img();
		}
		member.setMem_img(fileName);

		service.update(member);

		model.addAttribute("loginUser", service.read(member.getMem_id()));

		return "redirect:/member/profile.do?mem_id=" + member.getMem_id();
	}

	@RequestMapping(value = "/member/resetpass.do", method = RequestMethod.GET)
	public String resetpassView() {
		System.out.println("resetpass_get");

		return "resetpass";
	}

	@RequestMapping(value = "/member/resetpass.do", method = RequestMethod.POST)
	public String resetpass(String password, String newpass, HttpServletRequest request) {
		System.out.println("resetpass_post");
		MemberVO vo = (MemberVO) request.getSession(false).getAttribute("loginUser");
		System.out.println(vo);

		if (vo != null) {
			if (encoder.isPasswordValid(vo.getMem_pw(), password, null)) {

				String dbpass = encoder.encodePassword(newpass, null);

				service.resetpass(vo.getMem_id(), dbpass);
				return "redirect:/member/profile.do?mem_id=" + vo.getMem_id();
			}
		}
		logout(request);
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
	public String searchpass_result(String id, String email) throws AddressException, MessagingException {
		System.out.println("searchpass_post");

		String temppass = MemberController.generateNumber(6) + "";
		String dbpass = encoder.encodePassword(temppass, null);

		if (service.updatePass(id, email, dbpass) != 0) {
			String subject = "[NiGaGaRa] 임시 비밀번호가 발급 되었습니다.";
			String body = " 안녕하세요 [NiGaGaRa] 입니다. \n발급된 임시 비밀번호는 [" + temppass + "]입니다.\n감사합니다!";

			Mail mail = new Mail(email, subject, body);
			Mailsender.sendMail(mail);
		}

		return "redirect:/member/login.do";
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
	public String drop(String pass, HttpServletRequest request) {
		MemberVO vo = (MemberVO) request.getSession(false).getAttribute("loginUser");
		if (vo != null) {
			if (encoder.isPasswordValid(vo.getMem_pw(), pass, null)) {

				service.drop(vo.getMem_id());
				logout(request);

				return "redirect:/member/login.do";
			}
		}
		return "redirect:/member/drop.do";
	}

	@RequestMapping(value = "/member/idDuplicateCheck.do", method = RequestMethod.GET)
	public @ResponseBody String idCheck(String id) {

		if (!service.idCheck(id)) {
			return "T";
		} else {
			return "F";
		}
	}

	private static int generateNumber(int length) {

		String numStr = "1";
		String plusNumStr = "1";

		for (int i = 0; i < length; i++) {
			numStr += "0";

			if (i != length - 1) {
				plusNumStr += "0";
			}
		}

		Random random = new Random(new Date().getTime());
		int result = random.nextInt(Integer.parseInt(numStr)) + Integer.parseInt(plusNumStr);

		if (result > Integer.parseInt(numStr)) {
			result = result - Integer.parseInt(plusNumStr);
		}

		return result;
	}

	@RequestMapping(value = "/member/emailchk.do", method = RequestMethod.POST)
	public @ResponseBody String numberchk(String mem_email, String number) {
		String subject = "[NiGaGaRa] 이메일을 인증해주세요";
		String body = "안녕하세요 [NiGaGaRa] 입니다. \n 이메일 인증을 위해 인증번호 [" + number + "]을 입력해 주세요. \n 감사합니다!";

		Mail mail = new Mail(mem_email, subject, body);
		try {
			Mailsender.sendMail(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
			return "다시받어";
		}
		return "인증번호 입력하세요";

	}

	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		session.invalidate();
		return "redirect:/member/login.do";
	}

}
