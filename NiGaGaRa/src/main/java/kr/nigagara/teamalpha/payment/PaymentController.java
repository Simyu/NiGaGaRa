package kr.nigagara.teamalpha.payment;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PaymentController {
	
	@RequestMapping(value = "/payment/list.do", method = RequestMethod.GET)
	public String showList() {
		return "payment/list";
	}

}
