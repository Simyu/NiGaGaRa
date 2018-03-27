package kr.nigagara.teamalpha.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.nigagara.teamalpha.exchange.CashExchangeVO;
import kr.nigagara.teamalpha.member.MemberVO;

@Controller
public class PaymentController {
	@Autowired
	PaymentService service;

	@RequestMapping(value = "/payment_list.do", method = RequestMethod.GET)
	public ModelAndView showList(String mem_id) {
		ModelAndView mav = new ModelAndView();

		List<CashExchangeVO> cash_exchangelist = service.cash_exchangelist(mem_id);
		List<PaymentVO> paymentlist = service.paymentlist(mem_id);
		System.out.println(cash_exchangelist);
		System.out.println(paymentlist);

		mav.addObject("cash_exchangelist", cash_exchangelist);
		mav.addObject("paymentlist", paymentlist);
		mav.setViewName("payment_list");
		return mav;
	}

	@RequestMapping(value = "/payment.do", method = RequestMethod.GET)
	public String payment() {
		System.out.println("payment view");
		return "payment";
	}

	@RequestMapping(value = "/payment_forth.do", method = RequestMethod.POST)
	public ModelAndView payment_forth(String mem_id, String cash) {
		System.out.println("mem_id=>" + mem_id + ",cash=>" + cash);
		ModelAndView mav = new ModelAndView();
		List<MemberVO> user = service.pay_user(mem_id);
		System.out.println(user);
		mav.addObject("user", user);
		mav.addObject("cash", cash);
		mav.setViewName("payment_forth");
		return mav;
	}

	@RequestMapping(value = "/payment_second.do", method = RequestMethod.GET)
	public ModelAndView payment_second(String cash, String time) {
		ModelAndView mav = new ModelAndView();
		System.out.println("cash=>" + cash + "time=>" + time);
		mav.addObject("cash", cash);
		mav.addObject("time", time);
		System.out.println("payment_second view");
		mav.setViewName("payment_second");
		return mav;
	}

	@RequestMapping(value = "/payment_third.do", method = RequestMethod.GET)
	public ModelAndView payment_third(String mem_id, String cash, String time) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mem_id=>" + mem_id);
		int payment = service.pay(mem_id, cash);
		mav.addObject("cash", cash);
		mav.addObject("time", time);
		System.out.println("payment_third view");
		mav.setViewName("payment_third");
		return mav;
	}
}
