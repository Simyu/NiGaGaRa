package kr.nigagara.teamalpha.delivery;

import java.util.List;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.nigagara.teamalpha.member.MemberVO;
import kr.nigagara.teamalpha.sms.SMSSendMethod;

@Controller
public class DeliveryController {
	@Autowired
	DeliveryService service;

	@RequestMapping("/delivery/deliverylist.do")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<DeliveryVO> deliverylist = service.list();
		mav.addObject("deliverylist", deliverylist);
		mav.setViewName("deliverylist");
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

	// qr리더기
	@RequestMapping(value = "/delivery/qrread.do", method = RequestMethod.GET)
	public String qrread() {

		return "delivery_qrread";
	}

	@RequestMapping(value = "/delivery/qrscan.do", method = RequestMethod.POST)
	public ModelAndView qrread(String Goods_Num) {
		ModelAndView mav = new ModelAndView();
		DeliveryVO changeState = service.changeState(Goods_Num);
		DeliveryVO stateResult = service.stateResult(Goods_Num);// delivery_state가져오기
		String match_State = service.matchState(Goods_Num);

		if (match_State.equals("배송전")) {
			service.matchState1(Goods_Num);
		} else if (match_State.equals("배송중")) {
			service.matchState2(Goods_Num);
		}

		String msg = "";
		if (stateResult.getDelivery_State().equals("2")) {
			msg = "배송 시작합니다.";
		} else if (stateResult.getDelivery_State().equals("3")) {
			msg = "배송 완료되었습니다.";
			int res = service.paymentInsert1(stateResult);
			res = service.paymentInsert2(stateResult);
		} else {
			msg = "등록이 안되었거나 이미 평가까지 처리된 물품입니다.";
		}
		mav.addObject("msg", msg);
		mav.setViewName("delivery_qrresult");
		return mav;
	}

	@RequestMapping("/delivery/start.do")
	public String match() {

		return "delivery_start";
	}

	@RequestMapping(value = "/delivery/insert.do", method = RequestMethod.POST)
	public @ResponseBody String insert(@RequestBody String jsondata) {
		//System.err.println("jsondata : " + jsondata);
		JSONParser parser = new JSONParser();
		JSONObject object;
		int result = 0;
		try {
			object = (JSONObject)parser.parse(jsondata);

			String delivery_state = (String) object.get("delivery_state");
			String sender = (String) object.get("sender_id");
			String delivery_man = (String) object.get("delivery_man");
			int goods_num = Integer.parseInt((String) object.get("goods_Num"));
			String receiver_Tel = (String) object.get("receiver_Tel");
			
			DeliveryVO vo = new DeliveryVO();
			vo.setDelivery_Man(delivery_man);
			vo.setSender(sender);
			vo.setGoods_Num(goods_num);
			vo.setDelivery_State(delivery_state);
			result = service.insert(vo);
			
			SMSSendMethod smsSend = new SMSSendMethod();
			smsSend.SMSSend(receiver_Tel, "http://chart.apis.google.com/chart?cht=qr&chs=500x500&chl="+goods_num+"&choe=UTF-8");
			
		} catch (ParseException e) 
		{
			e.printStackTrace();
		}

		if (result > 0) {
			System.out.println("삽입 성공");
			return "tt";
		}
		return "삽입실패";
	}
	

}
