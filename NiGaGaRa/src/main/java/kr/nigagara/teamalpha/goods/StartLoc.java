package kr.nigagara.teamalpha.goods;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class StartLoc {
	BufferedReader in = null;

	public StartLoc() {

	}

	public ArrayList<Double> sendlocation(GoodsVO vo) {
		ArrayList<Double> result = new ArrayList<Double>();
		try {
			JSONParser parser = new JSONParser();
			String send_address = vo.getSender_Addr();
			String[] temp = send_address.split(" \\(");
			send_address = URLEncoder.encode(temp[0], "UTF-8");
			URL url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address=" + send_address
					+ "&key=AIzaSyA87HiOptCKDOVQgI8_ahGbabQibxh4-6s");

			BufferedInputStream bis = new BufferedInputStream(url.openStream());
			StringBuffer sb = new StringBuffer();
			int data = 0;
			while (true) {
				data = bis.read();
				if (data == -1) {
					break;
				}
				sb.append((char) data);

			}

			/*
			 * while (bis.available() > 0) { sb.append((char) bis.read()); }
			 */
			// System.out.println("sb : " + sb.toString());
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONArray results = (JSONArray) obj.get("results");
			System.out.println("results" + results);

			JSONObject result0 = (JSONObject) results.get(0);
			System.out.println("result0" + result0);

			JSONObject geometry = (JSONObject) result0.get("geometry");
			JSONObject location = (JSONObject) geometry.get("location");
			Double lat = (Double) location.get("lat");
			Double lng = (Double) location.get("lng");

			result.add(lat);
			result.add(lng);
			System.out.println(lat + "   " + lng);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}

	public ArrayList<Double> receivelocation(GoodsVO vo) {
		ArrayList<Double> result = new ArrayList<Double>();
		try {
			JSONParser parser = new JSONParser();
			String receive_address = vo.getReceiver_Addr();
			String[] temp = receive_address.split(" \\(");
			receive_address = URLEncoder.encode(temp[0], "UTF-8");
			URL url = new URL("https://maps.googleapis.com/maps/api/geocode/json?address=" + receive_address
					+ "&key=AIzaSyA87HiOptCKDOVQgI8_ahGbabQibxh4-6s");

			BufferedInputStream bis = new BufferedInputStream(url.openStream());
			StringBuffer sb = new StringBuffer();
			int data = 0;
			while (true) {
				data = bis.read();
				if (data == -1) {
					break;
				}
				sb.append((char) data);

			}

			/*
			 * while (bis.available() > 0) { sb.append((char) bis.read()); }
			 */
			// System.out.println("sb : " + sb.toString());
			JSONObject obj = (JSONObject) parser.parse(sb.toString());
			JSONArray results = (JSONArray) obj.get("results");
			System.out.println("results" + results);

			JSONObject result0 = (JSONObject) results.get(0);
			System.out.println("result0" + result0);

			JSONObject geometry = (JSONObject) result0.get("geometry");
			JSONObject location = (JSONObject) geometry.get("location");
			Double lat = (Double) location.get("lat");
			Double lng = (Double) location.get("lng");

			result.add(lat);
			result.add(lng);
			System.out.println(lat + "   " + lng);
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;

	}
}