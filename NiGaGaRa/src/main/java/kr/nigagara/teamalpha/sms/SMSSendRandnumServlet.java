package kr.nigagara.teamalpha.sms;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "sms/sendrand", urlPatterns = { "/sms/sendrand.do" })
public class SMSSendRandnumServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=euc-kr");
		response.setHeader("cache-control", "no-cache,no-store");
		PrintWriter printWriter = response.getWriter();

		String rand = request.getParameter("rand");
		String tel = request.getParameter("tel");
		
		System.out.println(tel);
		
		SMSSendMethod test = new SMSSendMethod();
		
		String msg = "[HaveANiceDream] 인증을 위해 인증번호 ["+rand+"]을 입력해주세요";
		
		test.SMSSend(tel+","+tel, msg);
		
		printWriter.println("문자를 통해 받은 인증번호를 입력해주세요");
	}

}
