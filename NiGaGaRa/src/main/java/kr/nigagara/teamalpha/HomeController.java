package kr.nigagara.teamalpha;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home() {
		
		System.out.println("�ε������");
		
		return "index";
	}
	@RequestMapping(value = "/request.do", method = RequestMethod.GET)
	public String request() {
		
		System.out.println("request view");
		
		return "request";
	}
	
}
