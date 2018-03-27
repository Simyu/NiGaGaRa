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
		
		return "index";
	}
	@RequestMapping(value = "/request.do", method = RequestMethod.GET)
	public String request() {
		
		return "request";
	}
	@RequestMapping(value = "/match.do", method = RequestMethod.POST)
	public String match() {
		
		return "match";
	}
	@RequestMapping(value = "/delivery.do", method = RequestMethod.GET)
	public String delivery() {
		
		return "delivery";
	}
	@RequestMapping(value = "/application.do", method = RequestMethod.GET)
	public String application() {
		
		return "application";
	}

	
}
