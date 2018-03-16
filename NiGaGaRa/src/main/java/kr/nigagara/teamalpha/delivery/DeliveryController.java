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
	
	@RequestMapping("/delivery/list.do")
	public ModelAndView list(MemberVO memId) {
		ModelAndView mav = new ModelAndView();
		List<DeliveryVO> list = service.list(memId);
		mav.addObject("dellist",list);
		mav.setViewName("delivery/list");
		return mav;
	}
	@RequestMapping("/delivery/select.do")
	public ModelAndView selecy(Integer deliveryNum) {
		ModelAndView mav = new ModelAndView();
		DeliveryVO vo = service.select(deliveryNum);
		mav.addObject("delivery",vo);
		mav.setViewName("delivery/select");
		return mav;
	}
	//qr리더기
	@RequestMapping(value = "/delivery/qrread.do", method = RequestMethod.GET)
	public String qrread() {
		
		System.out.println("qrread view");
		
		return "delivery_qrread";
	}
}
