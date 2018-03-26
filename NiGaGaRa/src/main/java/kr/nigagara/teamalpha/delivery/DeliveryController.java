package kr.nigagara.teamalpha.delivery;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/delivery/start.do")
	public String match() {
		
		return "delivery_start";
	}

	@RequestMapping(value = "/delivery/insert.do", method = RequestMethod.POST)
	public  @ResponseBody void insert(@RequestBody String jsondata) {
		
		JSONParser parser = new JSONParser();
		JSONObject object;
		int result =0;
		try {
			object = (JSONObject) parser.parse(jsondata);
		
		String delivery_state = (String)object.get("delivery_state");
		String sender = (String)object.get("sender_id");
		String delivery_man = (String)object.get("delivery_man");
		int goods_num = Integer.parseInt((String)object.get("goods_Num"));
		
		DeliveryVO vo = new DeliveryVO();
		vo.setDelivery_Man(delivery_man);
		vo.setSender(sender);
		vo.setGoods_Num(goods_num);
		vo.setDelivery_State(delivery_state);
		result = service.insert(vo);
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		if(result>0) {
		System.out.println("삽입 성공");
		
		}
	}

}
