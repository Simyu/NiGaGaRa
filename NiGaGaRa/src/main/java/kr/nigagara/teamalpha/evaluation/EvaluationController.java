package kr.nigagara.teamalpha.evaluation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.nigagara.teamalpha.delivery.DeliveryVO;
import kr.nigagara.teamalpha.member.MemberVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class EvaluationController {
	@Autowired // 자동으로 객체 매핑!
	EvaluationService service;

	@RequestMapping(value = "evaluation.do", method = RequestMethod.GET)
	public ModelAndView eval(String goods_Num) {
		ModelAndView mav = new ModelAndView();
		List<MemberVO> evalDetail = service.evalDetail(goods_Num);
		System.out.println(goods_Num + "=>" + evalDetail);
		mav.addObject("goods_Num", goods_Num);
		mav.addObject("evalDetail", evalDetail);
		mav.setViewName("evaluation");
		return mav;
	}

	@RequestMapping(value = "evalInsert.do", method = RequestMethod.POST)
	public ModelAndView evalInsert(EvaluationVO EvaluationVO, String delivery_Man) {
		System.out.println("EvaluationVO=>" + EvaluationVO + "delivery_Man=>" + delivery_Man);
		ModelAndView mav = new ModelAndView();
		service.evalInsert(EvaluationVO);
		System.out.println("getGoods_Num=>" + EvaluationVO.getGoods_Num());
		DeliveryVO changeState = service.changeState(EvaluationVO.getGoods_Num());
		service.avgEval(delivery_Man);
		System.out.println(changeState);
		mav.addObject("EvaluationVO", EvaluationVO);
		mav.setViewName("index");
		return mav;
	}

}
