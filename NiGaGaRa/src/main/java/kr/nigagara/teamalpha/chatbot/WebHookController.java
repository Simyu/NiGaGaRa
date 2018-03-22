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
		// System.out.println(req);
		JSONParser parser = new JSONParser();
		JSONObject ret = new JSONObject();
		String rumNum = "**";
		try {
			JSONObject reqobj = (JSONObject) parser.parse(req);
			JSONObject result = (JSONObject) reqobj.get("result");
			JSONObject parameter = (JSONObject) result.get("parameters");
			rumNum += (String) parameter.get("roomnum");
			ret.put("speech", "�ȳ�!! ���� �������� �Ծ�!" + rumNum);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			ret.put("speech", "��...���� �߸��Ȱ� ���� �Ф���");
		}
		return ret.toJSONString();
	}

}
