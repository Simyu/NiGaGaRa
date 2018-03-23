package kr.nigagara.teamalpha.chatbot;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class WebHookController {
	@RequestMapping(value = "/webhooktest", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String test(@RequestBody String req) {
		//System.out.println(req);
		JSONParser parser = new JSONParser();
		String rumNum = "**";
		try {
			JSONObject reqobj = (JSONObject) parser.parse(req);
			JSONObject result = (JSONObject) reqobj.get("result");
			JSONObject parameter = (JSONObject) result.get("parameters");
			 rumNum += (String) parameter.get("roomnum");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JSONObject ret = new JSONObject();
		ret.put("speech", "안녕!! 나는 서버에서 왔어!"+rumNum);
		return ret.toJSONString();
	}

}
