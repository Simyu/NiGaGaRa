package kr.nigagara.teamalpha.delivery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DeliveryController {
	
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/delivery/start.do", method = RequestMethod.GET)
	public String start() {
		
	
		return "delivery_start";
	}
	
}
