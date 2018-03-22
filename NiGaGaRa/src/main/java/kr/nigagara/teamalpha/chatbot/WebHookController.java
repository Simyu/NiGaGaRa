package kr.nigagara.teamalpha.chatbot;

import java.io.BufferedInputStream;
import java.net.URL;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

@Controller
public class WebHookController {
	@RequestMapping(value = "/webhooktest", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	public @ResponseBody String test(@RequestBody String req) {
		// System.out.println(req);
		JSONObject ret = new JSONObject();
		JSONParser parser = new JSONParser();
		String speech = "";
		try {
			JSONObject reqobj = (JSONObject) parser.parse(req);
			JSONObject result = (JSONObject) reqobj.get("result");
			String action = (String) result.get("action");

			if (action.equals("top10")) {
				Document document = Jsoup.connect("https://www.daum.net/").get();

				if (document != null) {
					Elements elements = document.select(
							"#mArticle > div.cmain_tmp > div.section_media > div.hotissue_builtin.hide > div.realtime_part > ol > li > div > div:nth-child(2) > span.txt_issue > a");

					if (elements != null) {
						speech = "현재 실시간 검색어 순위는 이거에요!! <br>";
						int count = 1;
						for (Element element : elements) {
							speech += count + "위 : " + element.text() + "<br>";
							count++;
						}
					} else {
						speech = "실시간 검색어를 조회할 수 없어요 ㅠㅁㅠ";
					}
				} else {
					speech = "뭔가 잘못됬어요!";
				}

			} else if (action.equals("cost")) {
				JSONObject parameter = (JSONObject) result.get("parameters");
				JSONObject weight = (JSONObject) parameter.get("weight");
				long num = (Long) weight.get("number");

				speech = "최소요금은 " + ((100 * (double) num) + 4000) + "원 입니다.";
				
			} else if (action.equals("weather")) {
				DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
				DocumentBuilder documentBuilder = factory.newDocumentBuilder();
				String realUrl = "http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
				URL url = new URL(realUrl);
				BufferedInputStream bufferedInputStream = new BufferedInputStream(url.openStream());

				org.w3c.dom.Document document = documentBuilder.parse(bufferedInputStream);
				org.w3c.dom.Element root = document.getDocumentElement();
				NodeList items = root.getElementsByTagName("wf");
				Node node = items.item(0);
				
				speech = node.getTextContent();

			} else {
				speech = "테스트중";
			}
		} catch (Exception e) {
			e.printStackTrace();
			speech = "뭔가 잘못됬어요!";

		}
		ret.put("speech", speech);
		return ret.toJSONString();
	}

}
