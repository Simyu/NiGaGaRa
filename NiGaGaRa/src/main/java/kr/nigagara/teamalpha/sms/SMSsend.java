package kr.nigagara.teamalpha.sms;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.InetAddress;
import java.net.Socket;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SMSsend
 */

@WebServlet(name = "smssend", urlPatterns = { "/smssend.do" })
public class SMSsend extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 필요한 매개변수는 rphone과 ,sphone
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String action = "";
		try {
			action = SMSService.nullcheck(request.getParameter("action"), "");
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		if (action.equals("go")) {

			String sms_url = "";
			// 코드분석 sms_url은 /로 구분할 예정
			sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청
																	// URL
			String user_id = SMSService.base64Encode("akros"); // SMS아이디
			String secure = SMSService.base64Encode("c193e766d06e00f7865a429f10ad3e2f ");// 인증키
			String msg = "";
			String rphone = "";
			String sphone1 = "010";
			String sphone2 = "8553";
			String sphone3 = "7314";
			String rdate = "";
			String rtime = "";
			String mode = "";
			try {
				msg = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("msg"), ""));
				rphone = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("rphone"), ""));
				sphone1 = SMSService.base64Encode(sphone1);
				sphone2 = SMSService.base64Encode(sphone2);
				sphone3 = SMSService.base64Encode(sphone3);
				rdate = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("rdate"), ""));
				rtime = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("rtime"), ""));
				mode = SMSService.base64Encode("1");
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			String subject = "";
			try {
				if (SMSService.nullcheck(request.getParameter("smsType"), "").equals("L")) {
					subject = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("subject"), ""));
				}
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			String testflag = "";
			String destination = "";
			String repeatFlag = "";
			String repeatNum = "";
			String repeatTime = "";
			String returnurl = "";
			String nointeractive = "";
			String smsType = "";

			try {
				testflag = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("testflag"), ""));
				destination = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("destination"), ""));
				repeatFlag = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("repeatFlag"), ""));
				repeatNum = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("repeatNum"), ""));
				repeatTime = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("repeatTime"), ""));
				returnurl = SMSService.nullcheck(request.getParameter("returnurl"), "");
				nointeractive = SMSService.nullcheck(request.getParameter("nointeractive"), "");
				smsType = SMSService.base64Encode(SMSService.nullcheck(request.getParameter("smsType"), ""));

			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			// 스플릿...
			String[] host_info = sms_url.split("/");// https:
			String host = host_info[2];// host=/sslsms.cafe24.com
			String path = "/" + host_info[3];// path=/sms_sender.php
			int port = 80;

			// 데이터 맵핑 변수 정의
			String arrKey[] = new String[] { "user_id", "secure", "msg", "rphone", "sphone1", "sphone2", "sphone3",
					"rdate", "rtime", "mode", "testflag", "destination", "repeatFlag", "repeatNum", "repeatTime",
					"smsType", "subject" };
			String valKey[] = new String[arrKey.length];
			valKey[0] = user_id;
			valKey[1] = secure;
			valKey[2] = msg;
			valKey[3] = rphone;
			valKey[4] = sphone1;
			valKey[5] = sphone2;
			valKey[6] = sphone3;
			valKey[7] = rdate;
			valKey[8] = rtime;
			valKey[9] = mode;
			valKey[10] = testflag;
			valKey[11] = destination;
			valKey[12] = repeatFlag;
			valKey[13] = repeatNum;
			valKey[14] = repeatTime;
			valKey[15] = smsType;
			valKey[16] = subject;

			String boundary = "";
			Random rnd = new Random();
			String rndKey = Integer.toString(rnd.nextInt(32000));
			MessageDigest md = null;
			try {
				md = MessageDigest.getInstance("MD5");
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			byte[] bytData = rndKey.getBytes();
			md.update(bytData);
			byte[] digest = md.digest();
			for (int i = 0; i < digest.length; i++) {
				boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
			}
			boundary = "---------------------" + boundary.substring(0, 11);

			// 본문 생성
			String data = "";
			String index = "";
			String value = "";
			for (int i = 0; i < arrKey.length; i++) {
				index = arrKey[i];
				value = valKey[i];
				data += "--" + boundary + "\r\n";
				data += "Content-Disposition: form-data; name=\"" + index + "\"\r\n";
				data += "\r\n" + value + "\r\n";
				data += "--" + boundary + "\r\n";
			}

			// out.println(data);
			// 유효성체크
			if (request.getParameter("rphone").replaceAll("-", "").length() < 8
					|| request.getParameter("rphone").replaceAll("-", "").length() > 11
					|| request.getParameter("rphone").charAt(0) != '0') {
				System.out.print("<script>alert('핸드폰번호를 바르게 입력하세요')</script>");
			} else {
				InetAddress addr = InetAddress.getByName(host);
				Socket socket = new Socket(host, port);
				// 헤더 전송
				BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
				wr.write("POST " + path + " HTTP/1.0\r\n");
				wr.write("Content-Length: " + data.length() + "\r\n");
				wr.write("Content-type: multipart/form-data, boundary=" + boundary + "\r\n");
				wr.write("\r\n");

				// 데이터 전송
				wr.write(data);
				wr.flush();

				// 결과값 얻기
				BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
				String line;
				String alert = "";
				ArrayList tmpArr = new ArrayList();
				while ((line = rd.readLine()) != null) {
					tmpArr.add(line);
				}
				wr.close();
				rd.close();

				String tmpMsg = (String) tmpArr.get(tmpArr.size() - 1);
				String[] rMsg = tmpMsg.split(",");
				String Result = rMsg[0]; // 발송결과
				String Count = ""; // 잔여건수
				if (rMsg.length > 1) {
					Count = rMsg[1];
				}

				// 발송결과 알림
				if (Result.equals("success")) {
					alert = "성공적으로 발송하였습니다.";
					alert += " 잔여건수는 " + Count + "건 입니다.";
				} else if (Result.equals("reserved")) {
					alert = "성공적으로 예약되었습니다";
					alert += " 잔여건수는 " + Count + "건 입니다.";
				} else if (Result.equals("3205")) {
					alert = "잘못된 번호형식입니다.";
				} else {
					alert = "[Error]" + Result;
				}

				System.out.println(nointeractive);

				if (nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success"))
						&& !(Result.equals("reserved"))) {
					System.out.println("<script>alert('" + alert + "')</script>");
				} else if (!(nointeractive.equals("1"))) {
					System.out.println("<script>alert('" + alert + "')</script>");
				}
			}
			System.out.println("<script>location.href='" + returnurl + "';</script>");
		}
	}
}