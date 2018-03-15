package kr.nigagara.teamalpha.delivery;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@ServerEndpoint("/match")
public class matchingServer {

	private static final Set<matchingServer> connections = new CopyOnWriteArraySet<matchingServer>();

	private double lon;
	private double lan;
	private Session session;
	private String id;
	
	@OnOpen
	public void start(Session session) {
		this.session = session;
		connections.add(this);
	}
	
	@OnClose
	public void end() {
		connections.remove(this);
	}
	
	@OnMessage
	public void incoming(String message) {
		System.out.println("message : "+ message);
		
		JSONParser parser = new JSONParser();
		try {
			JSONObject object = (JSONObject) parser.parse(message);
			if (object.get("pro_type").equals("deli_man")) {
			/*	lon = object.get("lon_delivery");
				lat = (double)object.get("lat_delivery");*/
			//json 파싱하는 부분 if else
			//거리계산하는 함수
			
				sendTo(message, id);
			}
			}catch(ParseException e) {
				e.printStackTrace();
		}
		
	}
	
	private void sendTo(String message, String to) {
		for (matchingServer client : connections) {
			
			
			if (client.id.equals(to)) {
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
				
				break;
				
			} // if end
			
		} // for end
	}
	
}
