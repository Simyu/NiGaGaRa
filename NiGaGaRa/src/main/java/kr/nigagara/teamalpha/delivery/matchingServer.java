package kr.nigagara.teamalpha.delivery;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.eclipse.jdt.core.BuildJarIndex;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import kr.nigagara.teamalpha.goods.GoodsVO;

@ServerEndpoint("/match")
public class matchingServer {

	private static final Set<matchingServer> connections = new CopyOnWriteArraySet<matchingServer>();
	private static final Set<matchingServer> connections2 = new CopyOnWriteArraySet<matchingServer>();

	//private static final Map<String, GoodsVO> productList = new Map<String, GoodsVO>();

	private Session session;
	private Session session2;
	String deli_man_lon;
	String deli_man_id;
	String deli_man_lat;
	
	@OnOpen
	public void start(Session session) {
		this.session = session;
		connections.add(this);
		System.out.println("클라이언트 접속");
	}
	
	@OnClose
	public void end() {
		connections.remove(this);
		System.out.println("클라이언트 나감");
	}
	
	@OnError // 에러났어요!!!!
	public void onError(Throwable t) throws Throwable {
		t.printStackTrace();
		System.out.println("클라이언트 나감");
	}
	
	@OnMessage
	public void incoming(String message) {
		System.out.println("message : "+ message);
		String deli_man_lon;
		String deli_man_id;
		String deli_man_lat;
		JSONParser parser = new JSONParser();
		try {
			JSONObject object = (JSONObject) parser.parse(message);
			if (object.get("pro_type").equals("deli_man")) {
				deli_man_lon = object.get("lon_delivery").toString();
				deli_man_id = (String)object.get("id");
				deli_man_lat = object.get("lat_delivery").toString();
				
				
				
			//json 파싱하는 부분 if else
			//거리계산하는 함수
			}else if(object.get("pro_type").equals("product")) {
			
				 sendTo(message);
/*				 String pro_goods_Num = (String)object.get("goods_Num");
				 String pro_goods_Name = (String)object.get("goods_Name");
				 String pro_weight = (String)object.get("weight");
				 String pro_quantity = (String)object.get("quantity");
				 String pro_estimated_Price = (String)object.get("estimated_Price");
				 String pro_receiver_Name = (String)object.get("receiver_Name");
				 String pro_receiver_zipcode = (String)object.get("receiver_zipcode");
				 String pro_receiver_Addr = (String)object.get("receiver_Addr");
				 String pro_receiver_Tel = (String)object.get("receiver_Tel");
				 String pro_sender_zipcode = (String)object.get("sender_zipcode");
				 String pro_sender_Addr = (String)object.get("sender_Addr");
				 String pro_delivery_Tool = (String)object.get("delivery_Tool");
				 String pro_goods_Msg = (String)object.get("goods_Msg");
				 String pro_match_State = (String)object.get("match_State");
				 String pro_sender_id = (String)object.get("sender_id");
				 String pro_receiver_Addr_detail = (String)object.get("receiver_Addr_detail");
				 String pro_sender_Addr_detail = (String)object.get("sender_Addr_detail");*/
				 
			}else if(object.get("pro_type").equals("result")) {
				System.out.println(object.toJSONString());
				System.out.println("message=>"+message);
				sendTo(message);
			}
			else {
				
			}
				
				
			
			}catch(ParseException e) {
				e.printStackTrace();
		}
		
	}
	
	private void sendTo(String message) {
		System.out.println("상품정보 보내는중");
		for (matchingServer client : connections) {
			
				try {
					
					synchronized (client) {
						client.session.getBasicRemote().sendText(message);
					}
					
				} catch (IOException e) {
					e.printStackTrace();
					connections.remove(client);

					try {
						client.session.close();
					} catch (IOException e1) {
						e1.printStackTrace();
					}

				} 
				
				//break;
				
			 // if end
			
		} // for end
		System.out.println("상품정보 발송완료");
	}
	
}
