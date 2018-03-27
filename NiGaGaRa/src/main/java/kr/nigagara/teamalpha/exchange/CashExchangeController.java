package kr.nigagara.teamalpha.exchange;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CashExchangeController {
	@Autowired
	CashExchangeService service;

	@RequestMapping(value = "/exchange/deposit.do", method = RequestMethod.POST)
	public String deposit(String point, String id) {
		service.insert(id, point, "환전");
		service.pay(id, point);
		return "redirect:/payment_list.do?mem_id=" + id;
	}

}
