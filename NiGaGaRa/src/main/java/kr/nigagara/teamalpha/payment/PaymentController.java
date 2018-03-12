package kr.nigagara.teamalpha.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentController {
	@Autowired
	PaymentService service;

	@RequestMapping(value = "/payment/list.do", method = RequestMethod.GET)
	public String showList(int payment_num) {
		ModelAndView mav = new ModelAndView();
		List<PaymentVO> paymentlist = service.paymentlist(payment_num);
		mav.addObject("paymentlist", paymentlist);
		mav.setViewName("payment/list");
		return "payment/list";
	}

	@RequestMapping(value = "/payment/insert.do", method = RequestMethod.GET)
	public String showPage() {
		return "payment/insert";
	}
}
