package kr.nigagara.teamalpha;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	

	@RequestMapping(value = "/index.do", method = RequestMethod.GET)
	public String home() {
		System.out.println("test");
		
		return "index";
	}
	@RequestMapping(value = "/request", method = RequestMethod.GET)
	public String request() {
		
		System.out.println("request view");
		
		return "request";
	}
	@RequestMapping(value = "/match.do", method = RequestMethod.POST)
	public String match() {
		
		System.out.println("match view");
		
		return "match";
	}
	@RequestMapping(value = "/payment.do", method = RequestMethod.POST)
	public String payment() {
		
		System.out.println("payment view");
		
		return "payment";
	}
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery() {
		
		System.out.println("delivery view");
		
		return "delivery";
	}
	@RequestMapping(value = "/application.do", method = RequestMethod.GET)
	public String application() {
		
		System.out.println("application view");
		
		return "application";
	}

	
}
