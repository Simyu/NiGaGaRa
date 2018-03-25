package kr.nigagara.teamalpha.goods;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.nigagara.teamalpha.delivery.DeliveryVO;

@Controller
public class GoodsController {
	@Autowired // 자동으로 객체 매핑!
	GoodsService service;
	@Autowired 
	StartLoc loc;
	
	@RequestMapping(value = "goods/insert.do", method = RequestMethod.POST)
	public ModelAndView goodsInsert(GoodsVO GoodsVO) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Double> sendlist;
		ArrayList<Double> receiverlist;
		sendlist = loc.sendlocation(GoodsVO);
		receiverlist = loc.receivelocation(GoodsVO);
		System.out.println("보내는사람 위도 경도 = "+sendlist.get(0)+sendlist.get(1));
		System.out.println("받는사람 위도 경도 = "+receiverlist.get(0)+receiverlist.get(1));
		int GoodsNum =service.goodsInsert(GoodsVO);
		System.out.println("selectKey"+GoodsNum);
		GoodsVO.setGoods_Num(GoodsNum);
		System.out.println(GoodsVO);
		mav.addObject("GoodsVO", GoodsVO);
		mav.addObject("send_loccode", sendlist);
		mav.addObject("receive_loccode", receiverlist);
		mav.setViewName("match");
		return mav;
	}

	@RequestMapping(value = "/goods/match.do", method = RequestMethod.POST)
	public ModelAndView match(GoodsVO GoodsVO) {
		ModelAndView mav = new ModelAndView();
		ArrayList<Double> sendlist;
		System.out.println("match : "+ GoodsVO);
		sendlist = loc.sendlocation(GoodsVO);
		
		mav.addObject("GoodsVO", GoodsVO);
		mav.addObject("send_loccode", sendlist);
		mav.setViewName("goods_match");
		return mav;
	}
	
	// 신청 목록 리스트
	@RequestMapping("/goods/list.do")
	public ModelAndView list(String mem_id){
		ModelAndView mav = new ModelAndView();
		List<GoodsVO> requestlist = service.requestlist(mem_id);
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
