package kr.nigagara.teamalpha.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class GoodsController {
	@Autowired // �옄�룞�쑝濡� 媛앹껜 留ㅽ븨!
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

	// �떊泥� 紐⑸줉 由ъ뒪�듃
	@RequestMapping("/goods/list.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> requestlist = service.requestlist();
		System.out.println(requestlist);
		mav.addObject("requestlist", requestlist);
		mav.setViewName("request_list");
		return mav;
	}

	// �꽑�깮 �긽�뭹 �긽�꽭�젙蹂�
	@RequestMapping("/goods/detail.do")
	public ModelAndView detail(String goods_Num) {
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> requestdetail = service.requestdetail(goods_Num);
		System.out.println(requestdetail);
		mav.addObject("requestdetail", requestdetail);
		mav.setViewName("request_detail");
		return mav;
	}

	// �긽�뭹 �닔�젙
	@RequestMapping(value = "goods/edit.do", method = RequestMethod.POST)
	public ModelAndView edit(GoodsVO GoodsVO) {
		ModelAndView mav = new ModelAndView();
		int requestedit = service.requestedit(GoodsVO);
		System.out.println(requestedit);
		mav.setViewName("index");
		return mav;
	}

	// qr肄붾뱶 蹂닿린
	@RequestMapping(value = "/goods/qrcode.do", method = RequestMethod.GET)
	public ModelAndView qrcode(String goods_Num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("qrcode view");
		mav.addObject("goods_Num", goods_Num);
		mav.setViewName("request_qr");
		return mav;
	}
}
