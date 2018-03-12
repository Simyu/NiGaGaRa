package kr.nigagara.teamalpha.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class GoodsController {
	@Autowired //자동으로 객체 매핑!
	GoodsService service;
	
	@RequestMapping(value = "goods/insert.do", method = RequestMethod.POST)
	public ModelAndView goodsInsert(GoodsVO GoodsVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println(GoodsVO);
		service.goodsInsert(GoodsVO);
		mav.addObject("GoodsVO", GoodsVO);
		mav.setViewName("match");
		return mav;
	}
	
}
