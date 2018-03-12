package kr.nigagara.teamalpha.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class GoodsController {
	@Autowired // 자동으로 객체 매핑!
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

	// 신청 목록 리스트
	@RequestMapping("/goods/list.do")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> requestlist = service.requestlist();
		System.out.println(requestlist);
		mav.addObject("requestlist", requestlist);
		mav.setViewName("request_list");
		return mav;
	}	
	//선택 상품 상세정보
	@RequestMapping("/goods/detail.do")
	public ModelAndView detail(String goods_Num) {
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> requestdetail = service.requestdetail(goods_Num);
		System.out.println(requestdetail);
		mav.addObject("requestdetail", requestdetail);
		mav.setViewName("request_detail");
		return mav;
	}
	//상품 수정
	@RequestMapping(value = "goods/edit.do", method = RequestMethod.POST)
		public ModelAndView edit(GoodsVO GoodsVO) {
			ModelAndView mav = new ModelAndView();
			int requestedit = service.requestedit(GoodsVO);
			System.out.println(requestedit);
			mav.setViewName("index");
			return mav;
		}
	//qr코드 보기
	@RequestMapping(value = "/goods/qrcode.do", method = RequestMethod.GET)
	public ModelAndView qrcode(String goods_Num) {
		ModelAndView mav = new ModelAndView();
		System.out.println("qrcode view");
		mav.addObject("goods_Num", goods_Num);
		mav.setViewName("request_qr");
		return mav;
	}

}
