package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import kr.nigagara.teamalpha.member.MemberVO;



@Controller
public class DeliveryController {
	@Autowired
	DeliveryService service;
	
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
