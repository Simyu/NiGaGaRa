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
		mav.addObject("dellist", list);
		mav.setViewName("delivery/list");
		return mav;
	}

	@RequestMapping("/delivery/select.do")
	public ModelAndView select(Integer deliveryNum) {
		ModelAndView mav = new ModelAndView();
		DeliveryVO vo = service.select(deliveryNum);
		mav.addObject("delivery", vo);
		mav.setViewName("delivery/select");
		return mav;
	}

	// qr������
	@RequestMapping(value = "/delivery/qrread.do", method = RequestMethod.GET)
	public String qrread() {

		System.out.println("qrread view");

		return "delivery_qrread";
	}

	@RequestMapping(value = "/delivery/qrscan.do", method = RequestMethod.POST)
	public ModelAndView qrread(String Goods_Num) {
		System.out.println("Goods_Num=>" + Goods_Num);
		ModelAndView mav = new ModelAndView();
		DeliveryVO changeState = service.changeState(Goods_Num);
		DeliveryVO stateResult = service.stateResult(Goods_Num);//delivery_state��������
		String match_State = service.matchState(Goods_Num);
		System.out.println(match_State);
		if(match_State.equals("�����")) {
			service.matchState1(Goods_Num);
		}else if(match_State.equals("�����")){
			service.matchState2(Goods_Num);
		}
		System.out.println(stateResult);
		String msg = "";
		if (stateResult.getDelivery_State().equals("2")) {
			msg = "��� �����մϴ�.";
		}else if (stateResult.getDelivery_State().equals("3")) {
			msg = "��� �Ϸ�Ǿ����ϴ�.";
		}else {
			msg = "����� �ȵǾ��ų� �̹� �򰡱��� ó���� ��ǰ�Դϴ�.";
		}
		mav.addObject("msg", msg);
		mav.setViewName("delivery_qrresult");
		return mav;
	}
}
