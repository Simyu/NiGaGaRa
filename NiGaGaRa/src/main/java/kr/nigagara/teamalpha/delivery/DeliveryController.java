
package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class DeliveryController {
	
	@Autowired
	DeliveryService service;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/delivery/start.do", method = RequestMethod.GET)
	public String start() {
		
	
		return "delivery_start";
	}
	

	
	@RequestMapping(value="delivery/list.do", method=RequestMethod.GET)
	public ModelAndView list(String delivery_Man) {
		ModelAndView mav = new ModelAndView();
		System.out.println(delivery_Man);
		List<DeliveryVO> deliverylist = service.list(delivery_Man);
		System.out.println();
		mav.addObject("deliverylist",deliverylist);
		mav.setViewName("delivery/list");
		return mav;
	}

	
}
